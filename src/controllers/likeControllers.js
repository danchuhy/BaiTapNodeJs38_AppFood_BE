import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const conn = initModels(sequelize);

const getLike = async (req, res) => {
    try{
        let data = await conn.like_res.findAll()
        res.send(data);
    }catch(error) {
        res.send(`BE error: ${error}`)
    }
};

const getLikeByUserId = async (req, res) => {
    try {
        const { user_id } = req.params;

        const data = await conn.like_res.findAll({
            where: {
                user_id
            }
        });

        res.send(data);
    } catch (error) {
        res.status(500).send(`BE error: ${error}`);
    }
};

const getLikeByRestaurantId = async (req, res) => {
    try {
        const { res_id } = req.params;

        if (!res_id) {
            return res.status(400).send("Invalid res_id parameter");
        }

        const data = await conn.like_res.findAll({
            where: {
                res_id: res_id
            }
        });

        res.send(data);
    } catch (error) {
        res.status(500).send(`BE error: ${error}`);
    }
};

const createLike = async (req, res) => {
    try {
        
        let {user_id, res_id, date_rate } = req.body;
        console.log(user_id)
        let newData = {
            user_id: user_id,
            res_id: res_id,
            date_rate: date_rate,
        }
        await conn.like_res.create(newData);
        res.send("Create like successfull");
    } catch (error) {
        res.send(`BE error: ${error}`);
    }
};

const deleteLike = async (req, res) => {
    try {
        let { like_id } = req.params;
        await conn.like_res.destroy({
            where: {
                like_id: like_id
            }
        });

        res.send("Delete like successfull!");
    } catch (error) {
        res.send(`BE error: ${error}`);
    }
}

export {
    getLike,
    getLikeByUserId,
    getLikeByRestaurantId,
    createLike,
    deleteLike
}