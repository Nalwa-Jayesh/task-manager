import express from 'express';
import authRouter from "./routes/auth";
import taskRouter from "./routes/tasks";

const app = express();

app.use(express.json());
app.use('/auth', authRouter);
app.use('/tasks', taskRouter)

app.get("/", (req, res) => {
    res.send("Welcome to my app!!!");
})

app.listen(8000, () => {
    console.log("Server running on port 8000");
});