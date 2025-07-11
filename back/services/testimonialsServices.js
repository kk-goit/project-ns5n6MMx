import { Testimonial } from '../db/models/testimonials.js';
import { User } from '../db/models/users.js';

async function listTestimonials() {
    return await Testimonial.findAll({
        include: [
            {
                attributes: ['id', 'name'],
                model: User,
                as: 'user',
            },
        ],
    });
}

export default {
    listTestimonials,
};