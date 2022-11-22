import express from 'express'
import WalletController from '../controllers/WalletController.js'

const walletRouter = express.Router()

walletRouter.post('/', WalletController.createWallet)
walletRouter.get('/', WalletController.getUserWallet)
walletRouter.put('/:id', WalletController.updateWallet)
walletRouter.delete('/:id', WalletController.deleteWallet)

export default walletRouter
