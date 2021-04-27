import express from 'express'
import db from './database/index.js'
import config from './database/config.js'

import indexRouter from './routes/index.js'
import regionsRouter from'./routes/regions.js'
import countriesRouter from './routes/countries.js'
import queriesRouter from './routes/queries.js'

let app = express();


app.use(express.json());
app.use(express.urlencoded({ extended: false }));


app.use('/', indexRouter);
app.use('/regions', regionsRouter);
app.use('/countries', countriesRouter);
app.use('/queries', queriesRouter)


const port = 3000
db.sequelize
    .sync()
    .then(() => {
        app.listen(port, () => console.log("server is running on port " + port));
    })
    .catch((err) => console.log(err));

export default app