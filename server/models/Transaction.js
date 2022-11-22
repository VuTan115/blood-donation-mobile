import mongoose from 'mongoose'

const { Schema } = mongoose
const { ObjectId } = Schema

const TransactionModel = new Schema(
  {
    amount: {
      type: Number,
      required: true,
    },
    is_output: {
      type: Boolean,
      default: true,
    },
    user_id: {
      type: String,
      required: true,
    },
    category: {
      type: ObjectId,
      ref: 'Category'
    },
    wallet: {
      type: ObjectId,
      required: true,
      ref: 'Wallet'
    }
  },
  {
    timestamps: { createdAt: 'created_at', updatedAt: 'updated_at' },
  }
)

const Transaction = mongoose.model('Transaction', TransactionModel)

export default Transaction
