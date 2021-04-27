import express from 'express'
import db from '../database/index.js'

const router = express.Router();

router.get('/', async function (req, res) {
    try {
        const result = await db.regions.findAll()
        res.status(result.length === 0 ? 404 : 200).send(result)
    } catch (e) {
        console.log(e)
        res.status(500).send(e)
    }
})

router.get('/:region_id', async function (req, res) {
    try {
        const result = await db.regions.findAll({where: { region_id: req.params.region_id }})
        res.status(result.length === 0 ? 404 : 200).send(result)
    } catch (e) {
        console.log(e)
        res.status(500).send(e)
    }
})

router.post('/', async function (req, res) {
    try {
        if (!req.body.region.region_id || !req.body.region.region_name) {
            res.status(400).send({"error": "missing parameters"})
            return
        }
        const result = await db.regions.create(req.body.region)
        res.status(201).send(result)
    } catch (e) {
        console.log(e)
        res.status(500).send(e)
    }
})

router.delete('/:region_id', async function (req, res) {
    try {
        const result = await db.regions.destroy({where: { region_id: req.params.region_id }})
        res.sendStatus(204)
    } catch (e) {
        res.status(500).send(e)
    }
})

router.put('/:region_id', async function (req, res) {
    try {

        const { region_name } = req.body.region
        if (!region_name) {
            res.status(400).send({"error": "missing parameters"})
            return
        }

        const result = await db.regions.update({ region_name  } , {where: { region_id: req.params.region_id }})
        res.status(200).send(result)
        return
    } catch (e) {
        res.status(500).send(e)
    }
})
export default router
