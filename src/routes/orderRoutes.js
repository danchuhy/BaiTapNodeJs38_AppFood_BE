import express from 'express';
import { createOrder, deleteOrder  } from '../controllers/orderControllers.js';

const orderRoutes = express.Router();

orderRoutes.post("/create-order", createOrder);
orderRoutes.put("/delete-order/:order_id", deleteOrder);



export default orderRoutes;