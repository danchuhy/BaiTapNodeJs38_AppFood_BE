import express from 'express';
import { getLike, getLikeByUserId, getLikeByRestaurantId, createLike, deleteLike  } from '../controllers/likeControllers.js';
const likeRoutes = express.Router();

likeRoutes.get("/like-list", getLike);
likeRoutes.get("/like-list-by-user/:user_id", getLikeByUserId);
likeRoutes.get("/like-list-by-restaurant/:res_id", getLikeByRestaurantId);
likeRoutes.post("/create-like", createLike);
likeRoutes.put("/delete-like/:like_id", deleteLike);



export default likeRoutes;