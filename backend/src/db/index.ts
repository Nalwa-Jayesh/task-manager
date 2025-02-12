import { Pool } from "pg";
import {drizzle} from "drizzle-orm/node-postgres";
const pool = new Pool({
    connectionString: "postgresql://neondb_owner:npg_mYiE5WBJD2ar@ep-lingering-queen-a1kqm3wt-pooler.ap-southeast-1.aws.neon.tech/neondb?sslmode=require",
});

export const db = drizzle(pool);