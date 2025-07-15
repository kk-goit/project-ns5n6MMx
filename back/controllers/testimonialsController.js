import testimonialsService from '../services/testimonialsServices.js';

export const listTestimonials = async (req, res) => {
    const testimonials = await testimonialsService.listTestimonials();

    res.json(testimonials.map(testimonial => ({
        id: testimonial.id,
        owner: testimonial.user,
        testimonial: testimonial.testimonial,
    })));
}