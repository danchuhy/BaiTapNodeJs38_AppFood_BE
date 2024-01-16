import express from 'express';
import { getRate, getRateByUserId, getRateByRestaurantId, createRate, deleteRate  } from '../controllers/rateControllers.js';
const rateRoutes = express.Router();

// videoRoutes.get("/rate-list-by-restaurant", getRateByRestaurant);
// videoRoutes.get("/rate-list-by-user", getRateByUser);
// videoRoutes.post("/create-rate", createRate);
// videoRoutes.put("/delete-rate/:rateId", deleteRate);

rateRoutes.get("/rate-list", getRate);
rateRoutes.get("/rate-list-by-user/:user_id", getRateByUserId);
rateRoutes.get("/rate-list-by-restaurant/:res_id", getRateByRestaurantId);
rateRoutes.post("/create-rate", createRate);
rateRoutes.put("/delete-rate/:rate_id", deleteRate);

export default rateRoutes;