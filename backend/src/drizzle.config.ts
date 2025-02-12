import { defineConfig } from "drizzle-kit";

export default defineConfig({
    dialect: "postgresql", // Define the database dialect (PostgreSQL)
    schema: "./db/schema.ts", // Path to your schema file
    out: "./drizzle", // Output directory for generated code
    dbCredentials: {
        // Use the connection string provided by Neon
        host: "ep-lingering-queen-a1kqm3wt-pooler.ap-southeast-1.aws.neon.tech", // Host provided by Neon
        port: 5432, // Default PostgreSQL port
        database: "neondb", // Database name
        user: "neondb_owner", // Database user
        password: "npg_mYiE5WBJD2ar", // Database password
        ssl: {
            rejectUnauthorized: false, // Enable SSL and allow self-signed certificates (required by Neon)
        },
    },
});
