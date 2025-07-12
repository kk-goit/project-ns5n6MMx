import express from 'express';
import { getPopularRecipes } from '../controllers/popularRecipeControllers';

const router = express.Router();

router.get('/popular', getPopularRecipes);

export default router;
