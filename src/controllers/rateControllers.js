import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const conn = initModels(sequelize);

const getRate = async (req, res) => {
    try{
        let data = await conn.rate_res.findAll()
        res.send(data);
    }catch(error) {
        res.send(`BE error: ${error}`)
    }
};

const getRateByUserId = async (req, res) => {
    try {
        const { user_id } = req.params;

        const data = await conn.rate_res.findAll({
            where: {
                user_id
            }
        });

        res.send(data);
    } catch (error) {
        res.status(500).send(`BE error: ${error}`);
    }
};

const getRateByRestaurantId = async (req, res) => {
    try {
        const { res_id } = req.params;

        if (!res_id) {
            return res.status(400).send("Invalid res_id parameter");
        }

        const data = await conn.rate_res.findAll({
            where: {
                res_id: res_id
            }
        });

        res.send(data);
    } catch (error) {
        res.status(500).send(`BE error: ${error}`);
    }
};

const createRate = async (req, res) => {
    try {
        let {res_id, user_id, amount, date_rate} = req.body;
        let newData = {
            res_id: res_id,
            user_id: user_id,
            amount: amount,
            date_rate: date_rate,
        }
        // if (res_id && user_id) {
            await conn.rate_res.create(newData);
            res.send("Create rate successful");
        // } else {
        //     res.send("Create rate fail, please check your input");
        // }
    } catch (error) {
        res.send(`BE error: ${error}`);
    }
};

const deleteRate = async (req, res) => {
    try {
        let { rate_id } = req.params;
        await conn.rate_res.destroy({
            where: {
                rate_id: rate_id
            }
        });

        res.send("Delete rate successful!");
    } catch (error) {
        res.send(`BE error: ${error}`);
    }
}

export {
    getRate,
    getRateByUserId,
    getRateByRestaurantId,
    createRate,
    deleteRate,
}