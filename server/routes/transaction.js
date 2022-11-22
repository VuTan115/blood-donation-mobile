import express from 'express'
import TransactionController from '../controllers/TransactionController.js'

const transactionRouter = express.Router()

transactionRouter.get('/', TransactionController.getFilteredTransaction)
transactionRouter.get('/all', TransactionController.getUserTransaction)
transactionRouter.get('/wallet', TransactionController.getTransactionOfWallet)
transactionRouter.post('/', TransactionController.createTransaction)

export default transactionRouter
