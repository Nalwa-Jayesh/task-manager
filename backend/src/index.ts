import express from 'express';
import authRouter from "./routes/auth";
import taskRouter from "./routes/tasks";
import cors from 'cors';

const app = express();
const port = 8000;

app.use(cors());
app.use(express.json());
app.use('/auth', authRouter);
app.use('/tasks', taskRouter)

app.get("/", (req, res) => {
    res.send("Welcome to my app!!!");
})

app.listen(port, () => {
    console.log("Server running on port 8000");
});