import "reflect-metadata";
import express from "express";
import { createConnection } from "typeorm";
import { Event } from "./entity/Event";

const app = express();
app.use(express.json());

createConnection()
  .then(async (connection) => {
    const eventRepository = connection.getRepository(Event);

    app.get("/events/:ssid", async (req, res) => {
      const ssid = req.params.ssid;
      const events = await eventRepository.find({ where: { ssid } });
      res.json(events);
    });

    app.listen(3000, () => {
      console.log("Server running on port 3000");
    });
  })
  .catch((error) => console.log(error));
