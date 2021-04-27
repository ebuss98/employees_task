import Sequelize from 'sequelize'
import pgConfig from'./config.js'

import regions from './models/regions.js'
import countries from './models/countries.js'


const config = pgConfig
console.log(pgConfig)
const sequelize = process.env.DATABASE_URL ?
    new Sequelize(process.env.DATABASE_URL, config) :
    new Sequelize(config.database, config.username, config.password, config)

const db = {}

db.regions = regions(sequelize, Sequelize.DataTypes)
db.countries = countries(sequelize, Sequelize.DataTypes)
//
// db.regions.hasMany(db.countries,{
//     foreignKey: 'region_id'
// })
// db.countries.belongsTo(db.regions)


db.sequelize = sequelize
db.Sequelize = Sequelize
db.op = Sequelize.Op
db.fn = Sequelize.fn


export default db