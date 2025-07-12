const defaultLimit = 5;

export function paginate(array, req) {
    const rawPage = parseInt(req.query.page, 10) || 1;
    const rawLimit = parseInt(req.query.limit, 10) || defaultLimit;

    const limitPerPage = Math.max(1, rawLimit);

    const totalPages = Math.ceil(array.length / limitPerPage);
    const pageNumber = Math.min(Math.max(1, rawPage), totalPages || 1);

    const start = (pageNumber - 1) * limitPerPage;
    const end = start + limitPerPage;

    const sliced = array.slice(start, end);

    return {
        data: sliced,
        pagination: {
            total: array.length,
            page: pageNumber,
            limit: limitPerPage,
            hasMore: pageNumber < totalPages,
        }
    };
}