export default {
        username: process.env.DB_USER || 'postgres',
        password: process.env.DB_PASSWORD || 'postgres',
        database: process.env.DB_NAME || 'employeesdb',
        host: process.env.DB_HOST || 'localhost',
        omitNull: true,
        dialectOptions: {
            use: true,
            ssl: process.env.DB_SSL
        },
        dialect: 'postgres',
        port: process.env.DB_PORT || 5432,
}