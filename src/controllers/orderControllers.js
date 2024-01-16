import initModels from "../models/init-models.js";
import sequelize from "../models/connect.js";

const conn = initModels(sequelize);

const createOrder = async (req, res) => {
    try {
        
        let { user_id, food_id, amount } = req.body;
        let newData = {
            user_id,
            food_id,
            amount,
        }
        await conn.orders.create(newData);
        res.send("Create order successfull");
    } catch (error) {
        res.send(`BE error: ${error}`);
    }
};

const deleteOrder = async (req, res) => {
    try {
        let { order_id } = req.params;
        await conn.orders.destroy({
            where: {
                order_id: order_id
            }
        });

        res.send("Delete order successfull!");
    } catch (error) {
        res.send(`BE error: ${error}`);
    }
}

export {
    createOrder,
    deleteOrder
}