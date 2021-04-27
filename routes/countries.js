import express from 'express'
import db from '../database/index.js'
const router = express.Router();

router.get('/', async function(req, res) {
    try {
        const result =  await db.countries.findAll()
        res.status(result.length === 0 ? 404 : 200).send(result)
    } catch (e) {
        console.log(e)
        res.status(500).send(e)
    }
})

router.get('/:country_id', async function(req, res) {
    try {
        const result =  await db.countries.findAll({ where : { country_id: req.params.country_id } })
        res.status(result.length === 0 ? 404 : 200).send(result)
    } catch (e) {
        console.log(e)
        res.status(500).send(e)
    }
})

router.post('/', async function (req,res) {
    try {
        if (!req.body.country.region_id || !req.body.country.country_id || !req.body.country.country_name) {
            res.status(400).send({"error": "missing parameters"})
            return
        }
        const result = await db.countries.create(req.body.country)
        res.status(201).send(result)
    } catch (e) {
        res.status(500).send(e)
    }
})

router.delete('/:country_id', async function (req, res) {
    try {
        const result =  await db.countries.destroy({where : { country_id: req.params.country_id }})
        res.sendStatus(204)
    } catch (e) {
        res.status(500).send(e)
    }
})

router.put('/:country_id', async function (req, res) {
    try {
        const { region_id, country_name } = req.body.country
        if (!region_id && !country_name) {
            res.status(400).send({"error": "missing parameters in body"})
            return
        }
        const result =  await db.countries.update({ region_id, country_name },
            { where: { country_id: req.params.country_id }})
        res.status(200).send(result)
        return
    } catch (e) {
        console.log(e)
        res.status(500).send(e)
    }
})

export default router
