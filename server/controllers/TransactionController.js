import mongoose from 'mongoose'
import Transaction from '../models/Transaction.js'
import Category from '../models/Category.js'
import Wallet from '../models/Wallet.js'
import getWeekDay from '../helpers/getWeekDay.js'
import getDate from '../helpers/getDate.js'
import getDateForDart from '../helpers/getDateForDart.js'

const { ObjectId } = mongoose.Types

const createTransaction = async (req, res) => {
  const {
    amount, is_output, category, wallet
  } = req.body
  const categoryRecord = await Category.findOne({ name: category })
  const walletRecord = await Wallet.findOne({ name: wallet })
  let newTransaction = new Transaction({
    amount,
    is_output,
    user_id: req.body.user.uid,
    category: categoryRecord._id,
    wallet: walletRecord._id
  })
  try {
    newTransaction = await newTransaction.save()
    await Wallet.findOneAndUpdate({ name: wallet }, {
      $inc: {
        amount: is_output ? -amount : amount
      }
    })
    return res.status(200).json(newTransaction)
  } catch (error) {
    console.log(error)
    return res.status(500).json('server error')
  }
}

const getFilteredTransaction = async (req, res) => {
  const { filter, timestamp } = req.query
  try {
    let transactions
    const reqTimestamp = new Date(timestamp)
    if (filter === 'TransactionFilter.month') {
      transactions = await Transaction.aggregate([
        {
          $match: {
            $and: [
              {
                $expr: {
                  $eq: [
                    {
                      $month: '$created_at',
                    },
                    reqTimestamp.getUTCMonth() + 1,
                  ],
                },
              },
              {
                $expr: {
                  $eq: [
                    {
                      $year: '$created_at',
                    },
                    reqTimestamp.getUTCFullYear(),
                  ],
                },
              },
              {
                $expr: {
                  $eq: ['$user_id', req.body.user.uid],
                },
              },
            ],
          },
        },
        {
          $lookup: {
            from: 'categories',
            localField: 'category',
            foreignField: '_id',
            as: 'category',
          },
        },
        {
          $project: {
            'category.limits_per_month': 0,
          },
        },
      ])
    } else if (filter === 'TransactionFilter.day') {
      const startDay = new Date(reqTimestamp)
      const endDay = new Date(reqTimestamp)
      startDay.setHours(0, 0, 0, 0)
      endDay.setHours(23, 59, 59, 999)
      transactions = await Transaction.aggregate([
        {
          $addFields: {
            creationDate: {
              $dateToString: {
                format: '%Y-%m-%d',
                date: '$created_at',
              },
            },
          },
        },
        {
          $match: {
            $and: [
              {
                $expr: {
                  $gte: ['$created_at', startDay],
                },
              },
              {
                $expr: {
                  $lte: ['$created_at', endDay],
                },
              },
              {
                $expr: {
                  $eq: ['$user_id', req.body.user.uid],
                },
              },
            ],
          },
        },
        {
          $lookup: {
            from: 'categories',
            localField: 'category',
            foreignField: '_id',
            as: 'category',
          },
        },
        {
          $project: {
            'category.limits_per_month': 0,
          },
        },
      ])
    } else {
      // console.log(reqTimestamp)
      // console.log(getWeekDay.getSunday(reqTimestamp))
      // console.log(getWeekDay.getMonday(reqTimestamp))
      transactions = await Transaction.aggregate([
        {
          $match: {
            $and: [
              {
                $expr: {
                  $lte: ['$created_at', getWeekDay.getSunday(reqTimestamp)],
                },
              },
              {
                $expr: {
                  $gte: ['$created_at', getWeekDay.getMonday(reqTimestamp)],
                },
              },
              {
                $expr: {
                  $eq: ['$user_id', req.body.user.uid],
                },
              },
            ],
          },
        },
        {
          $lookup: {
            from: 'categories',
            localField: 'category',
            foreignField: '_id',
            as: 'category',
          },
        },
        {
          $project: {
            'category.limits_per_month': 0,
          },
        },
      ])
    }

    return res.status(200).json(transactions.map((element) => ({
      ...element,
      created_at: getDateForDart(element.created_at)
    })))
  } catch (error) {
    console.log(error)
    return res.status(500).json('server error')
  }
}
const getUserTransaction = async (req, res) => {
  try {
    const transactions = await Transaction.aggregate([
      {
        $match: {
          $and: [
            {
              $expr: {
                $eq: ['$user_id', req.body.user.uid],
              },
            },
          ],
        },
      },
      {
        $lookup: {
          from: 'categories',
          localField: 'category',
          foreignField: '_id',
          as: 'category',
        },
      },
      {
        $project: {
          'category.limits_per_month': 0,
        },
      },
    ])

    return res.status(200).json(transactions)
  } catch (error) {
    console.log(error)
    return res.status(500).json('server error')
  }
}
const getTransactionOfWallet = async (req, res) => {
  try {
    console.log(req.body.user.uid)
    const transactions = await Transaction.aggregate(
      [
        {
          $match: {
            $and: [
              {
                $expr: {
                  $eq: [
                    '$user_id', req.body.user.uid
                  ]
                }
              },
              {
                $expr: {
                  $eq: [
                    '$wallet', ObjectId(req.query.wallet_id)
                  ]
                }
              }
            ]
          }
        }, {
          $lookup: {
            from: 'categories',
            localField: 'category',
            foreignField: '_id',
            as: 'category'
          }
        }, {
          $project: {
            'category.limits_per_month': 0
          }
        }
      ]
    )

    return res.status(200).json(transactions)
  } catch (error) {
    console.log(error)
    return res.status(500).json('server error')
  }
}

const TransactionController = {
  createTransaction,
  getFilteredTransaction,
  getUserTransaction,
  getTransactionOfWallet
}

export default TransactionController
