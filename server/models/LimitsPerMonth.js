import mongoose from 'mongoose'

const { Schema } = mongoose
const { ObjectId } = Schema

const LimitModel = new Schema({
  month: {
    type: Date,
    default: true,
  },
  amount: {
    type: Number,
    required: true,
  },
  user_id: {
    type: String,
    default: null
  },

})

const LimitsPerMonth = mongoose.model('LimitsPerMonth', LimitModel)

export default LimitsPerMonth
