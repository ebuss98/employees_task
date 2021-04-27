export default (sequelize, DataTypes) => {

    let country = sequelize.define(
        'country',
        {
            country_id: {
                allowNull: false,
                primaryKey: true,
                type: DataTypes.STRING(300)
            },
            country_name : {
                allowNull: false,
                type: DataTypes.STRING(300)
            },
            region_id: {
                allowNull: false,
                type: DataTypes.INTEGER,
            }
        },
        {
            timestamps: false,
            underscored: true
        }
    )

    return country
}