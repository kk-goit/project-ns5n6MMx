import testimonialsService from '../services/testimonialsServices.js';
import { paginate } from '../utils/paginationService.js';

export const listTestimonials = async (req, res) => {
    const testimonials = await testimonialsService.listTestimonials();

    const result = paginate(
        testimonials.map(testimonial => ({
            id: testimonial.id,
            owner: testimonial.user,
            testimonial: testimonial.testimonial,
        })),
        req
    );

    res.json(result);
};