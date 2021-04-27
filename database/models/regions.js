export default (sequelize, DataTypes) => {

    let region = sequelize.define(
        'region',
        {
            region_id: {
                allowNull: false,
                primaryKey: true,
                type: DataTypes.INTEGER
            },
            region_name: {
                allowNull: false,
                type: DataTypes.STRING(300)
            }
        },
        {
            timestamps: false
        }
    )

    return region
}