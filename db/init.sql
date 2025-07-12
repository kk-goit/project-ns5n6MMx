--
-- PostgreSQL database dump
--

-- Dumped from database version 14.18 (Debian 14.18-1.pgdg120+1)
-- Dumped by pg_dump version 14.18 (Ubuntu 14.18-0ubuntu0.22.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: areas; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.areas (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.areas OWNER TO backend;

--
-- Name: areas_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.areas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.areas_id_seq OWNER TO backend;

--
-- Name: areas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.areas_id_seq OWNED BY public.areas.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.categories OWNER TO backend;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO backend;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    "desc" text NOT NULL,
    img character varying(1024) NOT NULL
);


ALTER TABLE public.ingredients OWNER TO backend;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO backend;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    title character varying(128) NOT NULL,
    category_id integer NOT NULL,
    area_id integer NOT NULL,
    user_id integer NOT NULL,
    instructions text NOT NULL,
    description character varying(2048) NOT NULL,
    "time" integer NOT NULL,
    thumb character varying(1024) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.recipes OWNER TO backend;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.recipes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipes_id_seq OWNER TO backend;

--
-- Name: recipes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.recipes_id_seq OWNED BY public.recipes.id;


--
-- Name: recipes_ingredients; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.recipes_ingredients (
    recipe_id integer NOT NULL,
    ingredient_id integer NOT NULL,
    measure character varying(128) NOT NULL
);


ALTER TABLE public.recipes_ingredients OWNER TO backend;

--
-- Name: testimonials; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.testimonials (
    id integer NOT NULL,
    user_id integer NOT NULL,
    testimonial character varying(512) NOT NULL
);


ALTER TABLE public.testimonials OWNER TO backend;

--
-- Name: testimonials_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.testimonials_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testimonials_id_seq OWNER TO backend;

--
-- Name: testimonials_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.testimonials_id_seq OWNED BY public.testimonials.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(128) NOT NULL,
    name character varying(256) NOT NULL,
    password character varying(255) NOT NULL,
    avatar character varying(1024) NOT NULL,
    token character varying(255) DEFAULT NULL::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO backend;

--
-- Name: users_follows; Type: TABLE; Schema: public; Owner: backend
--

CREATE TABLE public.users_follows (
    follower_user_id integer NOT NULL,
    followee_user_id integer NOT NULL
);


ALTER TABLE public.users_follows OWNER TO backend;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: backend
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO backend;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: backend
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: areas id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.areas ALTER COLUMN id SET DEFAULT nextval('public.areas_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: recipes id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.recipes ALTER COLUMN id SET DEFAULT nextval('public.recipes_id_seq'::regclass);


--
-- Name: testimonials id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.testimonials ALTER COLUMN id SET DEFAULT nextval('public.testimonials_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: areas; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.areas (id, name) FROM stdin;
1	Ukrainian
2	Italian
3	Moroccan
4	Unknown
5	Thai
6	Irish
7	British
8	Japanese
9	French
10	Indian
11	American
12	Mexican
13	Malaysian
14	Dutch
15	Spanish
16	Canadian
17	Vietnamese
18	Tunisian
19	Greek
20	Portuguese
21	Croatian
22	Chinese
23	Egyptian
24	Jamaican
25	Polish
26	Kenyan
27	Turkish
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.categories (id, name) FROM stdin;
1	Seafood
2	Lamb
3	Starter
4	Chicken
5	Beef
6	Dessert
7	Vegan
8	Pork
9	Vegetarian
10	Miscellaneous
11	Pasta
12	Breakfast
13	Side
14	Goat
15	Soup
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.ingredients (id, name, "desc", img) FROM stdin;
1	Squid	A type of cephalopod with a soft, cylindrical body and long tentacles, often used in seafood dishes such as calamari or grilled squid.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37aa.png
2	Cabbage	A leafy green or purple vegetable that is often used in salads, coleslaw, and stir-fry dishes, and is also commonly fermented into sauerkraut.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f5.png
3	Baking Powder	Baking powder is a dry chemical leavening agent, a mixture of a carbonate or bicarbonate and a weak acid. The base and acid are prevented from reacting prematurely by the inclusion of a buffer such as cornstarch. Baking powder is used to increase the volume and lighten the texture of baked goods. It works by releasing carbon dioxide gas into a batter or dough through an acid-base reaction, causing bubbles in the wet mixture to expand and thus leavening the mixture. The first single-acting baking powder was developed by Birmingham based food manufacturer Alfred Bird in England in 1843. The first double-acting baking powder was developed by Eben Norton Horsford in America in the 1860s.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3665.png
4	Smoked Haddock	Haddock that has been smoked over wood chips, giving it a distinctive smoky flavor	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3804.png
5	Pears	A sweet and juicy fruit with a soft, grainy texture and thin skin.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e382c.png
6	Spring Onions	Also known as scallions or green onions, these are young onions that have a mild flavor and are commonly used as a garnish or ingredient in salads, soups, stir-fries, and other dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3770.png
7	Ginger Cordial	A sweet and spicy syrup made from ginger often used as a mixer in cocktails or diluted with water to make a non-alcoholic drink.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e9.png
8	Almond Extract	The almond (Prunus dulcis, syn. Prunus amygdalus) is a species of tree native to Mediterranean climate regions of the Middle East, but widely cultivated elsewhere. The almond is also the name of the edible and widely cultivated seed of this tree. Within the genus Prunus, it is classified with the peach in the subgenus Amygdalus, distinguished from the other subgenera by corrugations on the shell (endocarp) surrounding the seed.\r\n\r\nThe fruit of the almond is a drupe, consisting of an outer hull and a hard shell with the seed, which is not a true nut, inside. Shelling almonds refers to removing the shell to reveal the seed. Almonds are sold shelled or unshelled. Blanched almonds are shelled almonds that have been treated with hot water to soften the seedcoat, which is then removed to reveal the white embryo.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3861.png
9	Tinned Tomatos	Tinned tomatoes are tomatoes that have been canned or preserved in a liquid. They are commonly used in sauces, soups, stews, and other culinary applications.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e8.png
10	Minced Beef	Ground beef, commonly used for making burgers, meatballs, and meat sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c2.png
11	Gruyère	Gruyère is a type of Swiss cheese that is known for its nutty, slightly sweet flavor and smooth, creamy texture. It is often used in cooking and pairs well with foods like potatoes, mushrooms, and bread.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f9.png
12	Powdered Sugar	Powdered sugar, also called confectioners' sugar or icing sugar, is a finely ground sugar produced by milling granulated sugar into a powdered state. It usually contains a small amount of anti-caking agent to prevent clumping and improve flow	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e388a.png
13	Stilton Cheese	Blue cheese made from cow's milk, characterized by its strong flavor and creamy texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37bc.png
14	Pork	Pork is the culinary name for the flesh of a domestic pig (Sus scrofa domesticus). It is the most commonly consumed meat worldwide,[1] with evidence of pig husbandry dating back to 5000 BC.\r\n\r\nPork is eaten both freshly cooked and preserved. Curing extends the shelf life of the pork products. Ham, smoked pork, gammon, bacon and sausage are examples of preserved pork. Charcuterie is the branch of cooking devoted to prepared meat products, many from pork.\r\n\r\nPig is the most popular meat in the Eastern and non-Muslim parts of Southeastern Asia (Indochina, Philippines, Singapore, East Timor) and is also very common in the Western world, especially in Central Europe. It is highly prized in Asian cuisines for its fat content and pleasant texture. Consumption of pork is forbidden by Jewish, Muslim and Rastafarian dietary law, for religious reasons, with several suggested possible causes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e365e.png
15	Sake	Japanese alcoholic beverage made from fermented rice and water, with a mild flavor and a relatively low alcohol content.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e375c.png
16	Cayenne Pepper	A type of chili pepper that is often used to add heat and spice to dishes, with a bright red color and a pungent, fiery flavor that can range from mild to very hot.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3688.png
17	Jalapeno	A type of chili pepper, typically green when unripe, that is commonly used in Mexican and Tex-Mex cuisine. It is moderately spicy and often used in salsas, sauces, and as a topping for nachos.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3704.png
18	Barbeque Sauce	A sweet and tangy sauce typically used for grilling or marinating meats, made with ingredients like tomato, vinegar, and spices.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c4.png
32	Yellow Pepper	Yellow peppers are a type of bell pepper with a sweet, mild flavor. They are commonly used in salads, stir-fries, and other culinary applications.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e5.png
33	Strawberries	A sweet and juicy fruit that is high in vitamin C and antioxidants. They are commonly eaten fresh or used in desserts like strawberry shortcake, strawberry ice cream, or strawberry jam.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3773.png
19	Scotch Bonnet	Scotch bonnet, also known as bonney peppers, or Caribbean red peppers, is a variety of chili pepper named for its resemblance to a tam o' shanter hat. Also called ata rodo by Yoruba speakers of Nigeria, it is found mainly in the Caribbean islands; it is also found in Guyana (where it is called the ball-of-fire pepper), the Maldives Islands (where it is called githeyo mirus), Panama (where it is called aji chombo) and West Africa. Most Scotch bonnets have a heat rating of 100,000–350,000 Scoville units. For comparison, most jalapeño peppers have a heat rating of 2,500 to 8,000 on the Scoville scale. However, completely sweet varieties of Scotch bonnet are grown on some of the Caribbean islands, called cachucha peppers.\r\n\r\nThese peppers are used to flavour many different dishes and cuisines worldwide and are often used in hot sauces and condiments. The Scotch bonnet has a sweeter flavour and stouter shape, distinct from its habanero relative with which it is often confused, and gives jerk dishes (pork/chicken) and other Caribbean dishes their unique flavour. Scotch bonnets are mostly used in West African, Antiguan, Kittitian/Nevisian, Anguilan, Dominican, St. Lucian, St Vincentian, Grenadian, Trinidadian, Jamaican, Barbadian, Guyanese, Surinamese, Haitian and Cayman cuisines and pepper sauces, though they often show up in other Caribbean recipes. It is also used in Costa Rica and Panama for Caribbean-styled recipes such as rice and beans, Rondón, saus, beef patties, and Ceviche.\r\n\r\nFresh, ripe Scotch bonnets can change from green to yellow to scarlet red, however many other breeds of this pepper can ripen to orange, yellow, peach, or even a chocolate brown.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3840.png
20	Haddock	A saltwater fish that is commonly found in the North Atlantic and is often used in cooking due to its mild, slightly sweet flavor and firm texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3803.png
21	Madras Paste	Madras paste is a blend of spices commonly used in Indian cuisine, particularly in dishes from the Madras region. It typically includes ingredients such as coriander, cumin, turmeric, and chili peppers, and is often used as a marinade or seasoning for meat, fish, or vegetables.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e371a.png
22	Light Rum	Rum is a distilled alcoholic drink made from sugarcane byproducts, such as molasses, or directly from sugarcane juice, by a process of fermentation and distillation. The distillate, a clear liquid, is then usually aged in oak barrels.\r\n\r\nThe majority of the world's rum production occurs in the Caribbean and Latin America. Rum is also produced in Australia, Portugal, Austria, Canada, Fiji, India, Japan, Mauritius, Nepal, New Zealand, the Philippines, Reunion Island, South Africa, Spain, Sweden, Taiwan, Thailand, the United Kingdom and the United States.\r\n\r\nRums are produced in various grades. Light rums are commonly used in cocktails, whereas "golden" and "dark" rums were typically consumed straight or neat, on the rocks, or used for cooking, but are now commonly consumed with mixers. Premium rums are also available, made to be consumed either straight or iced.\r\n\r\nRum plays a part in the culture of most islands of the West Indies as well as in The Maritimes and Newfoundland. This drink has famous associations with the Royal Navy (where it was mixed with water or beer to make grog) and piracy (where it was consumed as bumbo). Rum has also served as a popular medium of economic exchange, used to help fund enterprises such as slavery (see Triangular trade), organized crime, and military insurgencies (e.g., the American Revolution and Australia's Rum Rebellion).	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3856.png
23	Mozzarella Balls	Small, round balls of mozzarella cheese that are soft, smooth, and milky in flavor, and are often used as a topping for pizzas, salads, and pasta dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3724.png
24	Tomatoes	A juicy and flavorful fruit that comes in a variety of colors and sizes, commonly used in many cuisines around the world, particularly in Mediterranean and Latin American cuisines.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e377f.png
25	Thai Green Curry Paste	A spicy blend of herbs and spices, including green chilies, lemongrass, and galangal, used as a base for Thai green curry.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e377a.png
26	Paprika	A spice made from ground dried peppers, commonly used in Hungarian, Spanish, and Indian cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3733.png
27	Olive Oil	A type of oil made from pressing whole olives, commonly used in cooking and as a salad dressing.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e372c.png
28	Noodles	Noodles are a staple food in many cultures. They are made from unleavened dough which is stretched, extruded, or rolled flat and cut into one of a variety of shapes. While long, thin strips may be the most common, many varieties of noodles are cut into waves, helices, tubes, strings, or shells, or folded over, or cut into other shapes. Noodles are usually cooked in boiling water, sometimes with cooking oil or salt added. They are often pan-fried or deep-fried. Noodles are often served with an accompanying sauce or in a soup. Noodles can be refrigerated for short-term storage or dried and stored for future use. The material composition or geocultural origin must be specified when discussing noodles. The word derives from the German word Nudel.[1]	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3853.png
29	Mulukhiyah	Mulukhiyah , molokheyya ,molokhia or mulukhiyyah (Arabic:  mulūkhiyyah) Greek : molokha is the leaves of Corchorus olitorius, commonly known in English as jute, nalta jute, tossa jute , jute mallow or Jew's mallow. It is used as a vegetable. It is popular in Middle East, East African and North African countries and is called “Saluyot” in the Philippines. Mulukhiyah is rather bitter, and when boiled, the resulting liquid is a thick, highly mucilaginous broth; it is often described as "slimy", rather like cooked okra. Mulukhiyah is generally eaten cooked, not raw, and is most frequently turned into a kind of soup or stew, typically bearing the same name as the vegetable in the local language. Traditionally mulukhiyah is cooked with chicken or at least chicken stock for flavor and is served with white rice, accompanied with lemon or lime.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3891.png
30	Apples	A round fruit with a crisp, juicy flesh, often used in baking and cooking for its sweet flavor and firm texture	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3825.png
31	Single Cream	A light cream with a fat content of around 18%, often used in cooking and baking to add richness and flavor	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3823.png
34	Duck Fat	Rendered fat from ducks that has a rich, savory flavor and high smoke point, commonly used for cooking and roasting.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c7.png
35	Ackee	A fruit that is native to West Africa, but is also grown in the Caribbean, and is often used in traditional Jamaican dishes such as ackee and saltfish.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e383b.png
36	Cold Water	Water that is at or below room temperature and has not been heated or warmed.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ad.png
37	Gherkin Relish	A relish is a cooked and pickled product made of chopped vegetables, fruits or herbs and is a food item typically used as a condiment to enhance a staple. Examples are chutneys and the North American relish, a pickled cucumber jam eaten with hot dogs or hamburgers.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3884.png
38	Harissa Spice	Harissa spice is a North African blend of spices that typically includes hot chili peppers, cumin, coriander, garlic, and caraway seeds. It is often used to flavor meat, vegetables, and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36fb.png
39	Dill	An aromatic herb that is commonly used in European and Mediterranean cuisines. It has a fresh, tangy flavor that pairs well with fish, vegetables, and dips.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c1.png
40	Thyme	A fragrant herb with small, delicate leaves and a pungent flavor, commonly used in Mediterranean and French cuisines as a seasoning for meat, fish, and vegetables.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e377c.png
41	Bulgur Wheat	Bulgur is a cereal food made from the cracked parboiled groats of several different wheat species, most often from durum wheat. It originates in Middle Eastern cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e387e.png
42	Cumin Seeds	The dried seeds of the cumin plant, commonly used as a spice in cooking. They have a warm, earthy flavor and are often used in Indian, Middle Eastern, and Mexican cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b9.png
43	Star Anise	A star-shaped spice with a licorice-like flavor used in Chinese and Vietnamese cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e382e.png
44	Fromage Frais	A type of fresh, soft cheese that originated in France. Fromage frais has a tangy, creamy flavor and is often used in desserts or as a spread.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b8.png
45	Hazlenuts		https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e380c.png
46	Chocolate Chips	Small, sweetened chocolate pieces that are commonly used in baking to add texture and flavor to desserts like cookies and cakes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e369e.png
47	Wild Mushrooms	Wild mushrooms are edible fungi that grow in the wild. They come in many different varieties and can be used in a variety of culinary applications, including soups, stews, sauces, and risottos.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ea.png
48	Pinto Beans	Medium-sized beans with a speckled, reddish-brown color and mild, earthy flavor, commonly used in Mexican and Southwestern cuisine in dishes like chili and refried beans.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37cd.png
49	Sauerkraut	Sauerkraut is finely cut raw cabbage that has been fermented by various lactic acid bacteria. It has a long shelf life and a distinctive sour flavor, both of which result from the lactic acid formed when the bacteria ferment the sugars in the cabbage leaves.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e388d.png
50	Sesame Seed Burger Buns	A bun is a small, sometimes sweet, bread-based item or roll. Though they come in many shapes and sizes, they are most commonly hand-sized or smaller, with a round top and flat bottom. Buns are usually made from flour, sugar, milk, yeast and butter.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3881.png
51	Rolled Oats	Whole oat groats that have been steamed and flattened with large rollers to create flakes that are often used in oatmeal, granola, and baked goods.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3759.png
52	Fruit Mix	A blend of dried fruits such as raisins, currants, and candied peel used in baking and cooking	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3819.png
53	Red Wine Jelly	A sweet, tangy jelly made from red wine, often served with cheese and crackers or as a glaze for meats	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3824.png
54	Rose water	Rose water is a flavoured water made by steeping rose petals in water. Additionally, it is the hydrosol portion of the distillate of rose petals, a by-product of the production of rose oil for use in perfume. It is used to flavour food, as a component in some cosmetic and medical preparations, and for religious purposes throughout Europe and Asia.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e386c.png
55	Vegetable Oil	A type of oil derived from plant sources, such as soybeans, corn, or sunflower seeds, that is commonly used in cooking and baking due to its neutral flavor and high smoke point.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3789.png
56	Sriracha	Sriracha is a type of hot sauce or chili sauce made from a paste of chili peppers, distilled vinegar, garlic, sugar, and salt.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e387b.png
57	Mixed Grain	A blend of two or more types of grains such as wheat, barley, oats, and rice that is often used in salads, soups, and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f1.png
58	Salt Cod	Cod that has been preserved by salting and drying, commonly used in Mediterranean and Latin American cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e383a.png
59	Marzipan	A sweet paste made from ground almonds and sugar, often used in cakes and pastries for decoration.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3813.png
60	Smoked Salmon	Smoked salmon is a preparation of salmon, typically a fillet that has been cured and hot or cold smoked. Due to its moderately high price, smoked salmon is considered a delicacy. Although the term lox is sometimes applied to smoked salmon, they are different products.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e385b.png
61	Jasmine Rice	A type of long-grain rice that has a subtle floral aroma and a slightly sticky texture when cooked.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3705.png
62	Unsalted Butter	Butter made from cream that has been separated from milk and churned, without any added salt	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3828.png
63	Salted Butter	Butter that has been mixed with salt, commonly used in cooking and baking to add flavor and richness to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e375f.png
64	Crusty Bread	Bread that has a hard crust and a soft, chewy interior. Crusty bread is often used for sandwiches or served with soups and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b7.png
65	Glace Cherry	A candied cherry that has been preserved in sugar syrup and used in baking and decorating desserts	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e381c.png
66	Warm Water	Water is an inorganic, transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earth's hydrosphere and the fluids of most living organisms. It is vital for all known forms of life, even though it provides no calories or organic nutrients. Its chemical formula is H2O, meaning that each of its molecules contains one oxygen and two hydrogen atoms, connected by covalent bonds. Water is the name of the liquid state of H2O at standard ambient temperature and pressure. It forms precipitation in the form of rain and aerosols in the form of fog. Clouds are formed from suspended droplets of water and ice, its solid state. When finely divided, crystalline ice may precipitate in the form of snow. The gaseous state of water is steam or water vapor. Water moves continually through the water cycle of evaporation, transpiration (evapotranspiration), condensation, precipitation, and runoff, usually reaching the sea.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3887.png
67	Coconut Cream	A thick, rich cream made from coconut meat, commonly used in Thai and other Southeast Asian cuisine to add flavor and texture to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36aa.png
68	Dark Soft Brown Sugar	Similar to dark brown sugar, but with a higher moisture content and softer texture. It is also rich in molasses and has a deep, complex flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36bc.png
69	Coriander Seeds	The dried seeds of the coriander plant, commonly used as a spice in cooking. They have a slightly sweet, citrusy flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b1.png
70	Free-range Eggs, Beaten	Chicken eggs from free-range chickens that have been whisked together until the whites and yolks are fully mixed.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36db.png
71	Beef	Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times. Beef is a source of high-quality protein and nutrients.\r\n\r\nMost beef skeletal muscle meat can be used as is by merely cutting into certain parts, such as roasts, short ribs or steak (filet mignon, sirloin steak, rump steak, rib steak, rib eye steak, hanger steak, etc.), while other cuts are processed (corned beef or beef jerky). Trimmings, on the other hand, are usually mixed with meat from older, leaner (therefore tougher) cattle, are ground, minced or used in sausages. The blood is used in some varieties called blood sausage. Other parts that are eaten include other muscles and offal, such as the oxtail, liver, tongue, tripe from the reticulum or rumen, glands (particularly the pancreas and thymus, referred to as sweetbread), the heart, the brain (although forbidden where there is a danger of bovine spongiform encephalopathy, BSE, commonly referred to as mad cow disease), the kidneys, and the tender testicles of the bull (known in the United States as calf fries, prairie oysters, or Rocky Mountain oysters). Some intestines are cooked and eaten as is, but are more often cleaned and used as natural sausage casings. The bones are used for making beef stock.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e365d.png
72	Semi-skimmed Milk	Semi-skimmed milk is a type of milk that has had some, but not all, of the cream removed. It typically has a lower fat content than whole milk, but is not as low in fat as skimmed milk.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3763.png
73	Apricot	Fruit with a soft, velvety skin and a sweet, juicy flesh, commonly eaten fresh or dried.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37bf.png
74	Vinaigrette Dressing	A sauce made with oil, vinegar, and seasonings, used as a dressing for salads or as a marinade for meats and vegetables.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e378c.png
75	Baby Squid	Young, small-sized squid that are tender and flavorful, often grilled or sautéed and served as a seafood appetizer.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a9.png
76	Linguine Pasta	A long, thin pasta noodle that is similar to spaghetti, but wider. Linguine is often served with seafood or tomato-based sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b5.png
77	Parmigiano-reggiano	See Parmesan.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3737.png
78	Caraway Seed	Caraway, also known as meridian fennel and Persian cumin (Carum carvi), is a biennial plant ... For example, it is used in goulash, sauerkraut, and caraway seed cake. The roots may be cooked as a vegetable like parsnips or carrots	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e388e.png
79	Brandy	A type of distilled spirit made from wine or fermented fruit juice, often aged in oak barrels to give it a smooth, mellow flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3677.png
80	Flax Eggs	A vegan egg substitute made from ground flaxseed and water. Used in baking as a binding agent.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d6.png
81	Toor Dal	Also known as pigeon peas, a type of legume commonly used in Indian and African cuisines, often cooked into stews, soups, and curries.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3780.png
82	Baked Beans	Haricot beans cooked in a tomato sauce, often served as a side dish or as part of a full English breakfast.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3816.png
83	Greek Yogurt	A thick and creamy yogurt that has been strained to remove excess whey, resulting in a tangy and slightly tart flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f0.png
84	Lasagne Sheets	Flat, rectangular pieces of pasta that are used to make lasagne, a popular Italian dish that typically consists of layers of pasta, meat, sauce, and cheese.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e370e.png
85	Rice Krispies	Rice Krispies (also known as Rice Bubbles in Australia and New Zealand) is a breakfast cereal marketed by Kellogg's in 1927 and released to the public in 1928. Rice Krispies are made of crisped rice (rice and sugar paste that is formed into rice shapes or "berries", cooked, dried and toasted), and expand forming very thin and hollowed out walls that are crunchy and crisp. When milk is added to the cereal the walls tend to collapse, creating the "Snap, crackle and pop" sounds.\r\n\r\nRice Krispies cereal has a long advertising history, with the elf cartoon characters Snap, Crackle and Pop touting the brand. In 1963, The Rolling Stones recorded a short song for a Rice Krispies television advertisement.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e385d.png
86	White Fish	Any fish with white flesh, such as cod, haddock, or tilapia, often used in cooking for its mild flavor and versatility.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3791.png
87	Tuna	A saltwater fish with firm, meaty flesh, commonly used in a variety of cuisines, including sushi, salads, and sandwiches.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3781.png
88	Chilled Butter	Butter that has been chilled or kept in the refrigerator. It is often used in pastry doughs or other baked goods to create a flaky texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e369a.png
89	Fajita Seasoning	A blend of spices typically used to season chicken, beef, or vegetable fajitas. The seasoning usually includes chili powder, cumin, garlic powder, and paprika.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ce.png
90	Dill Pickles	A pickled cucumber is a cucumber that has been pickled in a brine, vinegar, or other solution and left to ferment for a period of time, by either immersing the cucumbers in an acidic solution or through souring by lacto-fermentation. Pickled cucumbers are often part of mixed pickles.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3880.png
91	Charlotte Potatoes	Small, waxy potatoes with a creamy texture and delicate skin. They are ideal for boiling, roasting, and salads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e368d.png
92	Dried Fruit	Fruit that has been dried to remove most of its water content, often used in baking, cooking, and snacking	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e381a.png
93	Cajun	A style of cooking that originated in Louisiana and combines French, African, and Native American culinary traditions, featuring bold and spicy flavors and often incorporating seafood, rice, and vegetables.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3680.png
94	Turnips	A root vegetable with a slightly sweet and bitter flavor, commonly used in European and Asian cuisines, often boiled, roasted, or mashed.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3784.png
95	Extra Virgin Olive Oil	A high-quality oil made from the first pressing of the olives, with a fruity flavor and low acidity. Often used in dressings and for finishing dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36cd.png
96	Ghee	A type of clarified butter commonly used in South Asian cuisine with a rich, nutty flavor and high smoke point.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e7.png
97	Vermicelli Pasta	A type of thin, spaghetti-like pasta that is slightly thinner than spaghetti and often used in soups, stir-fries, or salads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a8.png
98	Fenugreek	An herb commonly used in Indian cuisine for its nutty, maple-like flavor. The leaves and seeds can be used in dishes like curries, stews, and chutneys.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d2.png
99	Pine Nuts	Pine nuts are edible seeds that come from certain species of pine trees. They have a sweet and nutty flavor, and are commonly used in Mediterranean and Middle Eastern cuisine as a topping or ingredient in dishes like salads, pasta, and pesto.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3740.png
100	Brussels Sprouts	A vegetable closely related to cabbage and broccoli, characterized by small green leafy buds tightly packed into a round shape.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3805.png
101	Clams	Edible bivalve mollusks with two shells, commonly used in seafood dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b9.png
102	Treacle	A sweet, sticky syrup made from refined sugar, often used as a sweetener in baking and cooking	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e381d.png
103	Apricot Jam	A sweet spread made from apricots, often used on toast, pastries, and in baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3812.png
104	Massaman Curry Paste	Massaman curry paste is a blend of spices commonly used in Thai cuisine, particularly in dishes from the southern region of Thailand. It typically includes ingredients such as cinnamon, cardamom, cloves, and chili peppers, and is often used as a marinade or seasoning for meat, fish, or vegetables.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e371c.png
105	Red Wine	Alcoholic beverage made from fermented grapes or other fruits with a red color derived from the skins of dark-colored grapes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3751.png
106	Onions	A bulb vegetable with layers of flesh covered by a paper-like skin, used in cooking for its flavor and texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e372e.png
107	Cannellini Beans	A type of white bean that is commonly used in Italian cuisine, with a creamy texture and a mild, nutty flavor that is often used in soups, salads, and pasta dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3682.png
108	Smoked Paprika	Smoked paprika is a type of paprika that has been smoked over wood to give it a smoky flavor. It is commonly used in Spanish and Mexican cuisine, and can be used to add flavor to meats, stews, and soups.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3769.png
109	Ancho Chillies	A type of dried chili pepper that is commonly used in Mexican cuisine, with a mild to medium heat level and a fruity, smoky flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e385e.png
110	Rapeseed Oil	Oil extracted from the seeds of the rapeseed plant, commonly used for cooking and frying.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37bb.png
111	Doner Meat	A type of meat that is typically made from lamb, chicken, or beef that has been seasoned and cooked on a vertical rotisserie. It is commonly used in Middle Eastern and Mediterranean cuisine, and is often served in sandwiches or wraps.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c2.png
112	Baguette	A long, thin loaf of French bread that has a crisp crust and a soft, chewy interior, and is often used for sandwiches and as an accompaniment to meals.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f9.png
113	Black Treacle	Molasses (American English) or black treacle (British English) is a viscous product resulting from refining sugarcane or sugar beets into sugar. Molasses varies by amount of sugar, method of extraction, and age of plant. Sugarcane molasses is primarily used for sweetening and flavoring foods in the United States, Canada, and elsewhere. Molasses is a defining component of fine commercial brown sugar.\r\n\r\nSweet sorghum syrup may be colloquially called "sorghum molasses" in the southern United States.[2][3] Similar products include honey, maple syrup, corn syrup, and invert syrup. Most of these alternative syrups have milder flavors.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3673.png
114	Mackerel	Mackerel is a type of fish that is typically oily and has a strong, distinctive flavor. It is commonly used in a variety of dishes, including sushi, fish cakes, and smoked fish.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3719.png
115	Rice Vinegar	Rice vinegar is a vinegar made from fermented rice in China, Japan, Korea, and Vietnam.\r\n\r\nChinese rice vinegars are stronger than Japanese ones, and range in colour from clear to various shades of red, brown and black and are therefore known as rice wine vinegar. Chinese and especially Japanese vinegars are less acidic than the distilled Western vinegars which, for that reason, are not appropriate substitutes for rice vinegars. The majority of the Asian rice vinegar types are also more mild and sweet than vinegars typically used in the Western world, with black vinegars as a notable exception. Chinese rice vinegars are made from huangjiu, a type of rice wine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3845.png
116	Beef Shin	A cut of beef from the lower leg, often used in slow-cooked dishes for its rich flavor and collagen content	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3821.png
117	Bun	A bun is a small, sometimes sweet, bread-based item[1] or roll. Though they come in many shapes and sizes, they are most commonly hand-sized or smaller, with a round top and flat bottom.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3871.png
118	Mozzarella	A semi-soft, mild cheese with a smooth, creamy texture and mild, slightly tangy flavor, commonly used on pizzas and in Italian dishes like lasagna and caprese salad.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d0.png
119	Banana	A fruit with a soft, sweet flesh and yellow or green skin that is rich in potassium and often used in baked goods, smoothies, and as a snack.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d4.png
120	Worcestershire Sauce	A fermented liquid condiment made from a blend of spices, vinegar, and anchovies, commonly used as a seasoning for meats, vegetables, and soups.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3798.png
121	Celery	A long, crunchy stalk vegetable with a green color and a strong, distinct flavor, often used in soups, stews, salads, and as a snack with dips or spreads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e368a.png
122	Wonton Skin	Won ton skin. Paper-thin squares of dough made from flour, water, eggs and salt used to make won tons, egg rolls and gyoza.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e384c.png
123	Fresh Thyme	An herb with small, fragrant leaves that are used in cooking to add flavor to meats, soups, and stews. It has a slightly minty, lemony flavor and pairs well with other herbs like rosemary and sage.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36de.png
124	Floury Potatoes	A type of potato with a high starch content and dry, fluffy texture when cooked. Often used for making mashed potatoes, fries, and potato pancakes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d9.png
125	Aubergine	Eggplant (US, Australia), aubergine (UK), or brinjal (South Asia and South Africa) is a plant species in the nightshade family Solanaceae. Solanum melongena is grown worldwide for its edible fruit.\r\n\r\nMost commonly purple, the spongy, absorbent fruit is used in various cuisines. Although often considered a vegetable, it is a berry by botanical definition. As a member of the genus Solanum, it is related to tomato and potato. Like the tomato, its skin and seeds can be eaten, but, like the potato, it is usually eaten cooked. Eggplant is nutritionally low in macronutrient and micronutrient content, but the capability of the fruit to absorb oils and flavors into its flesh through cooking expands its use in the culinary arts.\r\n\r\nIt was originally domesticated from the wild nightshade species thorn or bitter apple, S. incanum, probably with two independent domestications: one in South Asia, and one in East Asia.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3662.png
126	Fennel Bulb	A bulbous vegetable with a licorice-like flavor commonly used in Mediterranean cuisine. The bulb, stems, and fronds can all be eaten raw or cooked.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d0.png
127	Dark Brown Sugar	A type of brown sugar with a higher molasses content and darker color than light brown sugar. It has a rich, caramel flavor and is often used in baking and cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36bb.png
128	Oatmeal	A type of coarse flour made from ground oats, often used in baking and cooking	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e381e.png
129	Sherry	Sherry is a fortified wine made from white grapes that are grown near the city of Jerez de la Frontera in Andalusia, Spain.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e386b.png
130	Buns	A bun is a small, sometimes sweet, bread-based item or roll. Though they come in many shapes and sizes, they are most commonly hand-sized or smaller, with a round top and flat bottom. Buns are usually made from flour, sugar, milk, yeast and butter.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3882.png
131	Red Chile Flakes	Dried and crushed chili peppers that are often used to add heat and flavor to dishes such as chili, soups, and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e374b.png
132	Tamarind Paste	A thick, dark brown paste made from the pulp of the tamarind fruit, used as a souring agent in cooking, especially in Indian, Thai, and Mexican cuisines.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3778.png
133	Lemons	Lemons are a citrus fruit that are typically bright yellow in color and have a sour, acidic flavor. They are commonly used as a flavoring agent in cooking, baking, and beverages, and are also a source of vitamin C.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3714.png
134	Broccoli	A nutritious vegetable that is a member of the cabbage family, with small, tight florets and a thick stem, often steamed or boiled and used in salads, stir-fries, and other dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e367a.png
135	Ice Cream	A frozen dessert typically made with cream, sugar, and flavorings.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3701.png
136	Cardamom	A spice made from the dried seeds of plants in the ginger family, with a strong, sweet, and pungent flavor that is often used in Indian and Middle Eastern cuisine to add warmth and depth of flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3683.png
137	Cheese	A dairy product made from milk that is curdled and then processed into a solid form. It can come in a wide range of flavors and textures depending on the type and aging process.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e368f.png
138	Polish Sausage	Kielbasa is any type of meat sausage from Poland, and a staple of Polish cuisine. In American English the word typically refers to a coarse, U-shaped smoked sausage of any kind of meat, which closely resembles the Wiejska sausage in British English.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e388c.png
139	Red Wine Vinegar	A vinegar made from red wine that has a tart and tangy flavor, often used in salad dressings, marinades, and sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c9.png
140	Mars Bar	Mars is a variety of chocolate bar produced by Mars, Incorporated. It was first manufactured in 1932 in Slough, England by Forrest Mars, Sr. The bar was sold in two different formulations. In its original British version the bar consists of milk chocolate surrounding caramel and nougat, developed to resemble the American candy bar known as the Milky Way, which had been introduced a decade earlier. An American version of the Mars Bar was produced which had nougat and toasted almonds covered in milk chocolate; later, caramel was added to the recipe as well. The American version was discontinued in 2002, though it has been revived for short runs since then.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e385c.png
141	Figs	Ficus carica is an Asian species of flowering plant in the mulberry family, known as the common fig. It is the source of the fruit also called the fig and as such is an important crop in those areas where it is grown commercially.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3893.png
142	Bowtie Pasta	A type of pasta with a distinctive bowtie or butterfly shape that is often used in pasta salads and other cold dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3675.png
143	Tripe	Tripe is a type of edible lining from the stomachs of various farm animals. Most tripe is from cattle and sheep.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3862.png
144	Tagliatelle	A type of pasta that is long and ribbon-shaped, similar to fettuccine but narrower in width.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a1.png
145	Blueberries	Small, sweet, and juicy blue fruits often used in baking or as a topping for breakfast foods such as pancakes, waffles, and yogurt bowls.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d6.png
146	Turmeric Powder	A ground spice made from the root of the turmeric plant, commonly used as a seasoning and coloring agent in Indian and Southeast Asian cuisines.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3783.png
147	Oysters	Edible bivalve mollusks with a tough, irregularly shaped shell, typically eaten raw or cooked and often served as a delicacy.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37fe.png
148	White Wine Vinegar	Wine vinegar is made from red or white wine, and is the most commonly used vinegar in Southern and Central Europe, Cyprus and Israel. As with wine, there is a considerable range in quality. Better-quality wine vinegars are matured in wood for up to two years, and exhibit a complex, mellow flavor. Wine vinegar tends to have a lower acidity than white or cider vinegars. More expensive wine vinegars are made from individual varieties of wine, such as champagne, sherry, or pinot gris.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e385a.png
149	Green Olives	Olives that are harvested before they are fully ripe and have a firm texture and slightly bitter flavor commonly used in salads, sandwiches, and as a snack.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f3.png
150	Pappardelle Pasta	A broad, flat pasta noodle that originated in Tuscany, Italy. Pappardelle is often served with rich, meaty sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b3.png
151	Paccheri Pasta	A large, tube-shaped pasta noodle that originated in Southern Italy. Paccheri is often stuffed and baked, or served with tomato-based sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b4.png
152	Coconut Milk	A milky liquid made from coconut meat, commonly used in Indian, Thai, and other Southeast Asian cuisine to add flavor and creaminess to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ab.png
153	Horseradish	Horseradish is a pungent root vegetable that is often grated and used as a condiment or flavoring agent. It is commonly used in sauces, dressings, and as a garnish for dishes like roast beef or smoked fish.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36fe.png
154	Tiger Prawns	A large species of prawn known for their distinctive stripes and sweet flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e382f.png
155	Chicken Breasts	A cut of chicken meat that comes from the breast of the bird. It is lean and versatile, and can be cooked in a variety of ways, such as grilling, roasting, or pan-frying.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3694.png
156	Ham	A cut of meat from the hind leg of a pig that is typically cured or smoked, and is commonly used in sandwiches, salads, and as a flavoring for soups and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37fd.png
157	Flaked Almonds	Sliced or chopped almonds commonly used in baking and as a topping for salads and desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d5.png
158	Lamb Loin Chops	A type of lamb chop that comes from the loin area of the animal. Lamb loin chops are tender and flavorful and can be cooked quickly over high heat.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e370c.png
159	Celeriac	A root vegetable that is related to celery, with a knobby, rough exterior and a creamy-white interior that is often used in soups, stews, and purees, with a mild and slightly sweet flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3689.png
160	Basil	Basil, also called great basil, is a culinary herb of the family Lamiaceae (mints).\r\n\r\nBasil is native to tropical regions from central Africa to Southeast Asia. It is a tender plant, and is used in cuisines worldwide. Depending on the species and cultivar, the leaves may taste somewhat like anise, with a strong, pungent, often sweet smell.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3667.png
161	Chicken Breast	A cut of chicken meat that comes from the breast of the bird. It is lean and versatile, and can be cooked in a variety of ways, such as grilling, roasting, or pan-frying.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3693.png
162	Filo Pastry	Filo or phyllo (Greek: φύλλο "leaf") is a very thin unleavened dough used for making pastries such as baklava and börek in Middle Eastern and Balkan cuisines. Filo-based pastries are made by layering many sheets of filo brushed with oil or butter; the pastry is then baked.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3867.png
163	Cloves	A pungent spice commonly used in baking and cooking, made from the dried flower buds of the clove tree.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a7.png
164	Shallots	Shallots are a type of onion that have a milder flavor than regular onions. They are typically smaller and have a brownish-red skin, and are often used in French cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3765.png
165	Yellow Food Colouring	A type of food coloring used to add a bright yellow color to foods and drinks.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3811.png
166	Christmas Pudding	A traditional British dessert that is typically served during the Christmas season, made with dried fruit, spices, and suet, and often served with brandy butter or custard.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a3.png
167	Haricot Beans	Also known as navy beans, small white beans with a mild flavor and creamy texture, often used in soups, stews, and casseroles.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ca.png
168	Maple Syrup	A sweet and flavorful syrup made from the sap of maple trees, often used as a topping for pancakes, waffles, or oatmeal.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d9.png
169	Pecorino	A hard, salty cheese made from sheep's milk, commonly used in Italian cooking for its sharp, tangy flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e373d.png
170	Mustard Seeds	Small, round seeds that are derived from the mustard plant, and are often used as a spice in cooking and seasoning for their pungent and tangy flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3729.png
171	Mushrooms	Fungi that are used in cooking and have a wide variety of shapes, sizes, and flavors, ranging from delicate and earthy to meaty and umami.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3726.png
172	Bramley Apples	A type of apple that is popular in the UK and Ireland, known for its tart flavor and firm texture, which makes it ideal for cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3676.png
173	Corn Flour	A fine, powdery flour made by grinding dried corn kernels, commonly used as a thickener in soups, stews, and sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a4.png
174	Stout	A dark, rich beer that is made using roasted malts, often with a creamy and smooth texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ff.png
196	Yukon Gold Potatoes	Yukon Gold is a large cultivar of potato most distinctly characterized by its thin, smooth, eye-free skin and yellow-tinged flesh. This potato was developed in the 1960s by Garnet Johnston in Guelph, Ontario, Canada, with the help of Geoff Rowberry at the University of Guelph. The official cross was made in 1966 and Yukon Gold was finally released into the market in 1980.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3875.png
175	Black Pepper	Black pepper (Piper nigrum) is a flowering vine in the family Piperaceae, cultivated for its fruit, known as a peppercorn, which is usually dried and used as a spice and seasoning. When fresh and fully mature, it is about 5 mm (0.20 in) in diameter and dark red, and contains a single seed, like all drupes. Peppercorns and the ground pepper derived from them may be described simply as pepper, or more precisely as black pepper (cooked and dried unripe fruit), green pepper (dried unripe fruit), or white pepper (ripe fruit seeds).\r\n\r\nBlack pepper is native to present-day Kerala in Southwestern India, and is extensively cultivated there and elsewhere in tropical regions. Vietnam is the world's largest producer and exporter of pepper, producing 34% of the world's crop, as of 2013.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3672.png
176	Macaroni	Macaroni is a type of pasta that is typically tubular in shape and has a smooth, cylindrical surface. It is commonly used in pasta dishes such as macaroni and cheese, and can also be used in salads and soups.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3718.png
177	Water	A transparent, odorless, tasteless liquid that is essential for most forms of life.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e378f.png
178	Salt	Crystalline mineral made of sodium chloride, commonly used as a seasoning and preservative in cooking and food preparation.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e375e.png
179	Potatoes	A starchy root vegetable that is commonly used in cooking and is a good source of carbohydrates, fiber, and vitamins.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3746.png
180	Egg White		https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c8.png
181	Onion	A bulb-shaped vegetable with multiple layers of papery skin and a pungent, sweet flavor, often used as a base for soups, stews, and sauces or caramelized as a topping for pizza or sandwiches.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ae.png
182	Lime	Limes are a citrus fruit that are typically green in color and have a tart, acidic flavor. They are commonly used as a flavoring agent in cooking, baking, and beverages, and are also a source of vitamin C.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3716.png
183	Farfalle	A type of pasta shaped like a bow tie or butterfly.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36cf.png
184	Diced Tomatoes	Tomatoes that have been chopped into small, evenly sized pieces. They are often canned and used in soups, stews, sauces, and other dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36bf.png
185	Pita Bread	Pita or pitta, is a family of yeast-leavened round flatbreads baked from wheat flour, common in the Mediterranean, Middle East, and neighboring areas.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e387d.png
186	Raisins	Dried grapes that are small, sweet and chewy, often used in baking and as a snack.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3806.png
187	Rice Noodles	Thin, translucent noodles made from rice flour and water and commonly used in Southeast Asian cuisine, such as in pho or pad thai.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3754.png
188	Bouquet Garni	A bundle of herbs, typically including bay leaves, thyme, and parsley, used to flavor soups, stews, and other dishes	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3822.png
189	Water Chestnut	Eleocharis dulcis, the Chinese water chestnut or water chestnut, is a grass-like sedge native to Asia (China, Japan, India, Philippines, etc.), Australia, tropical Africa, and various islands of the Pacific and Indian Oceans. It is grown in many countries for its edible corms.\r\n\r\nThe water chestnut is not a nut at all, but an aquatic vegetable that grows in marshes, under water, in the mud. It has stem-like, tubular green leaves that grow to about 1.5 m. The water caltrop, which also is referred to by the same name, is unrelated and often confused with the water chestnut.\r\n\r\nThe small, rounded corms have a crisp, white flesh and may be eaten raw, slightly boiled, or grilled, and often are pickled or tinned. They are a popular ingredient in Chinese dishes. In China, they are most often eaten raw, sometimes sweetened. They also may be ground into a flour form used for making water chestnut cake, which is common as part of dim sum cuisine. They are unusual among vegetables for remaining crisp even after being cooked or canned, because their cell walls are cross-linked and strengthened by certain phenolic compounds, such as oligomers of ferulic acid. This property is shared by other vegetables that remain crisp in this manner, including the tiger nut and lotus root. The corms contain the antibiotic agent puchiin, which is stable to high temperature. Apart from the edible corms, the leaves can be used for cattlefeed, mulch or compost.\r\n\r\nThe corms are rich in carbohydrates (about 90% by dry weight), especially starch (about 60% by dry weight), and are also a good source of dietary fiber, riboflavin, vitamin B6, potassium, copper, and manganese.\r\n\r\nIf eaten uncooked, the surface of the plants may transmit fasciolopsiasis.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3846.png
190	Lamb Shoulder	Meat from the shoulder of a young sheep, commonly used for slow cooking and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37be.png
191	English Mustard	A spicy, yellowish-brown mustard commonly used in British cuisine for sandwiches, dressings, and sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36cc.png
192	King Prawns	A large, meaty type of shrimp that is often used in seafood dishes. King prawns have a sweet, delicate flavor and a firm texture when cooked.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3709.png
193	Red Pepper Flakes	Dried and crushed red chili peppers often used as a spice to add heat and flavor to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3750.png
194	Whole Milk	Milk that has not had its fat content reduced or removed, typically containing around 3.25% fat.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3795.png
195	Mixed Spice	Mixed spice, also called pudding spice, is a British[1] blend of sweet spices, similar to the pumpkin pie spice used in the United States. Cinnamon is the dominant flavour, with nutmeg and allspice. It is often used in baking, or to complement fruits or other sweet foods.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e386d.png
197	Fermented Black Beans	Douchi (Chinese: 豆豉; pinyin: dòuchǐ), or tochi is a type of fermented and salted black soybean. In English, it is known as fermented black soybeans, Chinese fermented black beans (Chinese: 黑豆豆豉; pinyin: hēidòu dòuchǐ), salted black beans, salty black beans, or just black beans. They are a flavoring most popular in the cuisine of China, where they are most widely used for making black bean sauce dishes.[1][page needed]\r\n\r\nDouchi is made by fermenting and salting black soybeans. The black type soybean is most commonly used and the process turns the beans soft, and mostly semi-dry (if the beans are allowed to dry). Regular soybeans (white soybeans) are also used, but this does not produce "salted black beans"; instead, these beans become brown. The smell is sharp, pungent, and spicy; the taste is salty, somewhat bitter and sweet.[citation needed] The product made with white soybeans is called mianchi.\r\n\r\nThe process and product are similar to ogiri and iru, both being African fermented bean products[citation needed].\r\n\r\nDouchi, "Chinese salted black beans", and "black soybeans" should not be confused with the black turtle bean, a variety of common bean that is commonly used in the cuisines of Central America, South America, and the Caribbean.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3849.png
198	Pork Chops	A pork chop, like other meat chops, is a loin cut taken perpendicular to the spine of the pig and usually containing a rib or part of a vertebra. Pork chops are not processed and are leaner than other cuts of pork. Chops are commonly served as an individual portion.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3874.png
199	Pitted Black Olives	Pitted black olives are ripe olives that have had their pits removed. They are a popular ingredient in Mediterranean and Italian cuisine, and are often used as a topping for pizza, in salads, or as a flavoring in dips and spreads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3741.png
200	Wood Ear Mushrooms	Auricularia auricula-judae, known as the Jew's ear, wood ear, jelly ear or by a number of other common names, is a species of edible Auriculariales fungus found worldwide. The fruiting body is distinguished by its noticeably ear-like shape and brown colouration; it grows upon wood, especially elder. Its specific epithet is derived from the belief that Judas Iscariot hanged himself from an elder tree; the common name "Judas's ear" was largely eclipsed by the corruption "Jew's ear", while today "jelly ear" and other names are sometimes used. The fungus can be found throughout the year in temperate regions worldwide, where it grows upon both dead and living wood.\r\n\r\nIn the West, A. auricula-judae was used in folk medicine as recently as the 19th century for complaints including sore throats, sore eyes and jaundice, and as an astringent. Although it is not widely consumed in the West, it has long been popular in China, to the extent that Australia exported large volumes to China in the early twentieth century. Today, the fungus is a popular ingredient in many Chinese dishes, such as hot and sour soup, and also used in Chinese medicine. It is also used in Ghana, as a blood tonic. Modern research into possible medical applications has variously concluded that A. auricula-judae has antitumour, hypoglycemic, anticoagulant and cholesterol-lowering properties.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3854.png
201	Fideo	A type of thin, spaghetti-like pasta commonly used in Mexican cuisine, often toasted before being added to soups or stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a6.png
202	Lemon	A citrus fruit that has a sour, acidic flavor and is often used in cooking and baking to add tartness and brightness to dishes. Lemon juice and zest are commonly used in marinades, dressings, and desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3711.png
203	Iceberg Lettuce	Iceberg is a variety of lettuce with crisp leaves that grow in a spherical head resembling cabbage. It is considered one of the sweeter lettuce varieties like romaine and butterhead. Mature iceberg lettuce grows to about one foot in diameter.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3883.png
204	Passata	Tomato puree made from strained and cooked tomatoes, commonly used as a base for pasta sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ba.png
205	Duck	A domesticated bird that is commonly used for meat. Duck meat is known for its rich, gamey flavor and is often roasted or grilled.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b0.png
206	Avocado	The avocado, a tree with probable origin in South Central Mexico, is classified as a member of the flowering plant family Lauraceae. The fruit of the plant, also called an avocado (or avocado pear or alligator pear), is botanically a large berry containing a single large seed.\r\n\r\nAvocados are commercially valuable and are cultivated in tropical and Mediterranean climates throughout the world. They have a green-skinned, fleshy body that may be pear-shaped, egg-shaped, or spherical. Commercially, they ripen after harvesting. Avocado trees are partially self-pollinating, and are often propagated through grafting to maintain predictable fruit quality and quantity. In 2017, Mexico produced 34% of the world supply of avocados.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e365f.png
207	Orange Zest	The outermost layer of the orange peel, used in cooking for its fragrant and flavorful oils.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3730.png
208	Cucumber	A green vegetable that is often used in salads and sandwiches. It has a crunchy texture and a mild, refreshing flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b7.png
209	Challots	A type of onion that has a mild, sweet flavor and a distinctive bulb shape, often used in French cuisine to add flavor to sauces, dressings, and other dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e368c.png
228	Garlic Sauce	A sauce made from garlic, often combined with other ingredients such as lemon juice, olive oil, and herbs, commonly used as a dip or condiment.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e6.png
229	Kale	A leafy green vegetable that is a member of the cabbage family. Kale is known for its nutrient density and can be eaten raw or cooked in a variety of dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3707.png
230	Free-range Egg, Beaten	A chicken egg from free-range chickens that has been whisked together until the whites and yolks are fully mixed.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36da.png
559	Shortcrust Pastry	A type of pastry that is made with flour, butter, and water. It is often used as a base for pies and tarts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e0.png
210	Malt Vinegar	Vinegar is a liquid consisting of about 5–20% acetic acid (CH3COOH), water, and other trace chemicals, which may include flavorings. The acetic acid is produced by the fermentation of ethanol by acetic acid bacteria. Vinegar is now mainly used as a cooking ingredient, or in pickling. As the most easily manufactured mild acid, it has historically had a great variety of industrial, medical, and domestic uses, some of which (such as its use as a general household cleaner) are still commonly practiced today.\r\n\r\nCommercial vinegar is produced either by a fast or a slow fermentation process. In general, slow methods are used in traditional vinegars where fermentation proceeds slowly over the course of a few months or up to a year. The longer fermentation period allows for the accumulation of a non-toxic slime composed of acetic acid bacteria. Fast methods add mother of vinegar (bacterial culture) to the source liquid before adding air to oxygenate and promote the fastest fermentation. In fast production processes, vinegar may be produced between 20 hours to three days.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3844.png
211	Chopped Parsley	Fresh parsley that has been chopped finely, commonly used as a garnish or flavoring in salads, soups, and other dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a0.png
212	Yogurt	A dairy product made by fermenting milk with live bacteria cultures, resulting in a thick, creamy texture and tangy flavor. Often consumed as a snack or used as an ingredient in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3799.png
213	Parsley	A herb with a mild, slightly bitter flavor, commonly used in Mediterranean and Middle Eastern cooking as a garnish or seasoning.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3738.png
214	Raw King Prawns	Large, uncooked prawns that are typically used in dishes such as stir-fries, curries, and soups. They have a firm texture and a slightly sweet flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e374a.png
215	Saffron	Spice derived from the stigma of the saffron crocus flower, with a pungent flavor and bright yellow-orange color, often used in rice dishes, paella, and bouillabaisse.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e375a.png
216	Peanuts	A legume with a thin, papery skin and a high oil content, commonly eaten roasted or boiled as a snack, or used in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e373b.png
217	Orange	A citrus fruit with a tough, bright orange rind and juicy, pulpy flesh that can be eaten raw or used in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e372f.png
218	Ground Cumin	Ground cumin is a spice made from the dried seeds of the cumin plant. It is commonly used in Indian, Middle Eastern, and Mexican cuisine to add a warm, earthy flavor to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f7.png
219	Shredded Mexican Cheese	Shredded Mexican cheese is a blend of cheeses that is commonly used in Mexican cuisine. It typically contains a mixture of Cheddar, Monterey Jack, and other cheeses, and is often used in dishes like tacos, burritos, and enchiladas.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3766.png
220	Oxtail	Oxtail (occasionally spelled ox tail or ox-tail) is the culinary name for the tail of cattle. Formerly, it referred only to the tail of an ox or steer, a bullock (a castrated male).[citation needed] An oxtail typically weighs 2 to 4 lbs. (1–1.8 kg) and is skinned and cut into short lengths for sale.\r\n\r\nOxtail is a bony, gelatin-rich meat, which is usually slow-cooked as a stew[1] or braised. It is a traditional stock base for a soup. Traditional preparations involve slow cooking, so some modern recipes take a shortcut using a pressure cooker. Oxtail is the main ingredient of the Italian dish coda alla vaccinara (a classic of Roman cuisine). It is a popular flavour for powder, instant and premade canned soups in the United Kingdom and Ireland. Oxtails are also one of the popular bases for Russian aspic appetizer dishes (холодец or студень), along with pig trotters or ears or cow "knees", but are the preferred ingredients among Russian Jews because they can be Kosher.\r\n\r\nVersions of oxtail soup are popular traditional dishes in South America, West Africa, China, Spain [2] and Indonesia. In Chinese cuisine, it's usually made into a soup called 牛尾汤 (niúwěi tāng, "oxtail soup"). In Korean cuisine, a soup made with oxtail is called kkori gomtang (see gomguk). It is a thick soup seasoned with salt and eaten with a bowl of rice. It can be used as a stock for making tteokguk (rice cake soup). Stewed oxtail with butter bean or as main dish (with rice) is popular in Jamaica, Trinidad, and other West Indian cultures. Oxtail is also very popular in South Africa where it is often cooked in a traditional skillet called a potjie, which is a three-legged cast iron pot placed over an open fire. Oxtail is also eaten in other southern parts of Africa like Zimbabwe and served with sadza and greens. In the United States, oxtail is a mainstay in African American and West Indian households. In Cuban cuisine, a stew can be made from oxtail called rabo encendido. In the Philippines, it is prepared in a peanut based stew called Kare-kare. In Iran, Oxtail is slow-cooked and served as a substitute for shank in a main dish called Baghla-Poli-Mahicheh which is prepared with rice, shank (or oxtail) and a mixture of herbs including dill, coriander, parsley and garlic.\r\n\r\nIn the United States, oxtail has the meat-cutting classification NAMP 1791.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3841.png
221	Mirin	A type of sweet rice wine that is commonly used in Japanese cuisine for its mild sweetness and ability to balance flavors in dishes like teriyaki sauce.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f7.png
222	Lard	Rendered pork fat that is often used in cooking and baking for added flavor and texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3800.png
223	Celery Salt	A seasoning made from ground celery seeds and salt, often used as a flavoring for snacks, seasonings, and condiments, such as Bloody Mary cocktails, pickles, and potato chips.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e368b.png
224	Fish Sauce	A pungent, salty sauce made from fermented fish commonly used in Southeast Asian cuisine as a seasoning and condiment.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d4.png
225	French Lentils	Small, greenish-brown lentils that have a slightly nutty flavor and a firm texture. They hold their shape well when cooked and are often used in salads and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36dc.png
226	Refried Beans	Cooked and mashed beans, typically pinto beans, that are fried in oil or lard along with various seasonings and often used as a filling in burritos, tacos, and other Mexican dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3752.png
227	Dark Soy Sauce	A type of soy sauce that is aged for a longer period of time than light soy sauce, giving it a darker color, thicker consistency, and more intense flavor. It is often used in marinades, stir-fries, and braised dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36bd.png
231	Pilchards	A type of small, oily fish similar to sardines, often canned in oil or tomato sauce and served as a snack or added to pasta dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ac.png
232	Brie	A soft, creamy cheese with a mild flavor and edible rind, often used in sandwiches and as a topping for crackers and breads	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3829.png
233	Nutmeg	A spice that is made from the seed of the nutmeg tree, and is often used in cooking and baking for its warm, sweet, and spicy flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e372a.png
234	Caramel Sauce	A sweet, sticky sauce made by heating sugar until it melts and caramelizes, often used as a topping for desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a0.png
235	Little Gem Lettuce	Little Gem lettuce is a small variety of lettuce that is similar in appearance to romaine lettuce, but smaller and more compact. It has a slightly sweet, nutty flavor and a crisp texture, and is commonly used in salads and sandwiches.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3717.png
236	Tarragon Leaves	A popular herb used in French cuisine with a subtle anise flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e382a.png
237	Green Salsa	A salsa made from tomatillos, green chili peppers, onions, and other ingredients resulting in a tangy and slightly spicy flavor commonly used as a dip or condiment.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f5.png
238	Peanut Butter	A spread made from ground peanuts, commonly used as a sandwich filling and in baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3739.png
239	Hard Taco Shells	Hard taco shells are a type of crispy corn tortilla that is shaped like a taco shell. They are often filled with meat, cheese, lettuce, and other toppings to create a classic Mexican-style taco.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36fa.png
240	Couscous	Small granules of semolina wheat, commonly used as a side dish or as a base for salads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c1.png
241	Lamb Leg	Meat from the leg of a young sheep, commonly used for roasting and grilling.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37bd.png
242	Caramel	A type of candy made by heating sugar and other ingredients until they turn a golden brown color and develop a rich, sweet flavor. Can be used as a topping for desserts, as a flavoring for coffee or cocktails, or eaten on its own as a candy.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e379f.png
243	Turmeric	A bright yellow spice commonly used in Indian and Southeast Asian cuisines, known for its earthy flavor and health benefits.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3782.png
244	Tahini	A paste made from toasted sesame seeds that is commonly used in Middle Eastern cuisine, particularly as a dip or sauce for dishes like falafel and shawarma.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f2.png
245	Red Chilli Powder	A spice made from dried and ground red chili peppers that is often used to add heat and flavor to dishes such as curries, soups, and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e374d.png
246	Chestnuts	Chestnuts are a type of nut that grow inside a prickly outer shell. They have a sweet, nutty flavor and can be eaten roasted, boiled, or used in desserts and other culinary applications.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e9.png
247	Cumin	A spice that is commonly used in cooking and has a warm, earthy flavor. It is often used in Indian, Middle Eastern, and Mexican cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b8.png
248	Cream Cheese	A soft, spreadable cheese made from a blend of milk and cream, with a mild flavor and creamy texture. Often used as a topping for bagels, as a base for dips and spreads, or as an ingredient in baking recipes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e379c.png
249	Pepper	A spice made from ground dried peppercorns, commonly used in cooking and as a table seasoning for its pungent and spicy flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e373f.png
250	Grand Marnier	Grand Marnier is a French brand of liqueurs. The brand's best-known product is Grand Marnier Cordon Rouge, an orange-flavored liqueur created in 1880 by Alexandre Marnier-Lapostolle. It is made from a blend of Cognac brandy, distilled essence of bitter orange, and sugar. Grand Marnier Cordon Rouge is 40% alcohol.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e386a.png
251	Cubed Feta Cheese	A salty, tangy cheese that is made from sheep or goat's milk. It is commonly used in Greek cuisine and is often crumbled over salads or used in dips and spreads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b6.png
252	Italian Fennel Sausages	Pork sausages flavored with fennel seeds and other herbs and spices, commonly used in Italian cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3702.png
253	Kidney Beans	Red or dark red beans that are kidney-shaped and commonly used in various cuisines around the world, especially in Latin American and Caribbean dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f0.png
254	Roasted Vegetables	Assortment of vegetables such as bell peppers, onions, carrots, and zucchini that have been seasoned and roasted in the oven until tender and caramelized.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ef.png
255	Cinnamon Stick	A stick made from the inner bark of cinnamon trees, commonly used as a spice in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a6.png
256	Bean Sprouts	Bean sprouts are a common ingredient across the world. They are particularly common in Eastern Asian cuisine.\r\n\r\nThere are two types of common bean sprouts:\r\n\r\nMung bean sprout is made from the greenish-capped mung beans\r\nSoybean sprout is made from yellow, larger-grained soybean\r\nIt typically takes one week for them to become fully grown. The sprouted beans are more nutritious than the original beans and they require much less cooking time.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3852.png
257	Mussels	A type of shellfish with a black, shiny shell and soft, orange flesh, often steamed or boiled and served with garlic butter or white wine sauce.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a5.png
258	Biryani Masala	Biryani, also known as biriyani, biriani, birani or briyani, is a mixed rice dish with its origins among the Muslims of the Indian subcontinent. It can be compared to mixing a curry, later combining it with semi-cooked rice separately. This dish is especially popular throughout the Indian subcontinent, as well as among the diaspora from the region. It is also prepared in other regions such as Iraqi Kurdistan. It is made with Indian spices, rice, meat (chicken, goat, beef, lamb, prawn, or fish), vegetables or eggs.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3671.png
259	Minced Pork	Ground pork used in a variety of dishes, such as meatballs, burgers, and stir-fries.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3833.png
260	Walnuts	Hard-shelled nuts that are rich in healthy fats and protein, often used in baking, snacking, or as a garnish for salads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d7.png
261	Spaghetti	A type of pasta that is long, thin, and cylindrical in shape. It is commonly used in Italian cuisine and is often served with tomato sauce, meatballs, or other sauces and toppings.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e376e.png
262	White Vinegar	A clear, colorless vinegar made from fermented grains or malt, used for cooking, cleaning, and pickling.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3793.png
263	Canola Oil	A type of vegetable oil made from the rapeseed plant, commonly used for cooking due to its mild flavor and high smoke point.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3838.png
264	Double Cream	A type of cream that has a high fat content, typically around 48%. It is often used in desserts and sauces, as well as whipped for use as a topping.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c3.png
265	Oats	A type of cereal grain used for making oatmeal, granola, and other baked goods	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e381f.png
266	Quinoa	Quinoa is a flowering plant in the amaranth family. It is an herbaceous annual plant grown as a crop primarily for its edible seeds; the seeds are rich in protein, dietary fiber, B vitamins, and dietary minerals in amounts greater than in many grains.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e387f.png
267	Garlic	A bulbous plant related to onions, chives, and shallots, known for its pungent flavor and aroma. It is used in many cuisines around the world and is a staple ingredient in Mediterranean and Asian cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e3.png
268	Egg Plants	Also known as aubergines, eggplants are a type of vegetable with a deep purple skin and creamy white flesh. They are often used in Mediterranean and Asian cuisine, and can be roasted, grilled, fried, or stewed.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c6.png
269	Gelatine Leafs	Gelatin leaves are thin, translucent sheets made from gelatin that are used to set liquids in desserts and other culinary applications.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e2.png
270	Redcurrants	Small, bright red berries with a tart flavor, often used in jams, jellies, and sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e380a.png
271	Monkfish	A type of fish with a broad, flat head and a long, tapered body, often used in stews or roasted with herbs and vegetables.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a7.png
272	Persian Cucumber	Cucumber (Cucumis sativus) is a widely cultivated plant in the gourd family, Cucurbitaceae. It is a creeping vine that bears cucumiform fruits that are used as vegetables. There are three main varieties of cucumber: slicing, pickling, and seedless. Within these varieties, several cultivars have been created. In North America, the term "wild cucumber" refers to plants in the genera Echinocystis and Marah, but these are not closely related. The cucumber is originally from South Asia, but now grows on most continents. Many different types of cucumber are traded on the global market.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3879.png
273	Coco Sugar	A natural sweetener made from the sap of coconut palms, commonly used as a substitute for refined sugar.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a8.png
274	Apple Cider Vinegar	Apple cider vinegar, or cider vinegar, is a vinegar made from fermented apple juice, and used in salad dressings, marinades, vinaigrettes, food preservatives, and chutneys. It is made by crushing apples, then squeezing out the juice. Bacteria and yeast are added to the liquid to start the alcoholic fermentation process, which converts the sugars to alcohol. In a second fermentation step, the alcohol is converted into vinegar by acetic acid-forming bacteria (Acetobacter species). Acetic acid and malic acid combine to give vinegar its sour taste. Apple cider vinegar has no medicinal or nutritional value. There is no high-quality clinical evidence that regular consumption of apple cider vinegar helps to maintain or lose body weight, or is effective to manage blood glucose and lipid levels.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3660.png
275	Potatoe Buns	Potato bread is a form of bread in which potato flour or potato replaces a portion of the regular wheat flour. It is cooked in a variety of ways, including baking it on a hot griddle or pan, or in an oven. It may be leavened or unleavened, and may have a variety of other ingredients baked into it. The ratio of potato to wheat flour varies significantly from recipe to recipe, with some recipes having a majority of potato, and others having a majority of wheat flour. Some recipes call for mashed potatoes, with others calling for dehydrated potato flakes. It is available as a commercial product in many countries, with similar variations in ingredients, cooking method, and other variables.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3872.png
276	Paneer	Paneer is a type of fresh cheese that is popular in Indian cuisine. It is made by curdling milk with lemon juice or vinegar and then draining the whey. Paneer has a mild, creamy flavor and a crumbly texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ec.png
277	White Chocolate Chips	Small pieces of sweetened, cocoa butter-based chocolate without the addition of cocoa solids, often used in baking and confectionery.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3790.png
278	Golden Syrup	A thick, amber-colored syrup made from sugar commonly used as a sweetener in baking and desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ec.png
279	Garlic Clove	A small, bulbous vegetable consisting of several smaller cloves with a pungent flavor commonly used in cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e4.png
280	Dark Brown Soft Sugar	Similar to light brown sugar, but with a stronger molasses flavor and darker color, often used in recipes for gingerbread, baked beans, and barbecue sauce.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37db.png
281	Whole Wheat	A type of wheat that contains the bran, germ, and endosperm, used to make whole wheat flour and products such as bread and pasta.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3796.png
282	Creme Fraiche	A cultured dairy product that is similar to sour cream but has a milder flavor and is less tangy. It is commonly used as a topping for desserts and savory dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b5.png
283	Ginger	A root vegetable with a pungent and spicy flavor commonly used in cooking and herbal medicine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e8.png
284	Oregano	A herb with a pungent and slightly bitter taste, commonly used in Mediterranean and Mexican cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3731.png
285	Salmon	Salmon is the common name for several species of ray-finned fish in the family Salmonidae. Other fish in the same family include trout, char, grayling and whitefish. Salmon are native to tributaries of the North Atlantic (genus Salmo) and Pacific Ocean (genus Oncorhynchus). Many species of salmon have been introduced into non-native environments such as the Great Lakes of North America and Patagonia in South America. Salmon are intensively farmed in many parts of the world.\r\n\r\nTypically, salmon are anadromous: they hatch in fresh water, migrate to the ocean, then return to fresh water to reproduce. However, populations of several species are restricted to fresh water through their lives. Folklore has it that the fish return to the exact spot where they hatched to spawn. Tracking studies have shown this to be mostly true. A portion of a returning salmon run may stray and spawn in different freshwater systems; the percent of straying depends on the species of salmon. Homing behavior has been shown to depend on olfactory memory. Salmon date back to the Neogene.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e365c.png
286	Paella Rice	Paella[a] is a Valencian rice dish that has ancient roots but its modern form originated in the mid-19th century in the area around Albufera lagoon on the east coast of Spain, adjacent to the city of Valencia. Many non-Spaniards view paella as Spain's national dish, but most Spaniards consider it to be a regional Valencian dish. Valencians, in turn, regard paella as one of their identifying symbols.\r\n\r\nTypes of paella include Valencian paella, vegetable paella (Spanish: paella de verduras), seafood paella (Spanish: paella de mariscos), and mixed paella (Spanish: paella mixta), among many others. Valencian paella is believed to be the original recipe and consists of white rice, green beans (bajoqueta and tavella), meat (chicken, duck and rabbit), white beans (garrofón), snails, and seasoning such as saffron and rosemary. Another very common but seasonal ingredient is artichokes. Seafood paella replaces meat with seafood and omits beans and green vegetables. Mixed paella is a free-style combination of meat from land animals, seafood, vegetables, and sometimes beans. Most paella chefs use bomba rice due to it being less likely to overcook, but Valencians tend to use a slightly stickier (and thus more susceptible to overcooking) variety known as Senia. All types of paellas use olive oil.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e383f.png
287	Dried Apricots	Apricots that have been dried to preserve them, with a chewy texture and sweet, tangy flavor, commonly used in baked goods, trail mixes, and savory dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d2.png
288	Goose Fat	Fat obtained from the rendered meat of a goose, commonly used for frying or roasting potatoes, vegetables, and meats to add flavor and texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c6.png
289	Lemon Juice	Lemon juice is the acidic liquid obtained from squeezing or pressing fresh lemons. It is commonly used as a flavoring agent in cooking, baking, and beverages.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3712.png
290	Black Pudding	A type of sausage made from pork blood, suet, and oatmeal, often served as part of a traditional English breakfast.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3815.png
291	Ricotta	A soft, creamy Italian cheese with a mild, slightly sweet flavor and grainy texture, often used in Italian dishes like lasagna, ravioli, and cannoli.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d1.png
292	Carrots	A root vegetable that is commonly used in cooking and baking, with a sweet and earthy flavor, and high in vitamin A and other nutrients.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3684.png
293	Swede	A root vegetable that is also known as rutabaga or yellow turnip, and is often used in stews and soups, as well as mashed as a side dish.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37fc.png
294	Coriander	A herb commonly used in cooking that has a citrusy, slightly sweet flavor. It is also known as cilantro in some countries.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36af.png
295	Basil Leaves	Basil, also called great basil, is a culinary herb of the family Lamiaceae (mints).\r\n	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3668.png
296	Bread	A staple food made from flour, water, and yeast or other leavening agents, which is typically baked in an oven and used for sandwiches, toast, and other dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3678.png
297	Minced Garlic	Garlic cloves that have been finely chopped or crushed, commonly used as a flavoring in various cuisines.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3720.png
298	Tomato	A juicy, edible fruit that is often used as a vegetable in cooking. Tomatoes are a good source of vitamin C, potassium, and lycopene, a powerful antioxidant.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37af.png
299	Blackberries	Sweet and juicy berries with a dark color and slightly tart taste, often used in jams, pies, and smoothies.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e380b.png
300	Mayonnaise	Mayonnaise, informally mayo is a thick cold condiment or dressing commonly used in sandwiches and composed salads or on French fries. It is also a base in sauces such as Tartar sauce.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e387a.png
301	Cacao	The dried and fermented seed of the cocoa tree, which is processed into cocoa powder and chocolate products, and used in baking, confectionery, and other food products.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e367f.png
302	Dried Oregano	A dried herb that is commonly used in Mediterranean and Mexican cuisine. It has a pungent, slightly bitter flavor that pairs well with tomato-based sauces, meats, and vegetables.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c4.png
303	Parmesan Cheese	See Parmesan.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3736.png
304	Granulated Sugar	A common sweetener made from sugar cane or sugar beet that has been refined and granulated.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ee.png
305	Grape Tomatoes	A small, bite-sized tomato variety with a sweet and slightly tangy flavor commonly used in salads and as a snack.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ef.png
306	Italian Seasoning	A blend of dried herbs and spices commonly used in Italian cuisine, including basil, oregano, rosemary, thyme, and garlic.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3703.png
307	Ciabatta	Ciabatta is an Italian white bread made from wheat flour, water, salt, yeast and olive oil, created in 1982 by a baker in Adria, province of Rovigo, Veneto, Italy, in response to the popularity of French baguettes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3897.png
308	Rice Stick Noodles	Thick, flat noodles made from rice flour and water and commonly used in Southeast Asian cuisine, such as in pad see ew or char kway teow.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3755.png
309	Chicken	The chicken is a type of domesticated fowl, a subspecies of the red junglefowl (Gallus gallus). It is one of the most common and widespread domestic animals, with a total population of more than 19 billion as of 2011. There are more chickens in the world than any other bird or domesticated fowl. Humans keep chickens primarily as a source of food (consuming both their meat and eggs) and, less commonly, as pets. Originally raised for cockfighting or for special ceremonies, chickens were not kept for food until the Hellenistic period (4th–2nd centuries BC).\r\n\r\nGenetic studies have pointed to multiple maternal origins in South Asia, Southeast Asia, and East Asia, but with the clade found in the Americas, Europe, the Middle East and Africa originating in the Indian subcontinent. From ancient India, the domesticated chicken spread to Lydia in western Asia Minor, and to Greece by the 5th century BC. Fowl had been known in Egypt since the mid-15th century BC, with the "bird that gives birth every day" having come to Egypt from the land between Syria and Shinar, Babylonia, according to the annals of Thutmose III.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e365b.png
310	Cashews	Same as 'Cashew Nuts', a type of nut that is often used in cooking and snacking, with a mild, buttery flavor and a creamy texture when roasted or ground into a paste.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3686.png
311	Onion Salt	A seasoning made from a mixture of dried onion powder and salt.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e372d.png
312	Lettuce	Lettuce is a leafy green vegetable that is commonly used in salads, sandwiches, and as a garnish. There are many different varieties of lettuce, including romaine, iceberg, and butterhead, each with its own unique flavor and texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3715.png
313	Beef Fillet	Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times. Beef is a source of high-quality protein and nutrients.\r\n\r\nMost beef skeletal muscle meat can be used as is by merely cutting into certain parts, such as roasts, short ribs or steak (filet mignon, sirloin steak, rump steak, rib steak, rib eye steak, hanger steak, etc.), while other cuts are processed (corned beef or beef jerky). Trimmings, on the other hand, are usually mixed with meat from older, leaner (therefore tougher) cattle, are ground, minced or used in sausages. The blood is used in some varieties called blood sausage. Other parts that are eaten include other muscles and offal, such as the oxtail, liver, tongue, tripe from the reticulum or rumen, glands (particularly the pancreas and thymus, referred to as sweetbread), the heart, the brain (although forbidden where there is a danger of bovine spongiform encephalopathy, BSE, commonly referred to as mad cow disease), the kidneys, and the tender testicles of the bull (known in the United States as calf fries, prairie oysters, or Rocky Mountain oysters). Some intestines are cooked and eaten as is, but are more often cleaned and used as natural sausage casings. The bones are used for making beef stock.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e366d.png
351	Cheddar Cheese	A hard, yellow cheese that is typically sharp and tangy in flavor. It is often used in sandwiches, on crackers, or as a topping for baked dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e368e.png
352	White Chocolate	A type of chocolate made with cocoa butter, sugar, milk solids, and vanilla, without cocoa solids.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e382d.png
353	Fennel	A herb with a sweet, anise-like flavor commonly used in Mediterranean and Middle Eastern cuisine to add flavor to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c8.png
373	Raspberries	Small, red berries with a sweet-tart flavor and delicate texture, commonly used in desserts like pies, tarts, and cheesecakes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d5.png
560	Chives	A herb with long, thin green leaves used to add a mild onion-like flavor to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e382b.png
314	Doubanjiang	Doubanjiang (IPA: [tôupântɕjâŋ]), or simply Douban, or Toban-djan, Chili bean sauce, is a spicy, salty paste made from fermented broad beans, soybeans, salt, rice, and various spices. Doubanjiang exists in plain and spicy versions, with the latter containing red chili peppers and called la doubanjiang (辣豆瓣酱; pinyin: là dòubànjiàng; là meaning "hot" or "spicy").\r\n\r\nIt is used particularly in Sichuan cuisine, and in fact, the people of the province commonly refer to it as "the soul of Sichuan cuisine". A particularly well-known variety is called Pixian Douban (simplified Chinese: 郫县豆瓣; traditional Chinese: 郫縣豆瓣; pinyin: Píxiàn dòubàn), named after the district of Pixian, Sichuan.[1]\r\n\r\nThis sauce is sometimes stir-fried with oil and eaten with rice or noodles as a quick meal, and is also commonly used as a primary flavoring for fried tofu dishes and cold tofu salads. It is also frequently mixed with instant noodles.\r\n\r\nIn many Chinese communities and food factories, doubanjiang is produced with only soybeans and salt, and does not contain the broad beans or chili peppers typical of Sichuan-style doubanjiang.\r\n\r\nIn Korean cuisine, a similar form of bean paste is called doenjang.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3848.png
315	Baby Aubergine	Eggplant (Solanum melongena) or aubergine is a species of nightshade grown for its edible fruit. Eggplant is the common name in North America, Australia and New Zealand; in British English, it is aubergine, and in South Asia and South Africa, brinjal.\r\n\r\nThe fruit is widely used in cooking. As a member of the genus Solanum, it is related to the tomato and the potato. It was originally domesticated from the wild nightshade species, the thorn or bitter apple, S. incanum, probably with two independent domestications, one in South Asia and one in East Asia.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e383e.png
316	Hot Beef Stock	Hot beef stock is a flavorful liquid made by simmering beef bones and vegetables in water. It is commonly used as a base for soups, stews, and sauces to add richness and depth of flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ff.png
317	Cod	A type of fish that is commonly used in cooking due to its mild flavor and versatility, and is often used in dishes such as fish and chips.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3839.png
318	Mixed Peel	A mixture of chopped candied citrus peel, often used in baking and cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3809.png
319	Lamb Mince	Also known as ground lamb, lamb mince is made by grinding lamb meat and can be used in a variety of dishes, including meatballs, burgers, and shepherd's pie.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e370d.png
320	Vegetable Stock Cube	A dehydrated and compressed form of vegetable stock used to add flavor to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e378b.png
321	Cheese Curds	Fresh cheese that has not yet been aged. It has a mild, slightly salty flavor and a springy, squeaky texture. It is often used in dishes such as poutine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3690.png
322	White Wine	A type of wine made from white grapes, often used in cooking for its acidity and fruity flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3794.png
323	Gochujang	Gochujang or red chili paste is a savory, sweet, and spicy fermented condiment made from chili powder, glutinous rice, meju powder, yeotgireum, and salt.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3851.png
324	Tomato Sauce	A sauce made from cooked, pureed tomatoes that is used as a base for many Italian and Mediterranean dishes like pasta sauces, pizzas, and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ce.png
325	Chicken Thighs	A cut of chicken meat that comes from the thigh of the bird. It is dark and flavorful, and can be cooked in a variety of ways, such as baking, frying, or grilling.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3697.png
326	Custard	A sweet dessert made with milk, sugar, eggs, and vanilla, thickened with cornstarch or flour.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3808.png
327	Plain Flour	A finely ground flour made from wheat that is often used as a basic ingredient in many recipes, including cakes, breads, and pastries.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3743.png
328	Shredded Monterey Jack Cheese	Shredded Monterey Jack cheese is a type of cheese that is commonly used in Mexican cuisine. It has a mild flavor and a creamy texture, and melts easily, making it ideal for dishes like nachos, quesadillas, and tacos.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3767.png
329	Vegetable Stock	A liquid made by simmering vegetables in water with herbs and spices, used as a base for soups, stews, and sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e378a.png
330	Cream	A dairy product that is made by separating the cream from milk. It is commonly used in cooking and baking to add richness and flavor to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b4.png
331	Rhubarb	Rhubarb is a general term used for the cultivated plants in the genus Rheum in the family Polygonaceae. It is a herbaceous perennial growing from short, thick rhizomes. Historically, different plants have been called "rhubarb" in English.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e387c.png
332	Eggs	A reproductive cell laid by female animals, often used in baking and cooking as a binding agent or to add texture and flavor	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ca.png
333	Prosciutto	A thinly sliced, dry-cured ham from Italy, often used as a topping for pizzas and pastas or served on charcuterie boards	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3827.png
334	Ground Almonds	Ground almonds are finely powdered almonds that can be used as a gluten-free alternative to wheat flour in baking or as a topping for dishes like oatmeal or yogurt.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f6.png
335	Oil	A cooking ingredient that is derived from various sources, such as plants, nuts, seeds, and animals, and is often used for frying, sautéing, and as a salad dressing.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e372b.png
336	Cider	Cider (/ˈsaɪdər/ SY-dər) is an alcoholic beverage made from the fermented juice of apples. Cider is widely available in the United Kingdom (particularly in the West Country) and the Republic of Ireland. The UK has the world's highest per capita consumption, as well as its largest cider-producing companies. Ciders from the South West of England are generally stronger. Cider is also popular in many Commonwealth countries, such as India, Canada, Australia, and New Zealand. As well as the UK and its former colonies, cider is popular in Portugal (mainly in Minho and Madeira), France (particularly Normandy and Brittany), northern Italy (Piedmont and Friuli), and northern Spain (especially the Principality of Asturias and the Basque Country). Central Europe also has its own types of cider with Rhineland-Palatinate and Hesse producing a particularly tart version known as Apfelwein. In the U.S., varieties of fermented cider are often called hard cider to distinguish alcoholic cider from non-alcoholic apple cider or "sweet cider", also made from apples. In Canada, cider cannot be called cider if there are no apples. Furthermore, according to the Food and Drug Regulations in Canada, cider cannot contain less than 2.5% or over 13% absolute alcohol by volume.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3894.png
337	Milk Chocolate	A type of chocolate that is made with milk powder, sugar, and cocoa solids. It has a creamy and sweet taste.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37dd.png
338	Monterey Jack Cheese	A semi-hard, American cheese that is mild in flavor and melts easily, making it a popular choice for sandwiches, burgers, and Mexican cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3723.png
339	Beef Gravy	Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times. Beef is a source of high-quality protein and nutrients.\r\n\r\nMost beef skeletal muscle meat can be used as is by merely cutting into certain parts, such as roasts, short ribs or steak (filet mignon, sirloin steak, rump steak, rib steak, rib eye steak, hanger steak, etc.), while other cuts are processed (corned beef or beef jerky). Trimmings, on the other hand, are usually mixed with meat from older, leaner (therefore tougher) cattle, are ground, minced or used in sausages. The blood is used in some varieties called blood sausage. Other parts that are eaten include other muscles and offal, such as the oxtail, liver, tongue, tripe from the reticulum or rumen, glands (particularly the pancreas and thymus, referred to as sweetbread), the heart, the brain (although forbidden where there is a danger of bovine spongiform encephalopathy, BSE, commonly referred to as mad cow disease), the kidneys, and the tender testicles of the bull (known in the United States as calf fries, prairie oysters, or Rocky Mountain oysters). Some intestines are cooked and eaten as is, but are more often cleaned and used as natural sausage casings. The bones are used for making beef stock.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e366e.png
340	Butter	A dairy product made from churning cream or milk, with a high fat content and a creamy, rich flavor that is often used in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e367e.png
341	Candied Peel	Candied fruit, also known as crystallized fruit or glacé fruit, has existed since the 14th century. Whole fruit, smaller pieces of fruit, or pieces of peel, are placed in heated sugar syrup, which absorbs the moisture from within the fruit and eventually preserves it.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3869.png
342	Parma Ham	A type of dry-cured ham that is typically sliced thinly and served uncooked, originating from the Parma region of Italy.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3734.png
343	Asparagus	Asparagus, or garden asparagus, folk name sparrow grass, scientific name Asparagus officinalis, is a perennial flowering plant species in the genus Asparagus. Its young shoots are used as a spring vegetable.\r\n\r\nIt was once classified in the lily family, like the related Allium species, onions and garlic. However, genetic research places lilies, Allium, and asparagus in three separate families—the Liliaceae, Amaryllidaceae, and Asparagaceae, respectively—with the Amaryllidaceae and Asparagaceae being grouped together in the order Asparagales. Sources differ as to the native range of Asparagus officinalis, but generally include most of Europe and western temperate Asia. It is widely cultivated as a vegetable crop.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3661.png
344	Green Beans	A long and slender vegetable with a mild, slightly sweet flavor commonly used in salads, stir-fries, and as a side dish.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f1.png
345	Mustard	A condiment that is made from ground mustard seeds, vinegar, and other seasonings, and is often used as a spread, sauce, or flavoring in cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3727.png
346	Small Potatoes	Small potatoes are a variety of potatoes that are small in size, typically less than two inches in diameter. They can be used in a variety of dishes and are often roasted, boiled, or mashed.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3768.png
347	Thai Fish Sauce	A salty, pungent sauce made from fermented fish, used as a seasoning in many Southeast Asian dishes, particularly in Thai cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3779.png
348	Baby Plum Tomatoes	The tomato is the edible, often red, berry of the plant Solanum lycopersicum, commonly known as a tomato plant. The species originated in western South America and Central America. The Nahuatl (Aztec language) word tomatl gave rise to the Spanish word tomate, from which the English word tomato derived.[3][4] Its domestication and use as a cultivated food may have originated with the indigenous peoples of Mexico. The Aztecs used tomatoes in their cooking at the time of the Spanish conquest of the Aztec Empire, and after the Spanish encountered the tomato for the first time after their contact with the Aztecs, they brought the plant to Europe. From there, the tomato was introduced to other parts of the European-colonized world during the 16th century.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3663.png
349	Puff Pastry	A light, flaky pastry that is made by layering butter and dough and then repeatedly folding and rolling the dough to create many layers.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3748.png
350	Suet	A type of animal fat that is commonly used in British cuisine for making pastry and puddings, and is particularly associated with dishes like Christmas pudding and steak and kidney pie.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37fb.png
354	Duck Sauce	Duck sauce (or orange sauce) is a condiment with a sweet and sour flavor and a translucent orange appearance similar to a thin jelly. Offered at Chinese-American restaurants, it is used as a dip for deep-fried dishes such as wonton strips, spring rolls, egg rolls, duck, chicken, fish, or with rice or noodles. It is often provided in single-serving packets along with soy sauce, mustard, hot sauce or red chili powder. It may be used as a glaze on foods, such as poultry. Despite its name the sauce is not prepared using duck meat.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3850.png
355	Mint	A fragrant herb that is often used as a flavoring in cooking and beverages, and is known for its refreshing and cooling properties.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3722.png
356	Capers	Small, pickled flower buds with a tangy, slightly salty flavor, commonly used in Mediterranean and Italian cuisine to add flavor to dishes like pasta sauces, salads, and fish dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d3.png
357	Rice	Edible starchy grain that is cultivated in many parts of the world and is a staple food for a large part of the world's population.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3753.png
358	Lean Minced Beef	Also known as ground beef, lean minced beef is made by grinding beef meat and has a lower fat content than regular ground beef. It can be used in a variety of dishes, including meatballs, burgers, and chili.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e370f.png
359	Blue Food Colouring	A type of food coloring used to add a bright blue color to foods and drinks.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3810.png
360	Chinese Broccoli	Also known as Gai Lan, it is a leafy green vegetable commonly used in Chinese cuisine, similar to broccoli but with a slightly bitter taste and thicker stems.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e369d.png
361	Zucchini	A type of summer squash with a green or yellowish skin and a mild, slightly sweet flavor. Commonly used in salads, soups, and stir-fries, and can also be grilled or roasted as a side dish.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e379a.png
362	Almonds	A type of nut with a sweet and nutty flavor, commonly used in baking and as a snack.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3814.png
363	Sunflower Oil	An oil that is made from sunflower seeds and is commonly used in cooking and baking. It is low in saturated fat and high in vitamin E, and is often used in salad dressings, marinades, and frying.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3776.png
364	Butter Beans	Large, creamy white beans with a buttery texture and mild, nutty flavor, often used in soups, stews, and salads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37cc.png
365	Self-raising Flour	Self-raising flour is a type of flour that has a leavening agent, usually baking powder, already added to it. This allows baked goods to rise without the need for yeast or other leavening agents.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3762.png
366	Tomato Ketchup	A thick, sweet and tangy sauce made from tomatoes, vinegar, and sugar, commonly used as a condiment for burgers, hot dogs, and french fries.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e377d.png
367	Rum	Rum is a distilled alcoholic drink made from sugarcane byproducts, such as molasses, or directly from sugarcane juice, by a process of fermentation and distillation. The distillate, a clear liquid, is then usually aged in oak barrels.\r\n\r\nThe majority of the world's rum production occurs in the Caribbean and Latin America. Rum is also produced in Australia, Portugal, Austria, Canada, Fiji, India, Japan, Mauritius, Nepal, New Zealand, the Philippines, Reunion Island, South Africa, Spain, Sweden, Taiwan, Thailand, the United Kingdom and the United States.\r\n\r\nRums are produced in various grades. Light rums are commonly used in cocktails, whereas "golden" and "dark" rums were typically consumed straight or neat, on the rocks, or used for cooking, but are now commonly consumed with mixers. Premium rums are also available, made to be consumed either straight or iced.\r\n\r\nRum plays a part in the culture of most islands of the West Indies as well as in The Maritimes and Newfoundland. This drink has famous associations with the Royal Navy (where it was mixed with water or beer to make grog) and piracy (where it was consumed as bumbo). Rum has also served as a popular medium of economic exchange, used to help fund enterprises such as slavery (see Triangular trade), organized crime, and military insurgencies (e.g., the American Revolution and Australia's Rum Rebellion).	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3857.png
368	Tofu	Tofu, also known as bean curd, is a food cultivated by coagulating soy milk and then pressing the resulting curds into soft white blocks. It is a component in East Asian and Southeast Asian cuisines. Tofu can be soft, firm, or extra firm. Tofu has a subtle flavor and can be used in savory and sweet dishes. It is often seasoned or marinated to suit the dish.\r\n\r\nTofu has a low calorie count and relatively large amounts of protein. It is high in iron, and it can have a high calcium or magnesium content, depending on the coagulants used in manufacturing (e.g. calcium chloride, calcium sulfate, magnesium sulfate).	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3847.png
369	Kielbasa	Kielbasa is any type of meat sausage from Poland, and a staple of Polish cuisine. In American English the word typically refers to a coarse, U-shaped smoked sausage of any kind of meat, which closely resembles the Wiejska sausage in British English.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e388b.png
370	Squash	A type of vegetable that comes in many different varieties, including butternut, acorn, and spaghetti squash. It is high in vitamins and fiber, and can be roasted, grilled, baked, or used in soups and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3771.png
371	Goats Cheese	A soft, tangy cheese made from the milk of goats, often used in salads, sandwiches, and as a topping for pizzas and pastas	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3826.png
372	Turkey Mince	Ground meat made from turkey, commonly used as a lower-fat alternative to beef mince in a variety of dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c3.png
374	Goat Meat	The domestic goat or simply goat (Capra aegagrus hircus) is a subspecies of C. aegagrus domesticated from the wild goat of Southwest Asia and Eastern Europe. The goat is a member of the animal family Bovidae and the goat—antelope subfamily Caprinae, meaning it is closely related to the sheep. There are over 300 distinct breeds of goat. Goats are one of the oldest domesticated species of animal, and have been used for milk, meat, fur, and skins across much of the world. Milk from goats is often turned into goat cheese.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3863.png
375	Wholegrain Bread	Bread made from flour that contains the whole grain, providing more fiber and nutrients than refined flour bread.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3797.png
376	Chili Powder	A blend of ground chili peppers, cumin, garlic powder, and other spices. It is often used to add heat and flavor to dishes such as chili, stews, and marinades.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3699.png
377	Buckwheat	Buckwheat (Fagopyrum esculentum), or common buckwheat, is a plant cultivated for its grain-like seeds and as a cover crop. The name "buckwheat" is used for several other species, such as Fagopyrum tataricum, a domesticated food plant raised in Asia. Despite the name, buckwheat is not closely related to wheat, as it is not a grass. Instead, buckwheat is related to sorrel, knotweed, and rhubarb. Buckwheat is referred to as a pseudocereal because its seeds' culinary use is the same as cereals', owing to their composition of complex carbohydrates.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3898.png
378	Orange Blossom Water	Orange flower water, or orange blossom water, is the clear, perfumed by-product of the distillation of fresh bitter-orange blossoms for their essential oil.\r\n\r\nUses\r\nMediterranean Relief.jpg\r\nThis essential water has traditionally been used as an aromatizer in many Mediterranean traditional dessert dishes, such as in France for the gibassier and pompe à l'huile or in Spain for the Roscón de Reyes (King cake), or the Samsa in Tunisia or in Moroccan coffee, but has more recently found its way into other cuisines. For example, orange flower water is used in Europe to flavor madeleines, in Mexico to flavor little wedding cakes and Pan de muerto, and in the United States to make orange blossom scones and marshmallows. Orange flower water is also used as an ingredient in some cocktails, such as the Ramos Gin Fizz. In Malta and many North African as well as Middle Eastern countries, orange blossom water is widely used as medicine for stomach ache and given to small children as well as adults.\r\n\r\nOrange flower water has been a traditional ingredient used often in North African as well as in Middle Eastern cooking. In Arab variants of baklava, orange blossom water is often mixed with the sweet syrup for flavor. Orange blossoms are believed to be used in this manner because they are seen as the traditional bridal flower and, therefore, symbolize purity (white, small and delicate). It is also added to plain water in the Middle East to mask high mineral content and other unpleasant flavors (e.g. those arising from storage in a qulla, a type of clay jug that keeps water cool in a manner similar to the zeer); some add the fragrance irrespective of the taste of the plain water.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3868.png
379	Breadcrumbs	Small pieces of bread that have been dried and ground into a coarse powder, often used as a coating or filler in recipes such as meatballs, stuffing, and casseroles.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3679.png
380	Peanut Oil	An oil made from pressing peanuts, commonly used in Asian and African cooking for its high smoke point and mild flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e373a.png
381	Starch	Starch or amylum is a polymeric carbohydrate consisting of a large number of glucose units joined by glycosidic bonds. This polysaccharide is produced by most green plants as energy storage. It is the most common carbohydrate in human diets and is contained in large amounts in staple foods like potatoes, wheat, maize (corn), rice, and cassava.\r\n\r\nPure starch is a white, tasteless and odorless powder that is insoluble in cold water or alcohol. It consists of two types of molecules: the linear and helical amylose and the branched amylopectin. Depending on the plant, starch generally contains 20 to 25% amylose and 75 to 80% amylopectin by weight.[4] Glycogen, the glucose store of animals, is a more highly branched version of amylopectin.\r\n\r\nIn industry, starch is converted into sugars, for example by malting, and fermented to produce ethanol in the manufacture of beer, whisky and biofuel. It is processed to produce many of the sugars used in processed foods. Mixing most starches in warm water produces a paste, such as wheatpaste, which can be used as a thickening, stiffening or gluing agent. The biggest industrial non-food use of starch is as an adhesive in the papermaking process. Starch can be applied to parts of some garments before ironing, to stiffen them.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e384d.png
382	Bay Leaves	The bay leaf is an aromatic leaf commonly used in cooking. It can be used whole, or as dried and ground.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e366b.png
383	Custard Powder	A powdered mixture used to make custard by adding milk and sugar and heating until thickened.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3830.png
384	Chicken Stock	A flavorful liquid made by simmering chicken bones, vegetables, and herbs in water. It is often used as a base for soups, stews, and sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3696.png
385	Creamed Corn	A dish made from corn kernels that have been cooked in milk and butter, and then pureed to create a creamy texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3834.png
386	Fresh Basil	An aromatic herb with green leaves that are used in many cuisines around the world, particularly in Italian cuisine. It has a sweet, slightly peppery flavor and a strong, pleasant aroma.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36dd.png
387	Flour Tortilla	A type of soft, thin, unleavened flatbread made from wheat flour commonly used in Mexican cuisine for making burritos, tacos, and quesadillas.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d8.png
388	Vine Tomatoes	Tomatoes that are grown on a vine and are typically smaller and more flavorful than regular tomatoes, and are commonly used in salads and as a topping for pizzas and bruschetta.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37fa.png
561	Sage	Herb with a pungent, earthy flavor and aroma, commonly used to flavor meats, stuffing, and sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e375b.png
389	Brown Sugar	A type of sugar that has a distinctive brown color and a rich, molasses-like flavor, often used in baking and cooking to add sweetness and depth of flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e367d.png
390	Red Chilli	A fresh, spicy pepper that is often used in cooking to add heat and flavor to dishes such as curries, stir-fries, and marinades.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e374c.png
391	Dark Chocolate	A type of chocolate that is made with higher cocoa solids and little to no milk. It has a rich and bitter taste.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37de.png
392	Mincemeat	Mincemeat is a mixture of chopped dried fruit, distilled spirits and spices, and sometimes beef suet, beef, or venison. Originally, mincemeat always contained meat. Many modern recipes contain beef suet, though vegetable shortening is sometimes used in its place.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e386e.png
393	Ground Beef	Beef that has been ground or minced into small pieces, commonly used in dishes such as hamburgers, meatballs, and tacos.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e383d.png
394	Pumpkin	A round, orange vegetable with a thick shell and seeds inside. It is often used in cooking and baking for its sweet and earthy flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37df.png
395	Frozen Peas	Peas that have been blanched and frozen to preserve their flavor and texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3832.png
396	Beef Brisket	Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times. Beef is a source of high-quality protein and nutrients.\r\n\r\nMost beef skeletal muscle meat can be used as is by merely cutting into certain parts, such as roasts, short ribs or steak (filet mignon, sirloin steak, rump steak, rib steak, rib eye steak, hanger steak, etc.), while other cuts are processed (corned beef or beef jerky). Trimmings, on the other hand, are usually mixed with meat from older, leaner (therefore tougher) cattle, are ground, minced or used in sausages. The blood is used in some varieties called blood sausage. Other parts that are eaten include other muscles and offal, such as the oxtail, liver, tongue, tripe from the reticulum or rumen, glands (particularly the pancreas and thymus, referred to as sweetbread), the heart, the brain (although forbidden where there is a danger of bovine spongiform encephalopathy, BSE, commonly referred to as mad cow disease), the kidneys, and the tender testicles of the bull (known in the United States as calf fries, prairie oysters, or Rocky Mountain oysters). Some intestines are cooked and eaten as is, but are more often cleaned and used as natural sausage casings. The bones are used for making beef stock.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e366c.png
397	Ginger Paste	A concentrated paste made from ginger often used as a flavoring in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36eb.png
398	Chicken Legs	A cut of chicken meat that comes from the leg of the bird. It is dark and flavorful, and can be cooked in a variety of ways, such as baking, frying, or grilling.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3695.png
399	Smoky Paprika	Smoky paprika is another name for smoked paprika, which is a type of paprika that has been smoked over wood to give it a smoky flavor. It is commonly used in Spanish and Mexican cuisine, and can be used to add flavor to meats, stews, and soups.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e376a.png
400	Jam	Fruit preserves are preparations of fruits, vegetables and sugar, often stored in glass jam jars and Mason jars.\r\n\r\nMany varieties of fruit preserves are made globally, including sweet fruit preserves, such as those made from strawberry or apricot, and savory preserves, such as those made from tomatoes or squash. The ingredients used and how they are prepared determine the type of preserves; jams, jellies, and marmalades are all examples of different styles of fruit preserves that vary based upon the fruit used. In English, the word, in plural form, "preserves" is used to describe all types of jams and jellies.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3890.png
401	Ground Pork	Ground meat, called mince or minced meat outside of North America (i.e. in U.K. and Commonwealth countries), and keema or qeema (Hindustani: क़ीमा (Devanagari), قیمہ (Nastaleeq), (pronounced [ˈqiːmaː])) in the Indian subcontinent, is meat finely chopped by a meat grinder or a chopping knife. A common type of ground meat is ground beef, but many other types of meats are prepared in a similar fashion, including pork, lamb, and poultry. In the Indian subcontinent, both mutton and goat meat are also minced to produce keema.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3873.png
402	Thai Red Curry Paste	A spicy blend of herbs and spices, including red chilies, lemongrass, and ginger, used as a base for Thai red curry.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e377b.png
403	Pretzels	A type of baked snack food made from dough that is shaped into a distinctive knot or twisted shape, then boiled in water and baked. Often served as a snack with dips or as a side dish with beer.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e379b.png
404	Marjoram	Marjoram is a herb that is commonly used as a seasoning for meat, fish, and vegetable dishes. It has a slightly sweet and floral flavor, and is often used in Mediterranean and Middle Eastern cuisines.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e371b.png
405	Clotted Cream	A thick, rich cream made by heating unpasteurized cow's milk until a layer of cream forms on the surface and is then skimmed off.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a3.png
406	Lentils	Lentils are a type of legume that are commonly used in soups, stews, salads, and other culinary applications. They have a mild, nutty flavor and are high in protein, fiber, and other nutrients.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ee.png
407	Peanut Brittle	Peanut brittle is a type of confection made with sugar, corn syrup, peanuts, and butter. It is cooked to a hard, brittle consistency and can be broken into pieces for snacking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e3.png
408	Rice Vermicelli	Thin, translucent noodles made from rice flour and water and commonly used in Southeast Asian cuisine, such as in bun or mi xao don.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3756.png
409	Black Beans	The black turtle bean is a small, shiny variety of the common bean (Phaseolus vulgaris) especially popular in Latin American cuisine, though it can also be found in the Cajun and Creole cuisines of south Louisiana. Like most common beans, it is native to the Americas, but has been introduced around the world. It is also used in East Indian cooking, Punjabi cuisine, and in Maharashtrian cuisine, it is known as Kala Ghevada. It is used interchangeably with vigna mungo (black gram) in countries such as the United States. The black turtle bean is often simply called the black bean (frijoles negros, zaragoza, judía negra, poroto negro, or caraota o habichuela negra in Spanish; and feijão preto in Portuguese), although this terminology can cause confusion with other black beans.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3864.png
410	Colby Jack Cheese	A semi-hard cheese made from cow's milk, with a mild flavor and creamy texture. It is a combination of Colby and Monterey Jack cheese.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ac.png
411	Cinnamon	A sweet and aromatic spice commonly used in baking, made from the inner bark of cinnamon trees.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a5.png
412	Ground Ginger	Ground ginger is a spice made from dried ginger root that has been ground into a powder. It is commonly used in baking and Asian cuisine to add a warm, spicy flavor to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f8.png
413	Peanut Cookies	Cookies that are made with peanuts or peanut butter. They have a nutty and sweet flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e1.png
414	Feta	A salty, crumbly cheese typically made from sheep's milk or a blend of sheep's and goat's milk. Often used in Mediterranean cuisine in salads, pastries, and as a topping for grilled meats.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d3.png
415	Shiitake Mushrooms	A type of edible mushroom that is commonly used in East Asian cuisine for its savory, meaty flavor, and is often dried and rehydrated before use.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f6.png
416	Duck Legs	The legs of a duck, which are prized for their flavorful and tender meat. Duck legs are often slow-cooked or confit, which involves cooking them in their own fat.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b1.png
417	Egg	A reproductive cell laid by female animals, often used in baking and cooking as a binding agent or to add texture and flavor	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3820.png
418	Lemon Zest	Lemon zest is the outermost layer of the lemon peel, which is rich in essential oils and has a strong, citrusy aroma and flavor. It is commonly used as a flavoring agent in cooking, baking, and cocktails.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3713.png
419	Basmati Rice	Basmati is a variety of long, slender-grained aromatic rice which is traditionally from the Indian subcontinent. As of 2018-19, India exported to over 90% of the overseas basmati rice market, while Pakistan accounted for the remainder, according to the Indian state-run Agricultural and Processed Food Products Export Development Authority  and the Pakistan government-run Economic Survey of Pakistan. Many countries use domestically grown basmati rice crops; however, basmati is geographically exclusive to select districts of India, Pakistan, Nepal and Bangladesh.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3669.png
420	Rosemary	An herb with a pine-like fragrance and strong, earthy flavor, commonly used in Mediterranean and Italian cuisine to add flavor to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37cb.png
421	Soya Milk	A plant-based milk made from soybeans that is a popular alternative to dairy milk. It is high in protein, vitamins, and minerals, and is commonly used as a milk substitute in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e376d.png
422	Fennel Seeds	Small, aromatic seeds from the fennel plant with a sweet, licorice-like flavor. Often used in Indian and Middle Eastern cuisine as a spice and digestive aid.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d1.png
423	Sardines	"Sardine" and "pilchard" are common names that refer to various small, oily forage fish in the herring family Clupeidae. The term "sardine" was first used in English during the early 15th century and may come from the Mediterranean island of Sardinia, around which sardines were once abundant.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3896.png
424	Boiling Water	Water is an inorganic, transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earth's hydrosphere and the fluids of most living organisms. It is vital for all known forms of life, even though it provides no calories or organic nutrients. Its chemical formula is H2O, meaning that each of its molecules contains one oxygen and two hydrogen atoms, connected by covalent bonds. Water is the name of the liquid state of H2O at standard ambient temperature and pressure. It forms precipitation in the form of rain and aerosols in the form of fog. Clouds are formed from suspended droplets of water and ice, its solid state. When finely divided, crystalline ice may precipitate in the form of snow. The gaseous state of water is steam or water vapor. Water moves continually through the water cycle of evaporation, transpiration (evapotranspiration), condensation, precipitation, and runoff, usually reaching the sea.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3888.png
425	Bicarbonate Of Soda	Sodium bicarbonate, commonly known as baking soda, is a chemical compound with the formula NaHCO3. It is a salt composed of a sodium cation (Na+) and a bicarbonate anion (HCO3−). Sodium bicarbonate is a white solid that is crystalline, but often appears as a fine powder. It has a slightly salty, alkaline taste resembling that of washing soda (sodium carbonate). The natural mineral form is nahcolite. It is a component of the mineral natron and is found dissolved in many mineral springs.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3670.png
426	Heavy Cream	Heavy cream, also known as whipping cream, is a type of dairy product that has a high fat content. It is commonly used in baking, cooking, and as a topping for desserts like fruit and ice cream.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36fc.png
427	Fettuccine	A type of pasta that is long and flat, wider than linguine but narrower than tagliatelle.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37a2.png
428	Lamb Kidney	An organ meat that is commonly used in traditional British dishes such as steak and kidney pie, and is known for its distinct flavor and texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3801.png
429	Bread Rolls	A roll is a small, usually round or oblong individual loaf of bread served as a meal accompaniment (eaten plain or with butter) A roll can be served and eaten whole or cut transversely and dressed with filling between the two halves. Rolls are also commonly used to make sandwiches similar to those produced using slices of bread. They are found in most cuisines all over the world. In the Deipnosophistae, the author Athenaeus (c. 170 – c. 230) describes some of the bread, cakes, and pastries available in the Classical world. Among the breads mentioned are griddle cakes, honey-and-oil bread, mushroom-shaped loaves covered in poppy seeds, and the military specialty of rolls baked on a spit.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3870.png
430	Cocoa	A powder made from roasted and ground cocoa beans, commonly used in baking to add chocolate flavor to desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a9.png
431	Rocket	Also known as arugula or rucola, it is a leafy green vegetable with a distinctive peppery flavor commonly used in salads and sandwiches.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3758.png
432	Khus Khus	Also known as poppy seeds, khus khus are tiny seeds that have a nutty flavor and a crunchy texture. They are commonly used as a topping for breads and pastries or in Indian cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3708.png
433	Herring	Herring are forage fish, mostly belonging to the family Clupeidae. Herring often move in large schools around fishing banks and near the coast, found particularly in shallow, temperate waters of the North Pacific and North Atlantic Oceans, including the Baltic Sea, as well as off the west coast of South America.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e388f.png
434	Courgettes	Courgettes, also known as zucchini, are a type of summer squash with a mild, slightly sweet flavor. They are commonly used in salads, soups, and other culinary applications.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e7.png
435	Egg Rolls		https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c7.png
436	Sugar Snap Peas	A type of pea that has edible pods. Sugar snap peas are sweet and crunchy and can be eaten raw or cooked.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b6.png
437	Dry White Wine	A type of white wine that is not sweet, with most of the grape sugar having been fermented into alcohol. It is often used in cooking to deglaze pans, add flavor to sauces, and to tenderize meats.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c5.png
438	Medjool Dates	A type of large, sweet, and chewy date fruit with a caramel-like flavor, commonly used as a natural sweetener in desserts or as a snack.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e371d.png
439	Beetroot	The beetroot is the taproot portion of a beet plant, usually known in Canada and the USA as beets while the vegetable is referred to as beetroot in British English, and also known as the table beet, garden beet, red beet, dinner beet or golden beet.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3895.png
440	Soy Sauce	A sauce made from soybeans, roasted grain, water, and salt. It is commonly used as a condiment and flavoring in Asian cuisine, and is often used to season stir-fries, marinades, and dipping sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e376c.png
441	Chopped Tomatoes	Tomatoes that have been chopped into small pieces, commonly used as a base for sauces, soups, and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a1.png
442	Leek	A type of allium vegetable that is related to onions and garlic. Leeks have a mild, sweet flavor and can be eaten raw or cooked in a variety of dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3710.png
443	Brown Rice	A type of rice that has been minimally processed to remove the outermost layer of the grain, resulting in a nutty flavor and a chewy texture that is often used in pilafs, salads, and other dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e367c.png
444	Miniature Marshmallows	Small, soft, and pillowy confectionery items that are typically made from sugar, water, and gelatin, and are often used as a topping for hot chocolate, desserts, and cakes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3721.png
445	Peaches	Peaches are a juicy fruit with fuzzy skin and a sweet flavor. They are commonly eaten fresh or used in desserts, jams, and other culinary applications.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e4.png
446	Potato Starch	A fine, white powder that is extracted from potatoes and is used as a thickening agent in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3745.png
447	Milk	A white liquid produced by mammals as food for their young, commonly used as a drink or ingredient in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e371f.png
448	Chilli Powder	A spice blend made from ground dried chili peppers and other spices, commonly used in Mexican, Indian, and Thai cuisine to add heat and flavor to dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e369c.png
449	Dark Chocolate Chips	Small, bite-sized pieces of dark chocolate often used in baking cookies, brownies, or muffins, or as a topping for ice cream or yogurt bowls.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37dc.png
481	Sweet Potatoes	The sweet potato or sweetpotato is a dicotyledonous plant that belongs to the bindweed or morning glory family, Convolvulaceae. Its large, starchy, sweet-tasting, tuberous roots are a root vegetable. The young leaves and shoots are sometimes eaten as greens.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e386f.png
489	Sea Salt	Sea salt is a type of salt that is obtained by evaporating seawater. It is coarser and less refined than table salt, and contains trace amounts of minerals that give it a distinct flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3761.png
450	Red Snapper	The northern red snapper (Lutjanus campechanus) is a species of snapper native to the western Atlantic Ocean including the Gulf of Mexico, where it inhabits environments associated with reefs. This species is commercially important and is also sought-after as a game fish.\r\n\r\nThe northern red snapper's body is very similar in shape to other snappers, such as the mangrove snapper, mutton snapper, lane snapper, and dog snapper. All feature a sloped profile, medium-to-large scales, a spiny dorsal fin, and a laterally compressed body. Northern red snapper have short, sharp, needle-like teeth, but they lack the prominent upper canine teeth found on the mutton, dog, and mangrove snappers. This snapper reaches maturity at a length of about 39 cm (15 in). The common adult length is 60 cm (24 in), but may reach 100 cm (39 in). The maximum published weight is 38 kg (84 lb), and the oldest reported age is 100+ years. Coloration of the northern red snapper is light red, with more intense pigment on the back. It has 10 dorsal spines, 14 soft dorsal rays, three anal spines and eight to 9 anal soft rays. Juvenile fish (shorter than 30–35 cm) can also have a dark spot on their sides, below the anterior soft dorsal rays, which fades with age.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3843.png
451	Rigatoni	Short, tube-shaped pasta that is wider than penne and often ridged or lined to hold sauce.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3757.png
452	Beef Stock	Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times. Beef is a source of high-quality protein and nutrients.\r\n\r\nMost beef skeletal muscle meat can be used as is by merely cutting into certain parts, such as roasts, short ribs or steak (filet mignon, sirloin steak, rump steak, rib steak, rib eye steak, hanger steak, etc.), while other cuts are processed (corned beef or beef jerky). Trimmings, on the other hand, are usually mixed with meat from older, leaner (therefore tougher) cattle, are ground, minced or used in sausages. The blood is used in some varieties called blood sausage. Other parts that are eaten include other muscles and offal, such as the oxtail, liver, tongue, tripe from the reticulum or rumen, glands (particularly the pancreas and thymus, referred to as sweetbread), the heart, the brain (although forbidden where there is a danger of bovine spongiform encephalopathy, BSE, commonly referred to as mad cow disease), the kidneys, and the tender testicles of the bull (known in the United States as calf fries, prairie oysters, or Rocky Mountain oysters). Some intestines are cooked and eaten as is, but are more often cleaned and used as natural sausage casings. The bones are used for making beef stock.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e366f.png
453	Plain Chocolate	Plain chocolate, also known as dark chocolate, is made from cocoa solids, sugar, and cocoa butter. It has a higher percentage of cocoa solids than milk chocolate, and has a bittersweet taste. It is often used in baking, or enjoyed on its own as a treat.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3742.png
454	Fries	Thin slices of potatoes that are deep-fried until crispy and golden brown. They are often served as a side dish with burgers, sandwiches, or other entrees.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e0.png
455	Icing Sugar	A finely ground sugar that is used to make frosting or icing for cakes, cookies, and other baked goods. Often mixed with butter or cream cheese to create a smooth, creamy consistency.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e379d.png
456	Dijon Mustard	A type of mustard made from ground mustard seeds, vinegar, and white wine, originating from the city of Dijon in France.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3836.png
457	Toffee Popcorn	A type of popcorn that is coated in a sweet, sticky toffee sauce, often mixed with nuts or other flavorings. A popular snack food for movie theaters and other entertainment venues.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e379e.png
458	Raspberry Jam	A sweet spread made from raspberries and sugar that is often used as a topping for bread, scones, and pastries.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3749.png
459	Green Pepper	Green peppers are a type of bell pepper with a slightly bitter flavor. They are commonly used in salads, stir-fries, and other culinary applications.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37e6.png
460	English Muffins	English muffins are a small, round, flat yeast-leavened bread which is commonly sliced horizontally, toasted, and buttered.[2] Toasted English muffins, which are often used in the United States as a breakfast food, may be served with sweet toppings (e.g., fruit jam, or honey) or savoury toppings (e.g., eggs, sausage rounds, bacon, or cheese). English muffins are also used as the bread in a variety of breakfast sandwiches, and are an essential ingredient in Eggs Benedict and most of its variations.\r\n\r\nIn the United States and U.S.-influenced territories, they are called English muffins to distinguish them from U.S. muffins, which are larger and sweeter miniature baked quick breads. They are very similar to bolo do caco in Portuguese cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3858.png
482	Anchovy Fillet	Anchovies are tiny, silvery fish that come from the Mediterranean and southern European coasts. They're sold salt-cured, usually oil-packed, and filleted. Commonly they come either flat or rolled in cans or jars, or ground and mixed with oil or butter to make a paste that is sold in tubes. On their own, anchovies are very salty but mixed into sauces, dressings, or pastas they add a wonderful depth of flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3865.png
483	White Flour	Refined flour made from wheat grains with bran and germ removed	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3817.png
484	Braeburn Apples	A type of apple with a crisp texture and a balanced sweet and tart flavor, often used in cooking and eating raw.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e380d.png
485	Vegan Butter	A non-dairy alternative to butter made from plant-based oils, such as coconut, palm, or soybean oil, that is commonly used in vegan and dairy-free cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3788.png
486	Pecan Nuts	Sweet, buttery nuts with a slightly softer texture than walnuts, often used in baking or as a topping for pies, salads, or ice cream.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37d8.png
487	Butternut Squash	Winter squash with a sweet, nutty flavor, commonly used in soups, stews, and roasted dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c0.png
461	Sichuan Pepper	Sichuan pepper, Sichuan peppercorn, or Szechuan pepper, is a commonly used spice in Chinese cuisine. It is derived from at least two species of the global genus Zanthoxylum, including Z. simulans and Z. bungeanum. The genus Zanthoxylum belongs in the rue or citrus family, and, despite its name, is not closely related to either black pepper nor the chili pepper.\r\n\r\nThe husk or hull (pericarp) around the seeds may be used whole, especially in Sichuan cuisine, and the finely ground powder is one of the ingredients for five-spice powder. It is also used in traditional Chinese medicine. The pericarp is most often used, but the leaves of various species are also used in some regions of China.\r\n\r\nAnother species of Zanthoxylum native to China, Z. schinifolium, called xiāng jiāo zi (香椒子, "aromatic peppercorn") or qīng huā jiāo (青花椒, "green flower pepper"), is used as a spice in Hebei.\r\n\r\nWhile the exact flavour and composition of different species from the genus Zanthoxylum vary, most share the same essential characteristics. So while the terms "Sichuan pepper" and sanshō may refer specifically to Z. simulans and Z. piperitum, respectively, the two are commonly used interchangeably.\r\n\r\nRelated species are used in the cuisines of Tibet, Bhutan, Nepal, Thailand, and India (the Konkani and Uttarakhandi people) and Toba Batak peoples. In Bhutan, this pepper is known as thingye and is used liberally in preparation of soups, gruels, and phaag sha paa (pork slices).[citation needed] In Nepal, timur is used in the popular foods momo, thukpa, chow mein, chicken chilli, and other meat dishes. It is also widely used in homemade pickles. People take timur as a medicine for stomach or digestion problems, in a preparation with cloves of garlic and mountain salt with warm water.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e384b.png
462	Muscovado Sugar	A type of unrefined brown sugar that has a strong, molasses-like flavor and a moist texture, and is often used in baking and cooking for its rich taste and color.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3725.png
463	Sun-Dried Tomatoes	Tomatoes that have been sliced and then left to dry in the sun or a dehydrator until most of their moisture has evaporated, resulting in a concentrated and intensely flavored product.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3835.png
464	Red Onions	A type of onion that has a deep purple skin and a mild, sweet flavor. They are often used in salads, sandwiches, and as a topping for pizza.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e374e.png
465	Chilli	A spicy pepper used to add heat and flavor to dishes, commonly used in Mexican, Indian, and Thai cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e369b.png
466	Full Fat Yogurt	A thick, creamy yogurt made from whole milk that has not been skimmed or reduced in fat content. It is higher in calories and fat than low-fat or non-fat yogurt, but has a richer, creamier texture and a more indulgent flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e1.png
467	Currants	Small, dark red or black berries with a tart flavor, commonly used in baking, jams and sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3807.png
468	Sushi Rice	As the dietary staple of Japan, knowing how to cook Japanese rice is an important first step to becoming a Japanese cooking master. Perfectly prepared Japanese rice should be light, fluffy, and slightly sticky when cooked	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3892.png
469	Vine Leaves	The leaves of the grapevine, often used in Mediterranean cuisine as a wrapping for various fillings.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e378d.png
470	Green Red Lentils	A type of lentil with a mild, nutty flavor and a greenish-brown color often used in soups, stews, and curries.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f4.png
471	Digestive Biscuits	A type of biscuit that originated in the United Kingdom. They are made with wholemeal flour and are lightly sweetened, making them a popular choice for use in pie crusts and as a base for cheesecakes and other desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c0.png
472	Plum Tomatoes	A type of tomato that is oval or cylindrical in shape and has a sweet flavor. They are often used in Italian cuisine, particularly for making sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3744.png
473	Egg Yolks		https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36c9.png
474	Jerk	A style of cooking that originated in Jamaica, and involves marinating meat in a mixture of spices and then grilling or smoking it over a fire.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e383c.png
475	Cashew Nuts	A type of nut that is often used in cooking and snacking, with a mild, buttery flavor and a creamy texture when roasted or ground into a paste.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3685.png
476	White Fish Fillets	The boneless and skinless cuts of white fish used in cooking for their mild flavor and versatility.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3792.png
477	Almond Milk	A plant-based milk alternative made from ground almonds and water, often used as a dairy-free substitute for milk in cooking and baking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e385f.png
478	Demerara Sugar	A type of raw cane sugar that is minimally processed and has large, golden crystals. It has a subtle molasses flavor and is often used as a sweetener in coffee and tea, as well as in baking and cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36be.png
479	Kosher Salt	A type of coarse salt that is used in koshering meat and has a larger grain size than regular table salt. Kosher salt is often preferred by chefs because it is easier to control the amount used and has a milder flavor than other salts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e370a.png
480	Allspice	A spice made from the dried berries of the Pimenta dioica plant, with a flavor profile that is a combination of cinnamon, nutmeg, and cloves, commonly used in Caribbean and Latin American cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3860.png
488	Salsa	Tomato-based sauce or dip with various ingredients such as onion, chili peppers, and herbs, commonly used in Mexican cuisine as a condiment or for dipping tortilla chips.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e375d.png
490	Lamb	A type of red meat that comes from young sheep. Lamb has a rich flavor and can be cooked in a variety of ways, including grilling, roasting, and stewing.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e370b.png
491	Tomato Puree	A thick, concentrated paste made from cooked and strained tomatoes, used as a base for sauces, soups, and stews.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e377e.png
492	Cooking wine	Splash into casseroles, sauces and marinades for a rounded vibrant flavour.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e384f.png
493	Naan Bread	Naan bread is a type of Indian flatbread that is made from flour, water, and yeast. It is traditionally baked in a tandoor oven and can be served plain or stuffed with a variety of fillings.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ed.png
494	Chicken Stock Cube	A small cube made from dried and compressed chicken stock, used to add flavor to soups, stews, and sauces. Chicken stock cubes are convenient and easy to use.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37b2.png
495	Mustard Powder	A ground spice that is made from mustard seeds, and is often used in cooking and seasoning for its pungent and tangy flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3728.png
496	Spinach	A leafy green vegetable that is rich in vitamins, minerals, and antioxidants. It is commonly used in salads, sandwiches, and cooked dishes like spinach lasagna or sautéed spinach with garlic.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e376f.png
497	Mascarpone	A creamy, mild Italian cheese that is similar in texture to cream cheese but with a sweeter, more delicate flavor, often used in desserts like tiramisu and cheesecake.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37cf.png
498	Dark Rum	Rum is a distilled alcoholic drink made from sugarcane byproducts, such as molasses, or directly from sugarcane juice, by a process of fermentation and distillation. The distillate, a clear liquid, is then usually aged in oak barrels.\r\n\r\nThe majority of the world's rum production occurs in the Caribbean and Latin America. Rum is also produced in Australia, Portugal, Austria, Canada, Fiji, India, Japan, Mauritius, Nepal, New Zealand, the Philippines, Reunion Island, South Africa, Spain, Sweden, Taiwan, Thailand, the United Kingdom and the United States.\r\n\r\nRums are produced in various grades. Light rums are commonly used in cocktails, whereas "golden" and "dark" rums were typically consumed straight or neat, on the rocks, or used for cooking, but are now commonly consumed with mixers. Premium rums are also available, made to be consumed either straight or iced.\r\n\r\nRum plays a part in the culture of most islands of the West Indies as well as in The Maritimes and Newfoundland. This drink has famous associations with the Royal Navy (where it was mixed with water or beer to make grog) and piracy (where it was consumed as bumbo). Rum has also served as a popular medium of economic exchange, used to help fund enterprises such as slavery (see Triangular trade), organized crime, and military insurgencies (e.g., the American Revolution and Australia's Rum Rebellion).	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3855.png
499	Coriander Leaves	Also known as cilantro, these are the leaves of the coriander plant. They are commonly used as a garnish or ingredient in many cuisines.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b0.png
500	Sultanas	A type of dried grape that is commonly used in baking and cooking. They are sweet and tangy, and are often used in cakes, cookies, and savory dishes like couscous or tagines.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3775.png
501	Vinegar	A sour liquid made from fermented alcohol, used as a condiment and preservative.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e378e.png
502	Canned Tomatoes	Tomatoes that have been preserved in a can or jar, typically with added salt and sometimes other seasonings, and used in a variety of recipes such as soups, stews, sauces, and chili.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3681.png
503	Chicken Stock Concentrate	Stock, sometimes called bone broth, is a savory cooking liquid that forms the basis of many dishes, particularly soups, stews and sauces. Making stock involves simmering animal bones or meat, seafood, or vegetables in water or wine, often for an extended period of time. Mirepoix or other aromatics may be added for more flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3878.png
504	Fish Stock	A flavorful broth made by simmering fish bones, vegetables, and aromatics in water, often used as a base for soups, stews, and sauces.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ab.png
505	Udon Noodles	A type of thick, wheat-based noodle that is commonly used in Japanese cuisine, particularly in soups and stir-fry dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f4.png
506	Cornstarch	A fine, powdery starch made from corn kernels that is commonly used as a thickening agent in sauces, soups, and gravies.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b3.png
507	Pickle Juice	Pickling is the process of preserving or extending the shelf life of food by either anaerobic fermentation in brine or immersion in vinegar. In East Asia, vinaigrette is also used as a pickling medium. The pickling procedure typically affects the food's texture, taste and flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3889.png
508	Tortillas	Thin, flatbreads made from corn or wheat flour that are commonly used in Mexican cuisine for dishes like tacos, burritos, and quesadillas.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f3.png
509	Scallions	Scallions (green onion, spring onion and salad onion) are vegetables of various Allium onion species. Scallions have a milder taste than most onions. Their close relatives include the garlic, shallot, leek, chive, and Chinese onion.\r\n\r\nAlthough the bulbs of many Allium species are used as food, the defining characteristic of scallion species is that they lack a fully developed bulb. In common with all Allium species, scallions have hollow, tubular green leaves, growing directly from the bulb. These leaves are used as a vegetable; they are eaten either raw or cooked. The leaves are often chopped into other dishes, in the manner of onions or garlic. Also known as scallions or green onions, spring onions are in fact very young onions, harvested before the bulb has had a chance to swell.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e384a.png
510	Balsamic Vinegar	Balsamic vinegar (Italian: aceto balsamico), occasionally shortened to balsamic, is a very dark, concentrated, and intensely flavoured vinegar originating in Italy, made wholly or partially from grape must. Grape must is freshly crushed grape juice with all the skins, seeds and stems.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3666.png
511	Sugar	A sweet, crystalline substance that is commonly used as a sweetener and preservative in food and drinks. It is made from sugar cane or sugar beets and comes in many different forms, including granulated sugar, brown sugar, and powdered sugar.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3774.png
512	Bay Leaf	The bay leaf is an aromatic leaf commonly used in cooking. It can be used whole, or as dried and ground.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e366a.png
513	Enchilada Sauce	A spicy tomato-based sauce commonly used in Mexican cuisine for making enchiladas.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36cb.png
514	Ginger Garlic Paste	A mixture of minced garlic and ginger commonly used as a flavoring in Indian and Southeast Asian cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ea.png
515	Gouda Cheese	A semi-hard cheese originating from the Netherlands with a nutty, buttery flavor and smooth texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ed.png
516	Black Olives	Ripe olives that have turned black, with a meaty texture and a rich, salty flavor, often used in Mediterranean cuisine or as a topping for pizza or salads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37ad.png
517	Muffins	A muffin is an individual-sized, baked product. It can refer to two distinct items, a part-raised flatbread and a cupcake-like quickbread. The flatbread is of British or European derivation, and dates from at least the early 18th century, while the quickbread originated in North America during the 19th century. Both are common worldwide today.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3859.png
518	Beef Stock Concentrate	Stock, sometimes called bone broth, is a savory cooking liquid that forms the basis of many dishes, particularly soups, stews and sauces. Making stock involves simmering animal bones or meat, seafood, or vegetables in water or wine, often for an extended period of time. Mirepoix or other aromatics may be added for more flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3877.png
519	Honey	Honey is a natural sweetener that is made by bees from the nectar of flowers. It is commonly used in cooking and baking to add sweetness and flavor to dishes, as well as a natural remedy for coughs and sore throats.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36fd.png
520	Brown Lentils	A type of lentil that has a mild, earthy flavor and a soft texture when cooked, often used in soups, stews, and curries.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e367b.png
521	Caster Sugar	A type of fine sugar that is commonly used in baking and cooking, with a fine texture that dissolves easily, and is often used in recipes that require quick mixing or dissolving, such as meringues, whipped cream, and cakes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3687.png
522	Borlotti Beans	A type of bean, also known as cranberry beans, with a creamy texture and a nutty flavor that is often used in Italian cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3674.png
523	Penne Rigate	A type of pasta with a tube-like shape and ridges on the outside, commonly used in Italian cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e373e.png
524	Prawns	A type of seafood that has a sweet and delicate flavor. They are often used in dishes such as curries, stir-fries, and salads.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3747.png
525	Pink Food Colouring	A type of food coloring used to add a pale pink color to foods and drinks.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e380f.png
526	Veal	Meat from young calves, typically under 3 months of age, that is tender and mild in flavor. It is commonly used in dishes such as schnitzel, veal marsala, and veal piccata.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3787.png
527	Broad Beans	Vicia faba, also known as the broad bean, fava bean, faba bean, field bean, bell bean, or tic bean, is a species of flowering plant in the pea and bean family Fabaceae. It is native to North Africa[dubious – discuss] southwest and south Asia, and extensively cultivated elsewhere.[citation needed] A variety Vicia faba var. equina Pers. – horse bean has been previously recognized.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3842.png
528	Peas	A type of legume with small, round, edible seeds, commonly used in soups, stews, and casseroles.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e373c.png
529	Hotsauce	Hot sauce is a condiment made from chili peppers, vinegar, and other spices. It is often used to add heat and flavor to dishes like eggs, tacos, and pizza.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3700.png
530	Green Chilli	A type of chili pepper with a mild to medium heat and a green color commonly used in Mexican and South Asian cuisine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36f2.png
531	Flour	A fine powder made from grinding grains, nuts, seeds, or roots. Used as a main ingredient in baking, cooking, and thickening sauces and soups.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36d7.png
532	Cilantro	Also known as coriander, it is a herb commonly used in Mexican, Indian, and Thai cuisine, with a fresh, citrusy flavor and aroma.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a4.png
533	Vanilla	A flavor derived from the seed pods of the vanilla orchid, commonly used as a sweetener and flavoring agent in baked goods, ice cream, and other desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3785.png
534	Yellow Onion	The brown onion or yellow onion is a variety of dry onion with a strong flavour. They have a greenish-white, light yellow, or white inside; its layers of papery skin have a yellow-brown or pale golden colour	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3876.png
535	Stir-fry Vegetables	A mix of vegetables that are commonly used in Asian cuisine, including broccoli, carrots, snow peas, bell peppers, and mushrooms. They are typically stir-fried in a wok or pan with oil and seasoning, and can be served as a side dish or main course.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3772.png
536	Cherry Tomatoes	Small, bite-sized tomatoes that are typically sweeter and more flavorful than larger varieties. They are often used in salads or as a snack.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3691.png
537	Garam Masala	A blend of ground spices commonly used in Indian cuisine, typically including cinnamon, cardamom, cloves, cumin, coriander, and black pepper. It has a warm, complex flavor and is often used to season meat, vegetables, and rice dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e2.png
538	Sesame Seed Oil	An oil made from toasted sesame seeds that is commonly used in East Asian cuisine for its nutty flavor and aroma, and is often used as a finishing oil or for stir-frying.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37f8.png
539	Bacon	Bacon is a type of salt-cured pork. Bacon is prepared from several different cuts of meat, typically from the pork belly or from back cuts, which have less fat than the belly. It is eaten on its own, as a side dish (particularly in breakfasts), or used as a minor ingredient to flavour dishes (e.g., the club sandwich). Bacon is also used for barding and larding roasts, especially game, including venison and pheasant. The word is derived from the Old High German bacho, meaning "buttock", "ham" or "side of bacon", and is cognate with the Old French bacon.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3664.png
540	Ras el hanout	Ras el hanout or rass el hanout (Arabic: راس  raʾs al-ḥānūt, pronounced [rɑʔs ælħɑːnuːt] (About this soundlisten)) is a spice mix found in varying forms in Tunisia, Algeria, and Morocco.[1] It plays a similar role in North African cuisine as garam masala does in Indian cuisine. The name in Arabic means "head of the shop" and implies a mixture of the best spices the seller has to offer. Ras el hanout is used in many savory dishes, sometimes rubbed on meat or fish, or stirred into couscous or rice.\r\n\r\nThere is no definitive composition of spices that makes up ras el hanout. Each shop, company, or family may have their own blend. The mixture usually consists of over a dozen spices, in different proportions. Commonly used ingredients include cardamom, cumin, clove, cinnamon, nutmeg, mace, allspice, dry ginger, chili peppers, coriander seed, peppercorn, sweet and hot paprika, fenugreek, and dry turmeric. Some spices may be particular to the region, such as ash berries, chufa, grains of paradise, orris root, monk's pepper, cubebs, dried rosebud, fennel seed or aniseed, galangal, long pepper. Ingredients may be toasted before being ground or pounded in a mortar and mixed together. Some preparations include salt or sugar, but that is generally not the accepted practice. Garlic, saffron, nuts or dry herbs are generally not included, as they are usually added to dishes individually, but some commercial preparations, particularly in Europe and North America, may contain them.\r\n\r\nThe composition of ras el hanout differs somewhat from the Baharat spice mix, but they differ more by the types of dishes they are associated with and by region rather than the ingredients in them. Although used by Berber people, it should not be confused with "berbere" spice mix from Ethiopia.\r\n\r\nCertain supposed aphrodisiacs, including the notoriously dangerous "green metallic beetles", cantharides, have appeared in many Moroccan prescriptions, but these seem to be irrelevant for flavouring purposes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3866.png
541	Chopped Onion	Pieces of onion that have been diced or chopped, commonly used as a flavor base for soups, stews, and other dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e369f.png
542	Sausages	Sausages are a type of seasoned meat that are typically encased in a casing made of animal intestine or synthetic materials. They can be made from various types of meat such as pork, beef, or chicken, and can be flavored with herbs and spices.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3760.png
543	Yeast	A type of fungus used as a leavening agent in baking to make dough rise	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3818.png
544	Sesame Seed	Sesame seeds are small, flat seeds that come from the sesame plant. They are commonly used in cooking and baking, and are known for their nutty flavor and crunchy texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3764.png
545	Meringue Nests	Small, delicate, and crispy shells made of egg whites and sugar, commonly used as a base for fruit or cream toppings in desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e371e.png
546	Corn Tortillas	A type of flatbread made from cornmeal that is commonly used in Mexican cuisine. They are gluten-free and can be used to make tacos, enchiladas, and other dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36b2.png
547	Sour Cream	A dairy product that is made by fermenting regular cream with certain kinds of lactic acid bacteria. It has a tangy, creamy flavor and is commonly used as a topping for dishes like baked potatoes, tacos, and chili.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e376b.png
548	Tamarind Ball	A sweet and sour fruit that comes in a compressed ball shape, commonly used in South Asian and Southeast Asian cuisines for its tangy flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3777.png
549	Cherry	A small, red fruit with a stone in the center, commonly used in baking and cooking	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e381b.png
550	Garlic Powder	A finely ground powder made from dehydrated garlic cloves often used as a seasoning in cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36e5.png
551	Desiccated Coconut	Dried, shredded coconut used in baking and as a topping for desserts and curries.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3831.png
552	Freshly Chopped Parsley	A bright green herb with curly or flat leaves that is often used as a garnish, but can also be used to add flavor and nutrition to dishes. It has a mild, slightly bitter taste that complements a wide range of flavors.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36df.png
553	Truffle Oil	Truffle oil is a flavored oil made by infusing oil with truffle essence. It is commonly used to add a rich, earthy flavor to dishes such as pasta, risotto, and mashed potatoes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37eb.png
554	Red Food Colouring	A type of food coloring used to add a bright red color to foods and drinks.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e380e.png
555	Chorizo	A spicy sausage that is commonly used in Spanish, Mexican, and Portuguese cuisine, made with pork, garlic, and smoked paprika.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36a2.png
556	Vanilla Extract	A concentrated liquid extract made from vanilla beans and alcohol, commonly used to add vanilla flavor to baked goods and desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3786.png
557	Condensed Milk	A thick, sweet milk product that is made by removing most of the water from regular milk. It is commonly used in baking and desserts.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ae.png
558	Rice wine	Rice wine is an alcoholic beverage fermented and distilled from rice, traditionally consumed in East Asia, Southeast Asia and South Asia. Rice wine is made from the fermentation of rice starch that has been converted to sugars. Microbes are the source of the enzymes that convert the starches to sugar.[1]\r\n\r\nRice wine typically has an alcohol content of 18–25% ABV. Rice wines are used in Asian gastronomy at formal dinners and banquets and in cooking. They are also used in a religious and ceremonial context.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e384e.png
562	Oyster Sauce	A thick, brown sauce made from oysters, soy sauce, sugar, and spices, commonly used in Chinese and Southeast Asian cooking.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3732.png
563	Cheese Slices	Processed cheese is a food product made from cheese and other unfermented dairy ingredients mixed with emulsifiers. Additional ingredients, such as vegetable oils, salt, food coloring, or sugar may be included. As a result, many flavors, colors, and textures of processed cheese exist.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3885.png
564	Curry Powder	A blend of spices commonly used in Indian cuisine. It typically includes turmeric, cumin, coriander, ginger, and other spices, and can vary in spiciness and flavor depending on the blend.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e36ba.png
565	Parmesan	A hard, granular cheese made from cow's milk, commonly used in Italian cooking for its sharp, nutty flavor.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3735.png
566	Sweetcorn	A type of corn with a higher sugar content, typically eaten as a vegetable and used in a variety of dishes such as salads, soups, and casseroles.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37c5.png
567	Light Brown Soft Sugar	A soft, moist sugar with a subtle molasses flavor, often used in baking recipes for cakes, cookies, and muffins.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e37da.png
568	Chestnut Mushroom	A variety of mushroom that has a nutty, earthy flavor and a slightly chewy texture. It is often used in stews, soups, and risottos.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3692.png
569	Red Pepper	A sweet and crunchy vegetable that is often used in cooking and is a good source of vitamins A and C. It is also known as a bell pepper or capsicum.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e374f.png
570	Jerusalem Artichokes	Also known as sunchokes, Jerusalem artichokes are a type of root vegetable that have a slightly sweet, nutty flavor and a crisp texture when raw.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3706.png
571	Beef Kidney	An organ meat that is commonly used in traditional dishes, particularly in stews and pies, and is known for its rich flavor and texture.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3802.png
572	Tabasco Sauce	A spicy hot sauce made from tabasco peppers, vinegar, and salt, commonly used as a condiment or ingredient in various dishes.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3837.png
573	Shortening	Shortening is any fat that is a solid at room temperature and used to make crumbly pastry and other food products. Although butter is solid at room temperature and is frequently used in making pastry, the term "shortening" seldom refers to butter, but is more closely related to margarine.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3886.png
574	Chickpeas	Small, round legumes with a nutty flavor and creamy texture. They are often used in Mediterranean and Middle Eastern dishes, such as hummus and falafel.	https://ftp.goit.study/img/so-yummy/ingredients/640c2dd963a319ea671e3698.png
\.


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.recipes (id, title, category_id, area_id, user_id, instructions, description, "time", thumb, "createdAt", "updatedAt") FROM stdin;
1	Battenberg Cake	6	7	3	Heat oven to 180C/160C fan/gas 4 and line the base and sides of a 20cm square tin with baking parchment (the easiest way is to cross 2 x 20cm-long strips over the base). To make the almond sponge, put the butter, sugar, flour, ground almonds, baking powder, eggs, vanilla and almond extract in a large bowl. Beat with an electric whisk until the mix comes together smoothly. Scrape into the tin, spreading to the corners, and bake for 25-30 mins – when you poke in a skewer, it should come out clean. Cool in the tin for 10 mins, then transfer to a wire rack to finish cooling while you make the second sponge.\r\nFor the pink sponge, line the tin as above. Mix all the ingredients together as above, but don’t add the almond extract. Fold in some pink food colouring. Then scrape it all into the tin and bake as before. Cool.\r\nTo assemble, heat the jam in a small pan until runny, then sieve. Barely trim two opposite edges from the almond sponge, then well trim a third edge. Roughly measure the height of the sponge, then cutting from the well-trimmed edge, use a ruler to help you cut 4 slices each the same width as the sponge height. Discard or nibble leftover sponge. Repeat with pink cake.\r\nTake 2 x almond slices and 2 x pink slices and trim so they are all the same length. Roll out one marzipan block on a surface lightly dusted with icing sugar to just over 20cm wide, then keep rolling lengthways until the marzipan is roughly 0.5cm thick. Brush with apricot jam, then lay a pink and an almond slice side by side at one end of the marzipan, brushing jam in between to stick sponges, and leaving 4cm clear marzipan at the end. Brush more jam on top of the sponges, then sandwich remaining 2 slices on top, alternating colours to give a checkerboard effect. Trim the marzipan to the length of the cakes.\r\nCarefully lift up the marzipan and smooth over the cake with your hands, but leave a small marzipan fold along the bottom edge before you stick it to the first side. Trim opposite side to match size of fold, then crimp edges using fingers and thumb (or, more simply, press with prongs of fork). If you like, mark the 10 slices using the prongs of a fork.\r\nAssemble second Battenberg and keep in an airtight box or well wrapped in cling film for up to 3 days. Can be frozen for up to a month.	A classic British cake made with almond sponge cake and covered with marzipan. It is traditionally pink and yellow checkered in appearance.	60	https://ftp.goit.study/img/so-yummy/preview/Battenberg%20Cake.jpg	2025-07-09 17:36:37.679+00	2025-07-09 17:36:37.679+00
2	Irish stew	5	6	3	Heat the oven to 180C/350F/gas mark 4. Drain and rinse the soaked wheat, put it in a medium pan with lots of water, bring to a boil and simmer for an hour, until cooked. Drain and set aside.\r\n\r\nSeason the lamb with a teaspoon of salt and some black pepper. Put one tablespoon of oil in a large, deep sauté pan for which you have a lid; place on a medium-high heat. Add some of the lamb – don't overcrowd the pan – and sear for four minutes on all sides. Transfer to a bowl, and repeat with the remaining lamb, adding oil as needed.\r\n\r\nLower the heat to medium and add a tablespoon of oil to the pan. Add the shallots and fry for four minutes, until caramelised. Tip these into the lamb bowl, and repeat with the remaining vegetables until they are all nice and brown, adding more oil as you need it.\r\n\r\nOnce all the vegetables are seared and removed from the pan, add the wine along with the sugar, herbs, a teaspoon of salt and a good grind of black pepper. Boil on a high heat for about three minutes.\r\n\r\nTip the lamb, vegetables and whole wheat back into the pot, and add the stock. Cover and boil for five minutes, then transfer to the oven for an hour and a half.\r\n\r\nRemove the stew from the oven and check the liquid; if there is a lot, remove the lid and boil for a few minutes.	A traditional Irish dish made with lamb, potatoes, carrots, onions, and herbs, cooked in a broth or gravy.	160	https://ftp.goit.study/img/so-yummy/preview/Irish%20stew.jpg	2025-07-09 17:36:37.712+00	2025-07-09 17:36:37.712+00
3	Lancashire hotpot	2	7	3	Heat oven to 160C/fan 140C/gas 3. Heat some dripping or butter in a large shallow casserole dish, brown the lamb in batches, lift to a plate, then repeat with the kidneys.\r\nFry the onions and carrots in the pan with a little more dripping until golden. Sprinkle over the flour, allow to cook for a couple of mins, shake over the Worcestershire sauce, pour in the stock, then bring to the boil. Stir in the meat and bay leaves, then turn off the heat. Arrange the sliced potatoes on top of the meat, then drizzle with a little more dripping. Cover, then place in the oven for about 1½ hrs until the potatoes are cooked.\r\nRemove the lid, brush the potatoes with a little more dripping, then turn the oven up to brown the potatoes, or finish under the grill for 5-8 mins until brown.	A hearty casserole with tender lamb and vegetables, topped with sliced potatoes.	115	https://ftp.goit.study/img/so-yummy/preview/Lancashire%20hotpot.jpg	2025-07-09 17:36:37.737+00	2025-07-09 17:36:37.737+00
4	Teriyaki Chicken Casserole	4	8	3	Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.\r\nCombine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.\r\nMeanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.\r\nPlace the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.\r\n*Meanwhile, steam or cook the vegetables according to package directions.\r\nAdd the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!	A Japanese-inspired casserole made with chicken, teriyaki sauce, rice, and vegetables.	75	https://ftp.goit.study/img/so-yummy/preview/Teriyaki%20Chicken%20Casserole.jpg	2025-07-09 17:36:37.755+00	2025-07-09 17:36:37.755+00
5	Honey Teriyaki Salmon	1	8	3	Mix all the ingredients in the Honey Teriyaki Glaze together. Whisk to blend well. Combine the salmon and the Glaze together.\r\n\r\nHeat up a skillet on medium-low heat. Add the oil, Pan-fry the salmon on both sides until it’s completely cooked inside and the glaze thickens.\r\n\r\nGarnish with sesame and serve immediately.	A Japanese-inspired dish made with salmon fillets, teriyaki sauce, honey, and sesame seeds.	25	https://ftp.goit.study/img/so-yummy/preview/Honey%20Teriyaki%20Salmon.jpg	2025-07-09 17:36:37.77+00	2025-07-09 17:36:37.77+00
6	Poutine	10	16	3	Heat oil in a deep fryer or deep heavy skillet to 365°F (185°C).\r\nWarm gravy in saucepan or microwave.\r\nPlace the fries into the hot oil, and cook until light brown, about 5 minutes.\r\nRemove to a paper towel lined plate to drain.\r\nPlace the fries on a serving platter, and sprinkle the cheese over them.\r\nLadle gravy over the fries and cheese, and serve immediately.	A Canadian dish made with french fries, cheese curds, and gravy.	20	https://ftp.goit.study/img/so-yummy/preview/Poutine.jpg	2025-07-09 17:36:37.779+00	2025-07-09 17:36:37.779+00
13	Chicken Parmentier	4	9	3	For the topping, boil the potatoes in salted water until tender. Drain and push through a potato ricer, or mash thoroughly. Stir in the butter, cream and egg yolks. Season and set aside.\r\nFor the filling, melt the butter in a large pan. Add the shallots, carrots and celery and gently fry until soft, then add the garlic. Pour in the wine and cook for 1 minute. Stir in the tomato purée, chopped tomatoes and stock and cook for 10–15 minutes, until thickened. Add the shredded chicken, olives and parsley. Season to taste with salt and pepper.\r\nPreheat the oven to 180C/160C Fan/Gas 4.\r\nPut the filling in a 20x30cm/8x12in ovenproof dish and top with the mashed potato. Grate over the Gruyère. Bake for 30–35 minutes, until piping hot and the potato is golden-brown.	A French-inspired chicken dish with layers of mashed potatoes and cheese.	75	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Parmentier.jpg	2025-07-09 17:36:37.883+00	2025-07-09 17:36:37.883+00
7	Bakewell tart	6	7	3	To make the pastry, measure the flour into a bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs. Add the water, mixing to form a soft dough.\r\nRoll out the dough on a lightly floured work surface and use to line a 20cm/8in flan tin. Leave in the fridge to chill for 30 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 (180C fan).\r\nLine the pastry case with foil and fill with baking beans. Bake blind for about 15 minutes, then remove the beans and foil and cook for a further five minutes to dry out the base.\r\nFor the filing, spread the base of the flan generously with raspberry jam.\r\nMelt the butter in a pan, take off the heat and then stir in the sugar. Add ground almonds, egg and almond extract. Pour into the flan tin and sprinkle over the flaked almonds.\r\nBake for about 35 minutes. If the almonds seem to be browning too quickly, cover the tart loosely with foil to prevent them burning.	A British dessert consisting of a shortcrust pastry shell filled with raspberry jam, frangipane, and topped with almonds.	85	https://ftp.goit.study/img/so-yummy/preview/Bakewell%20tart.jpg	2025-07-09 17:36:37.79+00	2025-07-09 17:36:37.79+00
8	Callaloo Jamaican Style	10	24	3	Cut leaves and soft stems from the kale branches, them soak in a bowl of cold water for about 5-10 minutes or until finish with prep.\r\nProceed to slicing the onions, mincing the garlic and dicing the tomatoes. Set aside\r\nRemove kale from water cut in chunks.\r\nPlace bacon on saucepan and cook until crispy. Then add onions, garlic, thyme, stir for about a minute or more\r\nAdd tomatoes; scotch bonnet pepper, smoked paprika. Sauté for about 2-3 more minutes.\r\nFinally add vegetable, salt, mix well, and steamed for about 6-8 minutes or until leaves are tender. Add a tiny bit of water as needed. Adjust seasonings and turn off the heat.\r\nUsing a sharp knife cut both ends off the plantain. This will make it easy to grab the skin of the plantains. Slit a shallow line down the long seam of the plantain; peel only as deep as the peel. Remove plantain peel by pulling it back.\r\nSlice the plantain into medium size lengthwise slices and set aside.\r\nCoat a large frying pan with cooking oil spray. Spray the tops of the plantains with a generous layer of oil spray and sprinkle with salt, freshly ground pepper.\r\nLet the plantains "fry" on medium heat, shaking the frying pan to redistribute them every few minutes.\r\nAs the plantains brown, continue to add more cooking oil spray, salt and pepper (if needed) until they have reached the desired color and texture.\r\nRemove and serve with kale	A traditional Jamaican dish made with callaloo leaves and a variety of spices. Served with rice and peas.	30	https://ftp.goit.study/img/so-yummy/preview/Callaloo%20Jamaican%20Style.jpg	2025-07-09 17:36:37.804+00	2025-07-09 17:36:37.804+00
9	Beef Brisket Pot Roast	5	11	3	1 Prepare the brisket for cooking: On one side of the brisket there should be a layer of fat, which you want. If there are any large chunks of fat, cut them off and discard them. Large pieces of fat will not be able to render out completely.\r\nUsing a sharp knife, score the fat in parallel lines, about 3/4-inch apart. Slice through the fat, not the beef. Repeat in the opposite direction to make a cross-hatch pattern.\r\nSalt the brisket well and let it sit at room temperature for 30 minutes.\r\n \r\n2 Sear the brisket: You'll need an oven-proof, thick-bottomed pot with a cover, or Dutch oven, that is just wide enough to hold the brisket roast with a little room for the onions.\r\nPat the brisket dry and place it, fatty side down, into the pot and place it on medium high heat. Cook for 5-8 minutes, lightly sizzling, until the fat side is nicely browned. (If the roast seems to be cooking too fast, turn the heat down to medium. You want a steady sizzle, not a raging sear.)\r\nTurn the brisket over and cook for a few minutes more to brown the other side.\r\n\r\n3 Sauté the onions and garlic: When the brisket has browned, remove it from the pot and set aside. There should be a couple tablespoons of fat rendered in the pot, if not, add some olive oil.\r\nAdd the chopped onions and increase the heat to high. Sprinkle a little salt on the onions. Sauté, stirring often, until the onions are lightly browned, 5-8 minutes. Stir in the garlic and cook 1-2 more minutes.\r\n \r\n4 Return brisket to pot, add herbs, stock, bring to simmer, cover, cook in oven: Preheat the oven to 300°F. Use kitchen twine to tie together the bay leaves, rosemary and thyme.\r\nMove the onions and garlic to the sides of the pot and nestle the brisket inside. Add the beef stock and the tied-up herbs. Bring the stock to a boil on the stovetop.\r\nCover the pot, place the pot in the 300°F oven and cook for 3 hours. Carefully flip the brisket every hour so it cooks evenly.\r\n \r\n5 Add carrots, continue to cook: After 3 hours, add the carrots. Cover the pot and cook for 1 hour more, or until the carrots are cooked through and the brisket is falling-apart tender.\r\n6 Remove brisket to cutting board, tent with foil: When the brisket is falling-apart tender, take the pot out of the oven and remove the brisket to a cutting board. Cover it with foil. Pull out and discard the herbs.\r\n7 Make sauce (optional): At this point you have two options. You can serve as is, or you can make a sauce with the drippings and some of the onions. If you serve as is, skip this step.\r\nTo make a sauce, remove the carrots and half of the onions, set aside and cover them with foil. Pour the ingredients that are remaining into the pot into a blender, and purée until smooth. If you want, add 1 tablespoon of mustard to the mix. Put into a small pot and keep warm.\r\n8 Slice the meat across the grain: Notice the lines of the muscle fibers of the roast. This is the "grain" of the meat. Slice the meat perpendicular to these lines, or across the grain (cutting this way further tenderizes the meat), in 1/4-inch to 1/2-inch slices.\r\nServe with the onions, carrots and gravy. Serve with mashed, roasted or boiled potatoes, egg noodles or polenta.	A comforting American dish of beef brisket slow-cooked with root vegetables and herbs until tender and flavorful.	300	https://ftp.goit.study/img/so-yummy/preview/Beef%20Brisket%20Pot%20Roast.jpg	2025-07-09 17:36:37.818+00	2025-07-09 17:36:37.818+00
10	Rogaliki (Polish Croissant Cookies)	6	25	3	In a medium bowl mix egg yolks, philly cheese and baking powder using a hand held mixer. Carefully start adding the flour. When the mixture will not be mixing well, and will look like wood chips, put away the blending mixer and using your hands knead the dough.\r\nCreate a roll and cover in foil and freeze for 15 minutes. At this time preheat the oven to 375.\r\nTake the dough out and separate into two. Roll and cut out 3 inch trangles.\r\nMake as many as you can and on centre of each put a small spoon of jam. Roll them into a croissant shape.\r\nPlace the croissants onto a greased cookie sheet, and bake for 10-12 minutes or until golden.\r\nRepeat with the rest of the dough.\r\nWhen you take them out, put aside and sprinkle with powdered sugar on top.\r\nThis makes about 3 batches of 20 cookies each.\r\nTotal count about 60 cookies.	A popular Polish pastry, Rogaliki are crescent-shaped cookies made from a flaky, buttery dough and typically filled with jam, nuts, or poppy seeds.	35	https://ftp.goit.study/img/so-yummy/preview/Rogaliki%20_Polish%20Croissant%20Cookies_.jpg	2025-07-09 17:36:37.832+00	2025-07-09 17:36:37.832+00
11	Thai Green Curry	4	5	3	Put the potatoes in a pan of boiling water and cook for 5 minutes. Throw in the beans and cook for a further 3 minutes, by which time both should be just tender but not too soft. Drain and put to one side.\r\nIn a wok or large frying pan, heat the oil until very hot, then drop in the garlic and cook until golden, this should take only a few seconds. Don’t let it go very dark or it will spoil the taste. Spoon in the curry paste and stir it around for a few seconds to begin to cook the spices and release all the flavours. Next, pour in the coconut milk and let it come to a bubble.\r\nStir in the fish sauce and sugar, then the pieces of chicken. Turn the heat down to a simmer and cook, covered, for about 8 minutes until the chicken is cooked.\r\nTip in the potatoes and beans and let them warm through in the hot coconut milk, then add a lovely citrussy flavour by stirring in the shredded lime leaves (or lime zest). The basil leaves go in next, but only leave them briefly on the heat or they will quickly lose their brightness. Scatter with the lime garnish and serve immediately with boiled rice.	A fragrant Thai dish made with coconut milk, green curry paste, and a mix of vegetables and meat or seafood.	40	https://ftp.goit.study/img/so-yummy/preview/Thai%20Green%20Curry.jpg	2025-07-09 17:36:37.842+00	2025-07-09 17:36:37.842+00
12	Traditional Croatian Goulash	5	21	3	Clean the meat from the veins if there are some and cut it into smaller pieces, 3 × 3 cm. Marinate the meat in the mustard and spices and let it sit in the refrigerator for one hour\r\nHeat one tablespoon of pork fat or vegetable oil in a pot and fry the meat on all sides until it gets browned. Once the meat is cooked, transfer it to a plate and add another tablespoon of fat to the pot\r\nCut the onions very fine, peel the carrots and shred it using a grater. Cook the onions and carrots over low heat for 15 minutes. You can salt the vegetables a little to make them soften faster\r\nOnce the vegetables have browned and become slightly mushy, add the meat and bay leaves and garlic. Pour over with wine and simmer for 10-15 minutes to allow the alcohol to evaporate. Now is the right time to add 2/3 the amount of liquid\r\nCover the pot and cook over low heat for an hour, stirring occasionally. After the first hour, pour over the rest of the water or stock and cook for another 30-45 minutes\r\nAllow the stew to cool slightly and serve it with a sprinkle of chopped parsley and few slices of fresh hot pepper if you like to spice it up a bit\r\nSlice ​​some fresh bread, season the salad and simply enjoying these wonderful flavors	A hearty Croatian stew made with beef, potatoes, onions, and paprika, often served with a side of bread or pasta. The dish has a rich and savory flavor and is a popular comfort food in Croatia.	135	https://ftp.goit.study/img/so-yummy/preview/Traditional%20Croatian%20Goulash.jpg	2025-07-09 17:36:37.861+00	2025-07-09 17:36:37.861+00
14	Chinon Apple Tarts	6	9	3	To make the red wine jelly, put the red wine, jam sugar, star anise, clove, cinnamon stick, allspice, split vanilla pod and seeds in a medium saucepan. Stir together, then heat gently to dissolve the sugar. Turn up the heat and boil for 20 mins until reduced and syrupy. Strain into a small, sterilised jam jar and leave to cool completely. Will keep in the fridge for up to 1 month.\r\n\r\nTake the pastry out of the fridge and leave at room temperature for 10 mins, then unroll. Heat the grill to high and heat the oven to 180C/160C fan/gas 4. Cut out 2 x 13cm circles of pastry, using a plate as a guide, and place on a non-stick baking sheet. Sprinkle each circle with 1 tbsp sugar and grill for 5 mins to caramelise, watching carefully so that the sugar doesn’t burn. Remove from the grill. Can be done a few hours ahead, and left, covered, out of the fridge.\r\n\r\nPeel, quarter and core the apples, cut into 2mm-thin slices and arrange on top of the pastry. Sprinkle over the remaining sugar and pop in the oven for 20-25 mins until the pastry is cooked through and golden, and the apples are softened. Remove and allow to cool slightly. Warm 3 tbsp of the red wine jelly in a small pan over a low heat with 1 tsp water to make it a little more runny, then brush over the top of the tarts.\r\n\r\nTip the crème fraîche into a bowl, sift over the icing sugar and cardamom, and mix together. Carefully lift the warm tarts onto serving plates and serve with the cardamom crème fraîche.	A delicious French pastry with caramelized apples and a flaky pastry crust.	70	https://ftp.goit.study/img/so-yummy/preview/Chinon%20Apple%20Tarts.jpg	2025-07-09 17:36:37.907+00	2025-07-09 17:36:37.907+00
15	Sticky Toffee Pudding	6	7	3	Preheat the oven to 180C/160C Fan/Gas 4. Butter a wide shallow 1.7-litre/3-pint ovenproof dish.\r\nPut the butter, sugar, eggs, flour, baking powder, bicarbonate of soda and treacle into a mixing bowl. Beat using an electric handheld whisk for about 30 seconds or until combined. Pour in the milk gradually and whisk again until smooth. Pour into the prepared dish. Bake for 35–40 minutes or until well risen and springy in the centre.\r\nTo make the sauce, put all the ingredients into a saucepan and stir over a low heat until the sugar has dissolved and the butter has melted. Bring to the boil, stirring for a minute.\r\nTo serve, pour half the sauce over the pudding in the baking dish. Serve with the cream or ice cream.	A decadent dessert with moist sponge cake and a rich toffee sauce.	50	https://ftp.goit.study/img/so-yummy/preview/Sticky%20Toffee%20Pudding.jpg	2025-07-09 17:36:37.92+00	2025-07-09 17:36:37.92+00
16	Carrot Cake	6	7	3	For the carrot cake, preheat the oven to 160C/325F/Gas 3. Grease and line a 26cm/10in springform cake tin.\r\nMix all of the ingredients for the carrot cake, except the carrots and walnuts, together in a bowl until well combined. Stir in the carrots and walnuts.\r\nSpoon the mixture into the cake tin and bake for 1 hour 15 minutes, or until a skewer inserted into the middle comes out clean. Remove the cake from the oven and set aside to cool for 10 minutes, then carefully remove the cake from the tin and set aside to cool completely on a cooling rack.\r\nMeanwhile, for the icing, beat the cream cheese, caster sugar and butter together in a bowl until fluffy. Spread the icing over the top of the cake with a palette knife.	A cake made with grated carrots, flour, eggs, sugar, and spices like cinnamon and nutmeg. It is often topped with cream cheese frosting and is a popular dessert in many countries.	75	https://ftp.goit.study/img/so-yummy/preview/Carrot%20Cake.jpg	2025-07-09 17:36:37.931+00	2025-07-09 17:36:37.931+00
17	English Breakfast	12	7	3	Heat the flat grill plate over a low heat, on top of 2 rings/flames if it fits, and brush sparingly with light olive oil.\r\nCook the sausages first. Add the sausages to the hot grill plate/the coolest part if there is one and allow to cook slowly for about 15-20 minutes, turning occasionally, until golden. After the first 10 minutes, increase the heat to medium before beginning to cook the other ingredients. If you are struggling for space, completely cook the sausages and keep hot on a plate in the oven.\r\nSnip a few small cuts into the fatty edge of the bacon. Place the bacon straight on to the grill plate and fry for 2-4 minutes each side or until your preferred crispiness is reached. Like the sausages, the cooked bacon can be kept hot on a plate in the oven.\r\nFor the mushrooms, brush away any dirt using a pastry brush and trim the stalk level with the mushroom top. Season with salt and pepper and drizzle over a little olive oil. Place stalk-side up on the grill plate and cook for 1-2 minutes before turning and cooking for a further 3-4 minutes. Avoid moving the mushrooms too much while cooking, as this releases the natural juices, making them soggy.\r\nFor the tomatoes, cut the tomatoes across the centre/or in half lengthways if using plum tomatoes , and with a small, sharp knife remove the green 'eye'. Season with salt and pepper and drizzle with a little olive oil. Place cut-side down on the grill plate and cook without moving for 2 minutes. Gently turn over and season again. Cook for a further 2-3 minutes until tender but still holding their shape.\r\nFor the black pudding, cut the black pudding into 3-4 slices and remove the skin. Place on the grill plate and cook for 1½-2 minutes each side until slightly crispy.\r\nFor 'proper' fried bread it's best to cook it in a separate pan. Ideally, use bread that is a couple of days old. Heat a frying pan to a medium heat and cover the base with oil. Add the bread and cook for 2-3 minutes each side until crispy and golden. If the pan becomes too dry, add a little more oil. For a richer flavour, add a knob of butter after you turn the slice.\r\nFor the fried eggs, break the egg straight into the pan with the fried bread and leave for 30 seconds. Add a good knob of butter and lightly splash/baste the egg with the butter when melted. Cook to your preferred stage, season and gently remove with a fish slice.\r\nOnce all the ingredients are cooked, serve on warm plates and enjoy straight away with a good squeeze of tomato ketchup or brown sauce.	A hearty breakfast meal consisting of eggs, bacon, sausage, baked beans, grilled tomato, and toast. It is a popular breakfast in the United Kingdom.	51	https://ftp.goit.study/img/so-yummy/preview/English%20Breakfast.jpg	2025-07-09 17:36:37.949+00	2025-07-09 17:36:37.949+00
18	Tuna and Egg Briks	1	18	3	Heat 2 tsp of the oil in a large saucepan and cook the spring onions over a low heat for 3 minutes or until beginning to soften. Add the spinach, cover with a tight-fitting lid and cook for a further 2–3 minutes or until tender and wilted, stirring once or twice. Tip the mixture into a sieve or colander and leave to drain and cool.\r\nUsing a saucer as a guide, cut out 24 rounds about 12.5 cm (5 in) in diameter from the filo pastry, cutting 6 rounds from each sheet. Stack the filo rounds in a pile, then cover with cling film to prevent them from drying out.\r\nWhen the spinach mixture is cool, squeeze out as much excess liquid as possible, then transfer to a bowl. Add the tuna, eggs, hot pepper sauce, and salt and pepper to taste. Mix well.\r\nPreheat the oven to 200°C (400°F, gas mark 6). Take one filo round and very lightly brush with some of the remaining oil. Top with a second round and brush with a little oil, then place a third round on top and brush with oil.\r\nPlace a heaped tbsp of the filling in the middle of the round, then fold the pastry over to make a half-moon shape. Fold in the edges, twisting them to seal, and place on a non-stick baking sheet. Repeat with the remaining pastry and filling to make 8 briks in all.\r\nLightly brush the briks with the remaining oil. Bake for 12–15 minutes or until the pastry is crisp and golden brown.\r\nMeanwhile, combine the tomatoes and cucumber in a bowl and sprinkle with the lemon juice and seasoning to taste. Serve the briks hot with this salad and the chutney.	A crispy Tunisian pastry filled with tuna, egg, onion, and parsley, spiced with cumin and harissa.	45	https://ftp.goit.study/img/so-yummy/preview/Tuna%20and%20Egg%20Briks.jpg	2025-07-09 17:36:37.961+00	2025-07-09 17:36:37.961+00
19	BBQ Pork Sloppy Joes	8	11	3	1\r\n\r\nPreheat oven to 450 degrees. Wash and dry all produce. Cut sweet potatoes into ½-inch-thick wedges. Toss on a baking sheet with a drizzle of oil, salt, and pepper. Roast until browned and tender, 20-25 minutes.\r\n\r\n2\r\n\r\nMeanwhile, halve and peel onion. Slice as thinly as possible until you have ¼ cup (½ cup for 4 servings); finely chop remaining onion. Peel and finely chop garlic. Halve lime; squeeze juice into a small bowl. Halve buns. Add 1 TBSP butter (2 TBSP for 4) to a separate small microwave-safe bowl; microwave until melted, 30 seconds. Brush onto cut sides of buns.\r\n\r\n3\r\n\r\nTo bowl with lime juice, add sliced onion, ¼ tsp sugar (½ tsp for 4 servings), and a pinch of salt. Stir to combine; set aside to quick-pickle.\r\n\r\n4\r\n\r\nHeat a drizzle of oil in a large pan over medium-high heat. Add chopped onion and season with salt and pepper. Cook, stirring, until softened, 4-5 minutes. Add garlic and cook until fragrant, 30 seconds more. Add pork and season with salt and pepper. Cook, breaking up meat into pieces, until browned and cooked through, 4-6 minutes.\r\n\r\n5\r\n\r\nWhile pork cooks, in a third small bowl, combine BBQ sauce, pickling liquid from onion, 3 TBSP ketchup (6 TBSP for 4 servings), ½ tsp sugar (1 tsp for 4), and ¼ cup water (⅓ cup for 4). Once pork is cooked through, add BBQ sauce mixture to pan. Cook, stirring, until sauce is thickened, 2-3 minutes. Taste and season with salt and pepper.\r\n\r\n6\r\n\r\nMeanwhile, toast buns in oven or toaster oven until golden, 3-5 minutes. Divide toasted buns between plates and fill with as much BBQ pork as you’d like. Top with pickled onion and hot sauce. Serve with sweet potato wedges on the side.	These classic sloppy joes are made with BBQ pork instead of ground beef, and are a quick and easy dinner option.	35	https://ftp.goit.study/img/so-yummy/preview/BBQ%20Pork%20Sloppy%20Joes.jpg	2025-07-09 17:36:37.983+00	2025-07-09 17:36:37.983+00
20	Seafood fideuà	1	15	3	Boil the kettle. Empty the mussels into a colander and run under cold water. Throw away any with broken shells. Pick through the shells, tapping each one on the side of the sink – they should be closed or should slowly close when tapped – if they stay open, throw them away. If any of the shells still have barnacles or stringy beards attached, pull them off with a cutlery knife and rinse the shells well. Keep in the colander, covered with a cold, damp cloth, until you’re ready to cook. Peel the prawn shells on the body section only – leave the heads and tails intact. Score down the backs and pull out any gritty entrails. Chill until you’re ready to cook.\r\nPut the saffron in a small cup, cover with 50ml kettle-hot water and set aside for 10 mins. If using vermicelli, put in a bowl and crush to little pieces (about 1cm long) with your hands.\r\nHeat the oil in a large frying pan with at least a 3cm lip, or a 40cm paella pan. Add the onion and stir around the pan for 5 mins until soft. Add the garlic and cook for 1 min more, then tip in the vermicelli and cook for 5 mins, stirring from time to time, until the vermicelli is toasted brown. Stir in the paprika.\r\nKeeping the heat moderate, stir through the monkfish, squid and saffron with its water, seasoning well. Spread the ingredients out in an even layer, then pour over the hot stock and scatter the tomatoes on top. Bring to a simmer, then cover the whole dish with a tight-fitting lid (or foil). Turn the heat to medium and cook for 6 mins.\r\nUncover and stir to incorporate the dry top layer of pasta. Push the mussels into the pasta so the hinges are buried in the bottom of the dish, and they stand straight up. Arrange the prawns on top, cover tightly and cook for another 6 mins or until the mussels are open, the prawns are pink and the pasta is cooked through. Leave to simmer for another 2-3 mins to cook off most of the remaining liquid (leave a little in the pan to prevent the pasta from sticking together). Allow to sit for 2-3 mins, then squeeze over the lemon juice and arrange the wedges on top. Scatter with parsley before serving.	Spanish-style noodle dish with seafood	40	https://ftp.goit.study/img/so-yummy/preview/Seafood%20fideu_.jpg	2025-07-09 17:36:38.003+00	2025-07-09 17:36:38.003+00
21	Moroccan Carrot Soup	9	3	3	Step 1\r\nPreheat oven to 180° C.\r\nStep 2\r\nCombine carrots, onion, garlic, cumin seeds, coriander seeds, salt and olive oil in a bowl and mix well. Transfer on a baking tray.\r\nStep 3\r\nPut the baking tray in preheated oven and roast for 10-12 minutes or till carrots soften. Remove from heat and cool.\r\nStep 4\r\nGrind the baked carrot mixture along with some water to make a smooth paste and strain in a bowl.\r\nStep 5\r\nHeat the carrot mixture in a non-stick pan. Add two cups of water and bring to a boil. Add garam masala powder and mix. Add salt and mix well.\r\nStep 6\r\nRemove from heat, add lemon juice and mix well.\r\nStep 7\r\nServe hot.	A hearty soup made with carrots, onions, garlic, and a blend of Moroccan spices like cumin, cinnamon, and ginger. Served hot with a dollop of yogurt and a sprinkle of cilantro for a touch of freshness.	30	https://ftp.goit.study/img/so-yummy/preview/Moroccan%20Carrot%20Soup.jpg	2025-07-09 17:36:38.022+00	2025-07-09 17:36:38.022+00
22	Burek	13	21	3	Fry the finely chopped onions and minced meat in oil. Add the salt and pepper. Grease a round baking tray and put a layer of pastry in it. Cover with a thin layer of filling and cover this with another layer of filo pastry which must be well coated in oil. Put another layer of filling and cover with pastry. When you have five or six layers, cover with filo pastry, bake at 200ºC/392ºF for half an hour and cut in quarters and serve.	Burek is a traditional Balkan pastry made with phyllo dough and a savory filling, usually of meat, cheese, or vegetables. It's a popular street food in the region and can be enjoyed as a snack or a meal.	30	https://ftp.goit.study/img/so-yummy/preview/Burek.jpg	2025-07-09 17:36:38.032+00	2025-07-09 17:36:38.032+00
23	Duck Confit	10	9	3	The day before you want to make the dish, scatter half the salt, half the garlic and half of the herbs over the base of a small shallow dish. Lay the duck legs, skin-side up, on top, then scatter over the remaining salt, garlic and herbs. Cover the duck and refrigerate overnight. This can be done up to 2 days ahead.\r\nPour the wine into a saucepan that will snugly fit the duck legs in a single layer. Brush the salt off the duck legs and place them, skin-side down, in the wine. Cover the pan with a lid and place over a medium heat. As soon as the wine starts to bubble, turn the heat down to the lowest setting and cook for 2 hours, checking occasionally that the liquid is just barely simmering. (If you own a heat diffuser, it would be good to use it here.) After 2 hours, the duck legs should be submerged in their own fat and the meat should feel incredibly tender when prodded. Leave to cool.\r\nThe duck legs are now cooked and can be eaten immediately – or you can follow the next step if you like them crisp. If you are preparing ahead, pack the duck legs tightly into a plastic container or jar and pour over the fat, but not the liquid at the bottom of the pan. Cover and leave in the fridge for up to a month, or freeze for up to 3 months. The liquid you are left with makes a tasty gravy, which can be chilled or frozen until needed.\r\nTo reheat and crisp up the duck legs, heat oven to 220C/fan 200C/gas 7. Remove the legs from the fat and place them, skin-side down, in an ovenproof frying pan. Roast for 30-40 mins, turning halfway through, until brown and crisp. Serve with the reheated gravy, a crisp salad and some crisp golden ptoatoes.	Tender and flavorful duck legs that have been slowly cooked in their own fat until they are fall-off-the-bone delicious. A gourmet dish that's surprisingly easy to make.	160	https://ftp.goit.study/img/so-yummy/preview/Duck%20Confit.jpg	2025-07-09 17:36:38.043+00	2025-07-09 17:36:38.043+00
24	Eccles Cakes	6	7	3	To make the pastry, dice the butter and put it in the freezer to go really hard. Tip flour into the bowl of a food processor with half the butter and pulse to the texture of breadcrumbs. Pour in the lemon juice and 100ml iced water, and pulse to a dough. Tip in the rest of the butter and pulse a few times until the dough is heavily flecked with butter. It is important that you don’t overdo this as the flecks of butter are what makes the pastry flaky.\r\nOn a floured surface roll the pastry out to a neat rectangle about 20 x 30cm. Fold the two ends of the pastry into the middle (See picture 1), then fold in half (pic 2). Roll the pastry out again and refold the same way 3 more times resting the pastry for at least 15 mins each time between roll and fold, then leave to rest in the fridge for at least 30 mins before using.\r\nTo make the filling, melt the butter in a large saucepan. Take it off the heat and stir in all the other ingredients until completely mixed, then set aside.\r\nTo make the cakes, roll the pastry out until it’s just a little thicker than a £1 coin and cut out 8 rounds about 12cm across. Re-roll the trimming if needed. Place a good heaped tablespoon of mixture in the middle of each round, brush the edges of the rounds with water, then gather the pastry around the filling and squeeze it together (pic 3). Flip them over so the smooth top is upwards and pat them into a smooth round. Flatten each round with a rolling pin to an oval until the fruit just starts to poke through, then place on a baking tray. Cut 2 little slits in each Eccles cakes, brush generously with egg white and sprinkle with the sugar (pic 4).\r\nHeat the oven to 220C/200C fan/gas 8. Bake the Eccles cakes for 15-20 mins until just past golden brown and sticky. Leave to cool on a rack and enjoy while still warm or cold with a cup of tea. If you prefer, Eccles cakes also go really well served with a wedge of hard, tangy British cheese such as Lancashire or cheddar.	A sweet pastry filled with currants, spices, and brown sugar, named after the town of Eccles in Greater Manchester.	80	https://ftp.goit.study/img/so-yummy/preview/Eccles%20Cakes.jpg	2025-07-09 17:36:38.053+00	2025-07-09 17:36:38.053+00
25	Sweet and Sour Pork	8	22	3	Preparation\r\n1. Crack the egg into a bowl. Separate the egg white and yolk.\r\n\r\nSweet and Sour Pork\r\n2. Slice the pork tenderloin into strips.\r\n\r\n3. Prepare the marinade using a pinch of salt, one teaspoon of starch, two teaspoons of light soy sauce, and an egg white.\r\n\r\n4. Marinade the pork strips for about 20 minutes.\r\n\r\n5. Put the remaining starch in a bowl. Add some water and vinegar to make a starchy sauce.\r\n\r\nSweet and Sour Pork\r\nCooking Instructions\r\n1. Pour the cooking oil into a wok and heat to 190°C (375°F). Add the marinated pork strips and fry them until they turn brown. Remove the cooked pork from the wok and place on a plate.\r\n\r\n2. Leave some oil in the wok. Put the tomato sauce and white sugar into the wok, and heat until the oil and sauce are fully combined.\r\n\r\n3. Add some water to the wok and thoroughly heat the sweet and sour sauce before adding the pork strips to it.\r\n\r\n4. Pour in the starchy sauce. Stir-fry all the ingredients until the pork and sauce are thoroughly mixed together.\r\n\r\n5. Serve on a plate and add some coriander for decoration.	A Chinese-American classic made with tender pieces of pork, bell peppers, and pineapple in a sweet and tangy sauce. Served with rice.	20	https://ftp.goit.study/img/so-yummy/preview/Sweet%20and%20Sour%20Pork.jpg	2025-07-09 17:36:38.067+00	2025-07-09 17:36:38.067+00
26	Crispy Sausages and Greens	8	6	3	Preheat the oven to 350°. Remove the stems from one bunch of Tuscan kale and tear the leaves into 1" pieces (mustard greens, collards, spinach, and chard are great, too). Coarsely chop half a head of green cabbage. Combine the greens in a large baking dish and add 4 cloves of thinly sliced garlic. Adding some sliced onions and shiitake mushrooms at this point is optional, but highly recommended (I'll sauté the onions and mushrooms in a cast iron baking dish right on the stove before adding to the greens). Coat the greens with some olive oil and pour ½ cup chicken stock or broth over everything. Cover the dish with foil and bake until the greens are wilted, about 15 minutes. Remove foil and season with salt and pepper. Continue to bake until cabbage is tender, about 20-25 minutes more.\r\n\r\nMeanwhile, heat a little olive oil in a large skillet over medium-high. Prick four sweet Italian sausages with a fork and cook until browned on all sides and cooked through, 10 to 12 minutes. When the greens are done, slice the sausage and toss into the greens with a splash of your favorite vinegar (I like sherry or red wine).	This dish features crispy sausages served with a side of sautéed greens, such as kale or spinach.	55	https://ftp.goit.study/img/so-yummy/preview/Crispy%20Sausages%20and%20Greens.jpg	2025-07-09 17:36:38.084+00	2025-07-09 17:36:38.084+00
27	Steak Diane	5	9	3	Heat oil in a 12" skillet over medium-high heat. Season steaks with salt and pepper, and add to skillet; cook, turning once, until browned on both sides and cooked to desired doneness, about 4 to 5 minutes for medium-rare. Transfer steaks to a plate, and set aside.\r\nReturn skillet to high heat, and add stock; cook until reduced until to 1⁄2 cup, about 10 minutes. Pour into a bowl, and set aside. Return skillet to heat, and add butter; add garlic and shallots, and cook, stirring, until soft, about 2 minutes. Add mushrooms, and cook, stirring, until they release any liquid and it evaporates and mushrooms begin to brown, about 2 minutes. Add cognac, and light with a match to flambée; cook until flame dies down. Stir in reserved stock, cream, Dijon, Worcestershire, and hot sauce, and then return steaks to skillet; cook, turning in sauce, until warmed through and sauce is thickened, about 4 minutes. Transfer steak to serving plates and stir parsley and chives into sauce; pour sauce over steaks to serve.	A classic French dish made with pan-seared steak, served with a sauce made from butter, shallots, mushrooms, and cream, and flavored with brandy and Worcestershire sauce.	30	https://ftp.goit.study/img/so-yummy/preview/Steak%20Diane.jpg	2025-07-09 17:36:38.094+00	2025-07-09 17:36:38.094+00
28	Apam balik	6	13	3	Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.	A popular Malaysian dessert made with a crispy and fluffy pancake-like batter, filled with sweet roasted peanuts, sugar, and creamed corn. Served hot, folded in half and drizzled with sweet syrup or condensed milk.	10	https://ftp.goit.study/img/so-yummy/preview/Apam%20balik.jpg	2025-07-09 17:36:38.117+00	2025-07-09 17:36:38.117+00
46	Massaman Beef curry	5	5	3	Heat oven to 200C/180C fan/gas 6, then roast the peanuts on a baking tray for 5 mins until golden brown. When cool enough to handle, roughly chop. Reduce oven to 180C/160C fan/gas 4.\r\nHeat 2 tbsp coconut cream in a large casserole dish with a lid. Add the curry paste and fry for 1 min, then stir in the beef and fry until well coated and sealed. Stir in the rest of the coconut with half a can of water, the potatoes, onion, lime leaves, cinnamon, tamarind, sugar, fish sauce and most of the peanuts. Bring to a simmer, then cover and cook for 2 hrs in the oven until the beef is tender.\r\nSprinkle with sliced chilli and the remaining peanuts, then serve straight from the dish with jasmine rice.	Thai curry with beef, potatoes, and peanuts	130	https://ftp.goit.study/img/so-yummy/preview/Massaman%20Beef%20curry.jpg	2025-07-09 17:36:38.359+00	2025-07-09 17:36:38.359+00
29	Gołąbki (cabbage roll)	5	25	3	Bring a large pot of lightly salted water to a boil. Place cabbage head into water, cover pot, and cook until cabbage leaves are slightly softened enough to remove from head, 3 minutes. Remove cabbage from pot and let cabbage sit until leaves are cool enough to handle, about 10 minutes.\r\n\r\nRemove 18 whole leaves from the cabbage head, cutting out any thick tough center ribs. Set whole leaves aside. Chop the remainder of the cabbage head and spread it in the bottom of a casserole dish.\r\n\r\nMelt butter in a large skillet over medium-high heat. Cook and stir onion in hot butter until tender, 5 to 10 minutes. Cool.\r\n\r\nStir onion, beef, pork, rice, garlic, 1 teaspoon salt, and 1/4 teaspoon pepper together in a large bowl.\r\n\r\nPreheat oven to 350 degrees F (175 degrees C).\r\n\r\nPlace about 1/2 cup beef mixture on a cabbage leaf. Roll cabbage around beef mixture, tucking in sides to create an envelope around the meat. Repeat with remaining leaves and meat mixture. Place cabbage rolls in a layer atop the chopped cabbage in the casserole dish; season rolls with salt and black pepper.\r\n\r\nWhisk tomato soup, tomato juice, and ketchup together in a bowl. Pour tomato soup mixture over cabbage rolls and cover dish wish aluminum foil.\r\n\r\nBake in the preheated oven until cabbage is tender and meat is cooked through, about 1 hour.	A classic Polish dish, Gołąbki are cabbage rolls filled with a mixture of ground meat, rice, and onions, and then baked or steamed and served with tomato sauce.	73	https://ftp.goit.study/img/so-yummy/preview/Go__bki%20_cabbage%20roll_.jpg	2025-07-09 17:36:38.126+00	2025-07-09 17:36:38.126+00
30	Big Mac	5	11	3	For the Big Mac sauce, combine all the ingredients in a bowl, season with salt and chill until ready to use.\r\n2. To make the patties, season the mince with salt and pepper and form into 4 balls using about 1/3 cup mince each. Place each onto a square of baking paper and flatten to form into four x 15cm circles. Heat oil in a large frypan over high heat. In 2 batches, cook beef patties for 1-2 minutes each side until lightly charred and cooked through. Remove from heat and keep warm. Repeat with remaining two patties.\r\n3. Carefully slice each burger bun into three acrossways, then lightly toast.\r\n4. To assemble the burgers, spread a little Big Mac sauce over the bottom base. Top with some chopped onion, shredded lettuce, slice of cheese, beef patty and some pickle slices. Top with the middle bun layer, and spread with more Big Mac sauce, onion, lettuce, pickles, beef patty and then finish with more sauce. Top with burger lid to serve.\r\n5. After waiting half an hour for your food to settle, go for a jog.	A beloved fast-food burger made with two juicy beef patties, special sauce, lettuce, cheese, pickles, onions, and a sesame seed bun, for a classic taste of Americana.	30	https://ftp.goit.study/img/so-yummy/preview/Big%20Mac.jpg	2025-07-09 17:36:38.143+00	2025-07-09 17:36:38.143+00
31	Roast fennel and aubergine paella	7	15	3	1 Put the fennel, aubergine, pepper and courgette in a roasting tray. Add a glug of olive oil, season with salt and pepper and toss around to coat the veggies in the oil. Roast in the oven for 20 minutes, turning a couple of times until the veg are pretty much cooked through and turning golden.\r\n\r\n2 Meanwhile, heat a paella pan or large frying pan over a low– medium heat and add a glug of olive oil. Sauté the onion for 8–10 minutes until softened. Increase the heat to medium and stir in the rice, paprika and saffron. Cook for around 1 minute to start toasting the rice, then add the white wine. Reduce by about half before stirring in two-thirds of the stock. Reduce to a simmer and cook for 10 minutes without a lid, stirring a couple of times.\r\n\r\n3 Stir in the peas, add some seasoning, then gently mix in the roasted veg. Pour over the remaining stock, arrange the lemon wedges on top and cover with a lid or some aluminium foil. Cook for a further 10 minutes.\r\n\r\n4 To ensure you get the classic layer of toasted rice at the bottom of the pan, increase the heat to high until you hear a slight crackle. Remove from the heat and sit for 5 minutes before sprinkling over the parsley and serving.	A vegetarian version of the classic Spanish dish, paella, made with roasted fennel, eggplant, and saffron rice. Served with a side salad.	56	https://ftp.goit.study/img/so-yummy/preview/Roast%20fennel%20and%20aubergine%20paella.jpg	2025-07-09 17:36:38.16+00	2025-07-09 17:36:38.16+00
32	Baked salmon with fennel & tomatoes	1	7	3	Heat oven to 180C/fan 160C/gas 4. Trim the fronds from the fennel and set aside. Cut the fennel bulbs in half, then cut each half into 3 wedges. Cook in boiling salted water for 10 mins, then drain well. Chop the fennel fronds roughly, then mix with the parsley and lemon zest.\r\n\r\nSpread the drained fennel over a shallow ovenproof dish, then add the tomatoes. Drizzle with olive oil, then bake for 10 mins. Nestle the salmon among the veg, sprinkle with lemon juice, then bake 15 mins more until the fish is just cooked. Scatter over the parsley and serve.	A healthy and delicious meal made with fresh salmon fillets, roasted fennel, and cherry tomatoes. Served with a side salad.	25	https://ftp.goit.study/img/so-yummy/preview/Baked%20salmon%20with%20fennel%20_%20tomatoes.jpg	2025-07-09 17:36:38.182+00	2025-07-09 17:36:38.182+00
33	Boulangère Potatoes	13	9	3	Heat oven to 200C/fan 180C/gas 6. Fry the onions and thyme sprigs in the oil until softened and lightly coloured (about 5 mins).\r\nSpread a layer of potatoes over the base of a 1.5-litre oiled gratin dish. Sprinkle over a few onions (see picture, above) and continue layering, finishing with a layer of potatoes. Pour over the stock and bake for 50-60 mins until the potatoes are cooked and the top is golden and crisp.	A French potato dish made with thinly sliced potatoes, onions, and herbs, baked in a broth until tender.	60	https://ftp.goit.study/img/so-yummy/preview/Boulangère%20Potatoes.jpg	2025-07-09 17:36:38.189+00	2025-07-09 17:36:38.189+00
34	Lamb Tzatziki Burgers	2	19	3	Tip the bulghar into a pan, cover with water and boil for 10 mins. Drain really well in a sieve, pressing out any excess water.\r\n\r\nTo make the tzatziki, squeeze and discard the juice from the cucumber, then mix into the yogurt with the chopped mint and a little salt.\r\n\r\nWork the bulghar into the lamb with the spices, garlic (if using) and seasoning, then shape into 4 burgers. Brush with a little oil and fry or barbecue for about 5 mins each side until cooked all the way through. Serve in the buns (toasted if you like) with the tzatziki, tomatoes, onion and a few mint leaves.	Juicy lamb burgers topped with a tangy tzatziki sauce, sliced tomatoes, onions, and feta cheese, all piled onto a soft bun for the ultimate Mediterranean flavor.	30	https://ftp.goit.study/img/so-yummy/preview/Lamb%20Tzatziki%20Burgers.jpg	2025-07-09 17:36:38.194+00	2025-07-09 17:36:38.194+00
47	Broccoli & Stilton soup	3	7	3	Heat the rapeseed oil in a large saucepan and then add the onions. Cook on a medium heat until soft. Add a splash of water if the onions start to catch.\r\n\r\nAdd the celery, leek, potato and a knob of butter. Stir until melted, then cover with a lid. Allow to sweat for 5 minutes. Remove the lid.\r\n\r\nPour in the stock and add any chunky bits of broccoli stalk. Cook for 10 – 15 minutes until all the vegetables are soft.\r\n\r\nAdd the rest of the broccoli and cook for a further 5 minutes. Carefully transfer to a blender and blitz until smooth. Stir in the stilton, allowing a few lumps to remain. Season with black pepper and serve.	A hearty soup made with broccoli and Stilton cheese. Comfort food at its best.	35	https://ftp.goit.study/img/so-yummy/preview/Broccoli%20_%20Stilton%20soup.jpg	2025-07-09 17:36:38.373+00	2025-07-09 17:36:38.373+00
35	Spring onion and prawn empanadas	1	20	3	STEP 1\r\n\r\nTo make the dough, rub the butter into the flour and then add the egg white and half the yolk (keep the rest), vinegar, a pinch of salt and enough cold water to make a soft dough. Knead on a floured surface until smooth and then wrap and rest for 30 minutes.\r\n\r\nSTEP 2\r\n\r\nHeat the oven to 180c/fan 160c/gas 4. Trim the green ends of the spring onions and then finely slice the rest. Heat a little oil in a pan and fry them gently until soft but not browned. Add the chilli and garlic, stir and then add the prawns and cook until they are opaque. Season well. Scoop out the prawns and bubble the juices until they thicken, then add back the prawns.\r\n\r\nSTEP 3\r\n\r\nDivide the empanada dough into eight balls and roll out to thin circles on a floured surface. Put some filling on one half of the dough, sprinkle the feta on top and fold the other half over. Trim the edge and then fold and crimp the dough together so the empanada is tightly sealed, put it on an oiled baking sheet either on its side or sitting on its un-crimped edge like a cornish pasty. Repeat with the remaining dough and mixture. Mix the leftover egg yolk with a splash of water and brush the top of the empanadas.\r\n\r\nSTEP 4\r\n\r\nBake for 30 minutes or until golden and slightly crisp around the edges.	Spring onion and prawn empanadas are a tasty Spanish dish of small pastries filled with a mixture of prawns, spring onions, and spices, perfect as a snack or appetizer.	60	https://ftp.goit.study/img/so-yummy/preview/Spring%20onion%20and%20prawn%20empanadas.jpg	2025-07-09 17:36:38.21+00	2025-07-09 17:36:38.21+00
36	Japanese Katsudon	8	8	3	STEP 1\r\nHeat the oil in a pan, fry the sliced onion until golden brown, then add the tonkatsu (see recipe here), placing it in the middle of the pan. Mix the dashi, soy, mirin and sugar together and tip three-quarters of the mixture around the tonkatsu. Sizzle for a couple of mins so the sauce thickens a little and the tonkatsu reheats.\r\n\r\nSTEP 2\r\nTip the beaten eggs around the tonkatsu and cook for 2-3 mins until the egg is cooked through but still a little runny. Divide the rice between two bowls, then top each with half the egg and tonkatsu mix, sprinkle over the chives and serve immediately, drizzling with a little more soy if you want an extra umami kick.	Katsudon is a popular Japanese dish consisting of a bowl of rice topped with a deep-fried pork cutlet, egg, and onions cooked in a sweet and savory sauce.	15	https://ftp.goit.study/img/so-yummy/preview/Japanese%20Katsudon.jpg	2025-07-09 17:36:38.222+00	2025-07-09 17:36:38.222+00
37	Keleya Zaara	2	18	3	Heat the vegetable oil in a large frying pan over medium-high heat. Add the lamb and cook until browned on all sides, about 5 minutes. Season with saffron, salt and pepper to taste; stir in all but 4 tablespoons of the onion, and pour in the water. Bring to the boil, then cover, reduce heat to medium-low, and simmer until the lamb is tender, about 15 minutes.\r\nUncover the pan, stir in the butter and allow the sauce reduce 5 to 10 minutes to desired consistency. Season to taste with salt and pepper, then pour into a serving dish. Sprinkle with the remaining chopped onions and parsley. Garnish with lemon wedges to serve.\r\n	A Nigerian dish of spinach stew with beef, smoked fish, and aromatic spices. Served with fufu or rice for a satisfying and nourishing meal.	30	https://ftp.goit.study/img/so-yummy/preview/Keleya%20Zaara.jpg	2025-07-09 17:36:38.235+00	2025-07-09 17:36:38.235+00
38	Split Pea Soup	13	16	3	Put the gammon in a very large pan with 2 litres water and bring to the boil. Remove from the heat and drain off the water – this helps to get rid of some of the saltiness. Recover with 2 litres cold water and bring to the boil again. Put everything but the frozen peas into the pan and bring to the boil. Reduce to a simmer and cook for 1½-2½ hrs, topping up the water as and when you need to, to a similar level it started at. As the ham cooks and softens, you can halve it if you want, so it is all submerged under the liquid. When the ham is tender enough to pull into shreds, it is ready.\r\nLift out the ham, peel off and discard the skin. While it is still hot (wear a clean pair of rubber gloves), shred the meat. Remove bay from the soup and stir in the frozen peas. Simmer for 1 min, then blend until smooth. Add a splash of water if too thick, and return to the pan to heat through if it has cooled, or if you are making ahead.\r\nWhen you are ready to serve, mix the hot soup with most of the ham – gently reheat if made ahead. Serve in bowls with the remaining ham scattered on top, and eat with crusty bread and butter.	A classic French soup made with split peas, vegetables, and ham hock, simmered until tender and flavorful.	150	https://ftp.goit.study/img/so-yummy/preview/Split%20Pea%20Soup.jpg	2025-07-09 17:36:38.245+00	2025-07-09 17:36:38.245+00
39	Saltfish and Ackee	1	24	3	For the saltfish, soak the salt cod overnight, changing the water a couple of times.\r\nDrain, then put the cod in a large pan of fresh water and bring to the boil. Drain again, add fresh water and bring to the boil again.\r\nSimmer for about five minutes, or until cooked through, then drain and flake the fish into large pieces. Discard any skin or bones.\r\nFor the dumplings, mix the flour and suet with a pinch of salt and 250ml/9fl oz water to make a dough.\r\nWrap the mixture in clingfilm and leave in the fridge to rest.\r\nOpen the can of ackee, drain and rinse, then set aside.\r\nHeat a tablespoon of olive oil in a pan and fry the onion until softened but not brown.\r\nAdd the spices, seasoning, pepper sauce and sliced peppers and continue to fry until the peppers are tender.\r\nAdd the chopped tomatoes, then the salt cod and mix together. Lastly stir in the ackee very gently and leave to simmer until ready to serve.\r\nWhen you’re almost ready to eat, heat about 1cm/½in vegetable oil in a frying pan and heat until just smoking.\r\nShape the dumpling mix into plum-size balls and shallow-fry until golden-brown. (CAUTION: hot oil can be dangerous. Do not leave the pan unattended.)\r\nDrain the dumplings on kitchen paper and serve with the saltfish and ackee.	A traditional Jamaican dish made with salted codfish and ackee, a fruit native to West Africa. Often served with boiled green bananas or dumplings.	590	https://ftp.goit.study/img/so-yummy/preview/Saltfish%20and%20Ackee.jpg	2025-07-09 17:36:38.254+00	2025-07-09 17:36:38.254+00
40	Apple Frangipan Tart	6	7	3	Preheat the oven to 200C/180C Fan/Gas 6.\r\nPut the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.\r\nCream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.\r\nPeel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.\r\nBake for 20-25 minutes until golden-brown and set.\r\nRemove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.\r\nTransfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, crème fraiche or ice cream.	A delicious tart made with almond cream and fresh apples.	50	https://ftp.goit.study/img/so-yummy/preview/Apple%20Frangipan%20Tart.jpg	2025-07-09 17:36:38.272+00	2025-07-09 17:36:38.272+00
41	Chicken Handi	4	10	3	Take a large pot or wok, big enough to cook all the chicken, and heat the oil in it. Once the oil is hot, add sliced onion and fry them until deep golden brown. Then take them out on a plate and set aside.\r\nTo the same pot, add the chopped garlic and sauté for a minute. Then add the chopped tomatoes and cook until tomatoes turn soft. This would take about 5 minutes.\r\nThen return the fried onion to the pot and stir. Add ginger paste and sauté well.\r\nNow add the cumin seeds, half of the coriander seeds and chopped green chillies. Give them a quick stir.\r\nNext goes in the spices – turmeric powder and red chilli powder. Sauté the spices well for couple of minutes.\r\nAdd the chicken pieces to the wok, season it with salt to taste and cook the chicken covered on medium-low heat until the chicken is almost cooked through. This would take about 15 minutes. Slowly sautéing the chicken will enhance the flavor, so do not expedite this step by putting it on high heat.\r\nWhen the oil separates from the spices, add the beaten yogurt keeping the heat on lowest so that the yogurt doesn’t split. Sprinkle the remaining coriander seeds and add half of the dried fenugreek leaves. Mix well.\r\nFinally add the cream and give a final mix to combine everything well.\r\nSprinkle the remaining kasuri methi and garam masala and serve the chicken handi hot with naan or rotis. Enjoy!	A spicy and flavorful Indian curry made with bone-in chicken pieces.	45	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Handi.jpg	2025-07-09 17:36:38.282+00	2025-07-09 17:36:38.282+00
42	Peanut Butter Cheesecake	6	11	3	Oil and line a 20cm round loose- bottomed cake tin with cling film, making it as smooth as possible. Melt the butter in a pan. Crush the biscuits by bashing them in a bag with a rolling pin, then stir them into the butter until very well coated. Press the mixture firmly into the base of the tin and chill.\r\nSoak the gelatine in water while you make the filling. Tip the ricotta into a bowl, then beat in the peanut butter and syrup. Ricotta has a slightly grainy texture so blitz until smooth with a stick blender for a smoother texture if you prefer.\r\nTake the soaked gelatine from the water and squeeze dry. Put it into a pan with the milk and heat very gently until the gelatine dissolves. Beat into the peanut mixture, then tip onto the biscuit base. Chill until set.\r\nTo freeze, leave in the tin and as soon as it is solid, cover the surface with cling film, then wrap the tin with cling film and foil.\r\nTo defrost, thaw in the fridge overnight.\r\nTo serve, carefully remove from the tin. Whisk the cream with the sugar until it holds its shape, then spread on top of the cheesecake and scatter with the peanut brittle.	A decadent cheesecake made with creamy peanut butter and a chocolate cookie crust.	30	https://ftp.goit.study/img/so-yummy/preview/Peanut%20Butter%20Cheesecake.jpg	2025-07-09 17:36:38.304+00	2025-07-09 17:36:38.304+00
43	Braised Beef Chilli	5	12	3	Preheat the oven to 120C/225F/gas mark 1.\r\n\r\nTake the meat out of the fridge to de-chill. Pulse the onions and garlic in a food processor until finely chopped. Heat 2 tbsp olive oil in a large casserole and sear the meat on all sides until golden.\r\n\r\nSet to one side and add another small slug of oil to brown the chorizo. Remove and add the onion and garlic, spices, herbs and chillies then cook until soft in the chorizo oil. Season with salt and pepper and add the vinegar, tomatoes, ketchup and sugar.\r\n\r\nPut all the meat back into the pot with 400ml water (or red wine if you prefer), bring up to a simmer and cook, covered, in the low oven.\r\n\r\nAfter 2 hours, check the meat and add the beans. Cook for a further hour and just before serving, pull the meat apart with a pair of forks.	A spicy chili made with braised beef, beans, and other ingredients. Perfect for game day or a cozy night in.	195	https://ftp.goit.study/img/so-yummy/preview/Braised%20Beef%20Chilli.jpg	2025-07-09 17:36:38.318+00	2025-07-09 17:36:38.318+00
44	Treacle Tart	6	7	3	First make the short crust pastry: measure the flour into a large bowl and rub in the butter with your fingertips until the mixture resembles fine breadcrumbs (alternatively, this can be done in a food processor). Add about three tablespoons of cold water and mix to a firm dough, wrap in cling film and chill in the fridge for about 20 minutes.\r\nPreheat the oven to 200C/400F/Gas 6 and put a heavy baking tray in the oven to heat up. Grease a deep 18cm/7in loose-bottomed fluted flan tin with butter.\r\nRemove about 150g/5½oz of pastry from the main ball and set aside for the lattice top.\r\nRoll the rest of the pastry out thinly on a lightly floured work surface and line the prepared flan tin with the pastry.\r\nPrick the base with a fork, to stop the base rising up during baking.\r\nPlace the reserved pastry for the lattice top on cling film and roll out thinly. Egg wash the pastry and set aside to chill in the fridge (the cling film makes it easier to move about). Do not cut into strips at this stage. Do not egg wash the strips once they are on the tart as it will drip into the treacle mixture.\r\nTo make the filling, heat the syrup gently in a large pan but do not boil.\r\nOnce melted, add the breadcrumbs, lemon juice and zest to the syrup. (You can add less lemon if you would prefer less citrus taste.) If the mixture looks runny, add a few more breadcrumbs.\r\nPour the syrup mixture into the lined tin and level the surface.\r\nRemove the reserved pastry from the fridge and cut into long strips, 1cm/½in wide. Make sure they are all longer than the edges of the tart tin.\r\nEgg wash the edge of the pastry in the tin, and start to make the woven laying lattice pattern over the mixture, leave the strips hanging over the edge of the tin.\r\nOnce the lattice is in place, use the tin edge to cut off the strips by pressing down with your hands, creating a neat finish.\r\nBake on the pre-heated baking tray in the hot oven for about 10 minutes until the pastry has started to colour, and then reduce the oven temperature to 180C/350F/Gas 4. If at this stage the lattice seems to be getting too dark brown, cover the tart with tin foil.\r\nBake for a further 25-30 minutes until the pastry is golden-brown and the filling set.\r\nRemove the tart from the oven and leave to firm up in the tin. Serve warm or cold.	A sweet and sticky tart made with golden syrup and breadcrumbs, often served with ice cream.	60	https://ftp.goit.study/img/so-yummy/preview/Treacle%20Tart.jpg	2025-07-09 17:36:38.336+00	2025-07-09 17:36:38.336+00
45	Chelsea Buns	6	7	3	Sift the flour and salt into a large bowl. Make a well in the middle and add the yeast.\r\nMeanwhile, warm the milk and butter in a saucepan until the butter melts and the mixture is lukewarm.\r\nAdd the milk mixture and egg to the flour mixture and stir until the contents of the bowl come together as a soft dough. (You may need to add a little extra flour.)\r\nTip the dough onto a generously floured work surface. Knead for five minutes, adding more flour if necessary, until the dough is smooth and elastic and no longer feels sticky.\r\nLightly oil a bowl with a little of the vegetable oil. Place the dough into the bowl and turn until it is covered in the oil. Cover the bowl with cling film and set aside in a warm place for one hour, or until the dough has doubled in size.\r\nLightly grease a baking tray.\r\nFor the filling, knock the dough back to its original size and turn out onto a lightly floured work surface. Roll the dough out into a rectangle 0.5cm/¼in thick. Brush all over with the melted butter, then sprinkle over the brown sugar, cinnamon and dried fruit.\r\nRoll the dough up into a tight cylinder , cut ten 4cm/1½in slice and place them onto a lightly greased baking sheet, leaving a little space between each slice. Cover with a tea towel and set aside to rise for 30 minutes.\r\nPreheat oven to 190C/375F/Gas 5.\r\nBake the buns in the oven for 20-25 minutes, or until risen and golden-brown.\r\nMeanwhile, for the glaze, heat the milk and sugar in a saucepan until boiling. Reduce the heat and simmer for 2-3 minutes.\r\nRemove the buns from the oven and brush with the glaze, then set aside to cool on a wire rack.	A sweet bun made with cinnamon, sugar, and dried fruits like raisins or currants. It is a popular snack in the United Kingdom and is often served with tea or coffee.	115	https://ftp.goit.study/img/so-yummy/preview/Chelsea%20Buns.jpg	2025-07-09 17:36:38.345+00	2025-07-09 17:36:38.345+00
48	Rocky Road Fudge	6	11	3	Line an 8-inch-square baking pan with wax paper or foil, and coat with non-stick spray.\r\nPour ½ cup of the miniature marshmallows into the bottom of the lined baking dish.\r\nIn a microwave-safe bowl, combine the chocolate chips and peanut butter. Microwave the chocolate mixture in 20-second intervals, stirring in between each interval, until the chocolate is melted.\r\nAdd the vanilla extract and stir well, until smooth.\r\nReserve 2 tablespoons of the chopped almonds or peanuts, and set aside.\r\nFold 1 ½ cups of the miniature marshmallows and the remaining chopped nuts into the chocolate mixture.\r\nTransfer the chocolate mixture into the prepared pan and spread into an even layer. Immediately top with the reserved chopped nuts and the mallow bits or additional miniature marshmallows, if using.\r\nRefrigerate for 4 hours, or until set.\r\nRemove the fudge and wax paper from the pan. Carefully peel all of wax paper from the fudge.\r\nCut the fudge into bite-sized pieces and serve.	A rich and indulgent chocolate fudge filled with nuts and marshmallows.	340	https://ftp.goit.study/img/so-yummy/preview/Rocky%20Road%20Fudge.jpg	2025-07-09 17:36:38.382+00	2025-07-09 17:36:38.382+00
49	Bean & Sausage Hotpot	10	7	3	In a large casserole, fry the sausages until brown all over – about 10 mins.\r\n\r\nAdd the tomato sauce, stirring well, then stir in the beans, treacle or sugar and mustard. Bring to the simmer, cover and cook for 30 mins. Great served with crusty bread or rice.	A hearty stew made with sausage, beans, and other ingredients. A satisfying meal for any time of day.	40	https://ftp.goit.study/img/so-yummy/preview/Bean%20_%20Sausage%20Hotpot.jpg	2025-07-09 17:36:38.391+00	2025-07-09 17:36:38.391+00
50	Cashew Ghoriba Biscuits	6	18	3	Preheat the oven at 180 C / Gas 4. Line a baking tray with greaseproof paper.\r\nIn a bowl, mix the cashews and icing sugar. Add the egg yolks and orange blossom water and mix to a smooth homogeneous paste.\r\nTake lumps of the cashew paste and shape into small balls. Roll the balls in icing sugar and transfer to the baking tray. Push an almond in the centre of each ghribia.\r\nBake until the biscuits are lightly golden, about 20 minutes. Keep an eye on them, they burn quickly.	A traditional Moroccan cookie made with ground cashews, sugar, and spices, and dusted with powdered sugar.	20	https://ftp.goit.study/img/so-yummy/preview/Cashew%20Ghoriba%20Biscuits.jpg	2025-07-09 17:36:38.398+00	2025-07-09 17:36:38.398+00
51	Ham hock colcannon	8	6	3	STEP 1\r\nPeel and cut the potatoes into even, medium-sized chunks. Put in a large pan filled with cold salted water, bring to the boil and cook for 10-15 mins until a knife can be inserted into the potatoes easily.\r\n\r\nSTEP 2\r\nMeanwhile, melt the butter in a large sauté pan over a medium heat. Add the garlic, cabbage, spring onions and some seasoning. Stir occasionally until the cabbage is wilted but still retains a little bite, then set aside.\r\n\r\nSTEP 3\r\nDrain the potatoes, leave to steam-dry for a couple of mins, then mash with the cream, mustard and seasoning in the same saucepan. Stir in the cabbage and ham hock. Keep warm over a low heat.\r\n\r\nSTEP 4\r\nReheat the pan you used to cook the cabbage (no need to wash first), add a splash of oil, crack in the eggs and fry to your liking. To serve, divide the colcannon between bowls and top each with a fried egg.	Ham hock colcannon is a traditional Irish dish made with mashed potatoes and cabbage, mixed with shredded ham hock for a savory flavor and creamy texture.	30	https://ftp.goit.study/img/so-yummy/preview/Ham%20hock%20colcannon.jpg	2025-07-09 17:36:38.405+00	2025-07-09 17:36:38.405+00
52	Koshari	9	23	3	Cook the lentils. Bring lentils and 4 cups of water to a boil in a medium pot or saucepan over high heat. Reduce the heat to low and cook until lentils are just tender (15-17 minutes). Drain from water and season with a little salt. (Note: when the lentils are ready, they should not be fully cooked. They should be only par-cooked and still have a bite to them as they need to finish cooking with the rice).\r\nNow, for the rice. Drain the rice from its soaking water. Combine the par-cooked lentils and the rice in the saucepan over medium-high heat with 1 tbsp cooking oil, salt, pepper, and coriander. Cook for 3 minutes, stirring regularly. Add warm water to cover the rice and lentil mixture by about 1 1/2 inches (you’ll probably use about 3 cups of water here). Bring to a boil; the water should reduce a bit. Now cover and cook until all the liquid has been absorbed and both the rice and lentils are well cooked through (about 20 minutes).  Keep covered and undisturbed for 5 minutes or so.\r\nNow make the pasta. While the rice and lentils are cooking, make the pasta according to package instructions by adding the elbow pasta to boiling water with a dash of salt and a little oil. Cook until the pasta is al dente. Drain.\r\nCover the chickpeas and warm in the microwave briefly before serving.\r\n\r\nMake the crispy onion topping. \r\n\r\nSprinkle the onion rings with salt, then toss them in the flour to coat. Shake off excess flour.\r\nIn a large skillet, heat the cooking oil over medium-high heat, cook the onion rings, stirring often, until they turn a nice caramelized brown. Onions must be crispy, but not burned (15-20 minutes).	A popular Egyptian street food, Koshari is a hearty vegetarian dish made from rice, lentils, chickpeas, pasta, and a spicy tomato sauce, topped with fried onions and garlic.	50	https://ftp.goit.study/img/so-yummy/preview/Koshari.jpg	2025-07-09 17:36:38.415+00	2025-07-09 17:36:38.415+00
53	Leblebi Soup	9	18	3	Heat the oil in a large pot. Add the onion and cook until translucent.\r\nDrain the soaked chickpeas and add them to the pot together with the vegetable stock. Bring to the boil, then reduce the heat and cover. Simmer for 30 minutes.\r\nIn the meantime toast the cumin in a small ungreased frying pan, then grind them in a mortar. Add the garlic and salt and pound to a fine paste.\r\nAdd the paste and the harissa to the soup and simmer until the chickpeas are tender, about 30 minutes.\r\nSeason to taste with salt, pepper and lemon juice and serve hot.	A hearty Tunisian soup made with chickpeas, tomatoes, garlic, and spices, often served with crusty bread.	60	https://ftp.goit.study/img/so-yummy/preview/Leblebi%20Soup.jpg	2025-07-09 17:36:38.427+00	2025-07-09 17:36:38.427+00
54	Budino Di Ricotta	6	2	3	Mash the ricotta and beat well with the egg yolks, stir in the flour, sugar, cinnamon, grated lemon rind and the rum and mix well. You can do this in a food processor. Beat the egg whites until stiff, fold in and pour into a buttered and floured 25cm cake tin. Bake in the oven at 180ºC/160ºC fan/gas 4 for about 40 minutes, or until it is firm.\r\n\r\nServe hot or cold dusted with icing sugar.	A creamy and indulgent Italian dessert made with ricotta cheese, sugar, and vanilla. Serve it chilled with fresh berries for a perfect ending to any meal.	40	https://ftp.goit.study/img/so-yummy/preview/Budino%20Di%20Ricotta.jpg	2025-07-09 17:36:38.439+00	2025-07-09 17:36:38.439+00
175	Chakchouka	10	18	3	In a large cast iron skillet or sauté pan with a lid, heat oil over medium high heat. Add the onion and sauté for 2-3 minutes, until softened. Add the peppers and garlic, and sauté for an additional 3-5 minutes. Add the tomatoes, cumin, paprika, salt, and chili powder. Mix well and bring the mixture to a simmer. Reduce the heat to medium low and continue to simmer, uncovered, 10-15 minutes until the mixture has thickened to your desired consistency. (Taste the sauce at this point and adjust for salt and spice, as desired.) Using the back of a spoon, make four craters in the mixture, large enough to hold an egg. Crack one egg into each of the craters. Cover the skillet and simmer for 5-7 minutes, until the eggs have set. Serve immediately with crusty bread or pita.		30	https://ftp.goit.study/img/so-yummy/preview/Chakchouka.jpg	2025-07-09 17:36:39.855+00	2025-07-09 17:36:39.855+00
55	Krispy Kreme Donut	6	11	3	Dissolve yeast in warm water in 2 1/2-quart bowl. Add milk, sugar, salt, eggs, shortening and 2 cups flour. Beat on low for 30 seconds, scraping bowl constantly. Beat on medium speed for 2 minutes, scraping bowl occasionally. Stir in remaining flour until smooth. Cover and let rise until double, 50-60 minutes. (Dough is ready when indentation remains when touched.) Turn dough onto floured surface; roll around lightly to coat with flour. Gently roll dough 1/2-inch thick with floured rolling pin. Cut with floured doughnut cutter. Cover and let rise until double, 30-40 minutes.\r\nHeat vegetable oil in deep fryer to 350°. Slide doughnuts into hot oil with wide spatula. Turn doughnuts as they rise to the surface. Fry until golden brown, about 1 minute on each side. Remove carefully from oil (do not prick surface); drain. Dip the doughnuts into creamy glaze set on rack.\r\n\r\n\r\nGlaze: \r\nHeat butter until melted. Remove from heat. Stir in powdered sugar and vanilla until smooth. Stir in water, 1 tablespoon at a time, until desired consistency.	A melt-in-your-mouth glazed doughnut, made with a light and fluffy yeast dough, freshly fried and topped with a sweet, sticky glaze, perfect for breakfast or dessert.	100	https://ftp.goit.study/img/so-yummy/preview/Krispy%20Kreme%20Donut.jpg	2025-07-09 17:36:38.448+00	2025-07-09 17:36:38.448+00
56	Shakshuka	9	23	3	Heat the oil in a frying pan that has a lid, then soften the onions, chilli, garlic and coriander stalks for 5 mins until soft. Stir in the tomatoes and sugar, then bubble for 8-10 mins until thick. Can be frozen for 1 month.\r\n\r\nUsing the back of a large spoon, make 4 dips in the sauce, then crack an egg into each one. Put a lid on the pan, then cook over a low heat for 6-8 mins, until the eggs are done to your liking. Scatter with the coriander leaves and serve with crusty bread.	A popular Middle Eastern dish with eggs poached in a spicy tomato sauce, with onions, bell peppers, and spices. Serve with crusty bread for a hearty and delicious meal.	25	https://ftp.goit.study/img/so-yummy/preview/Shakshuka.jpg	2025-07-09 17:36:38.464+00	2025-07-09 17:36:38.464+00
57	Salmon Avocado Salad	1	7	3	Season the salmon, then rub with oil. Mix the dressing ingredients together. Halve, stone, peel and slice the avocados. Halve and quarter the cucumber lengthways, then cut into slices. Divide salad, avocado and cucumber between four plates, then drizzle with half the dressing.\r\n\r\nHeat a non-stick pan. Add the salmon and fry for 3-4 mins on each side until crisp but still moist inside. Put a salmon fillet on top of each salad and drizzle over the remaining dressing. Serve warm.	A healthy and refreshing salad with pan-seared salmon, ripe avocado, cherry tomatoes, and a zesty lemon vinaigrette. Great for a light lunch or dinner.	8	https://ftp.goit.study/img/so-yummy/preview/Salmon%20Avocado%20Salad.jpg	2025-07-09 17:36:38.472+00	2025-07-09 17:36:38.472+00
58	Ribollita	9	2	3	Put 2 tablespoons of the oil in a large pot over medium heat. When it’s hot, add onion, carrot, celery and garlic; sprinkle with salt and pepper and cook, stirring occasionally, until vegetables are soft, 5 to 10 minutes.\r\nHeat the oven to 500 degrees. Drain the beans; if they’re canned, rinse them as well. Add them to the pot along with tomatoes and their juices and stock, rosemary and thyme. Bring to a boil, then reduce heat so the soup bubbles steadily; cover and cook, stirring once or twice to break up the tomatoes, until the flavors meld, 15 to 20 minutes.\r\nFish out and discard rosemary and thyme stems, if you like, and stir in kale. Taste and adjust seasoning. Lay bread slices on top of the stew so they cover the top and overlap as little as possible. Scatter red onion slices over the top, drizzle with the remaining 3 tablespoons oil and sprinkle with Parmesan.\r\nPut the pot in the oven and bake until the bread, onions and cheese are browned and crisp, 10 to 15 minutes. (If your pot fits under the broiler, you can also brown the top there.) Divide the soup and bread among 4 bowls and serve.	A Tuscan soup made with vegetables, bread, and beans, often served as a hearty main dish.	55	https://ftp.goit.study/img/so-yummy/preview/Ribollita.jpg	2025-07-09 17:36:38.483+00	2025-07-09 17:36:38.483+00
59	Dal fry	9	10	3	Wash and soak toor dal in approx. 3 cups of water, for at least one hours. Dal will be double in volume after soaking. Drain the water.\r\nCook dal with 2-1/2 cups water and add salt, turmeric, on medium high heat, until soft in texture (approximately 30 mins) it should be like thick soup.\r\nIn a frying pan, heat the ghee. Add cumin seeds, and mustard seeds. After the seeds crack, add bay leaves, green chili, ginger and chili powder. Stir for a few seconds.\r\nAdd tomatoes, salt and sugar stir and cook until tomatoes are tender and mushy.\r\nAdd cilantro and garam masala cook for about one minute.\r\nPour the seasoning over dal mix it well and cook for another minute.\r\nServe with Naan.	A popular Indian dish made with lentils, spices, and herbs.	90	https://ftp.goit.study/img/so-yummy/preview/Dal%20fry.jpg	2025-07-09 17:36:38.498+00	2025-07-09 17:36:38.498+00
60	Vegan Chocolate Cake	7	11	3	Simply mix all dry ingredients with wet ingredients and blend altogether. Bake for 45 min on 180 degrees. Decorate with some melted vegan chocolate 	Chocolate cake made without animal products	45	https://ftp.goit.study/img/so-yummy/preview/Vegan%20Chocolate%20Cake.jpg	2025-07-09 17:36:38.51+00	2025-07-09 17:36:38.51+00
61	Flamiche	9	9	3	For the pastry, sift the flour and salt into the bowl of a food processor, add the butter and lard, then whizz together briefly until the mixture looks like fine breadcrumbs. Tip the mixture into a bowl, then stir in the cheese and enough of the water for the mixture to come together. Tip out onto a lightly floured surface and knead briefly until smooth. Roll out thinly and line a 23cm x 4cm loose-?bottomed fluted flan tin. Prick the base with a fork. Chill for 20 minutes.\r\n02.Melt the 75g butter in a saucepan over a low heat, then add the leeks and the salt. Cover and cook for ?10 minutes until soft. Uncover the pan, increase the heat and cook ?for 2 minutes, stirring occasionally, until the liquid has evaporated. Spoon onto a plate and leave to cool.\r\n03.Preheat the oven to 200°C/fan180°C/gas 6. Line the pastry case with baking paper and baking beans or rice and blind bake for 15-20 minutes until the edges are biscuit-coloured. Remove the paper and beans/rice and return the case to the oven for 7-10 minutes until the base is crisp and lightly golden. Remove and set aside. Reduce the oven temperature to 190°C/fan170°C/gas 5.\r\n04.Put the crème fraîche into a bowl with the whole egg, egg yolks and nutmeg. Lightly beat together, then season. Stir in the leeks. Spoon ?the mixture into the tart case and bake for 35-40 minutes until set ?and lightly golden. Remove from ?the oven and leave for 10 minutes. Take out of the tin and serve.	A savory tart made with leeks, cream, and cheese. It is a popular dish in French cuisine and is often served as a main course or appetizer.	57	https://ftp.goit.study/img/so-yummy/preview/Flamiche.jpg	2025-07-09 17:36:38.522+00	2025-07-09 17:36:38.522+00
220	Chivito uruguayo	5	4	3	Crush the meat so that it is finite and we put it on a griddle to brown. Put the eggs, bacon and ham to fry.\r\nCut the bread in half, put the beef brisket, the fried eggs, the bacon, the ham, the mozzarella, the tomato and the lettuce. Cover with the other half of the bread and serve.	Chivito uruguayo is a hearty and flavorful sandwich made with beef, bacon, ham, cheese, lettuce, tomato, and mayonnaise, served on a crusty roll. It's a popular street food in Uruguay and a must-try for meat lovers.	30	https://ftp.goit.study/img/so-yummy/preview/Chivito%20uruguayo.jpg	2025-07-09 17:36:40.308+00	2025-07-09 17:36:40.308+00
62	Beef Wellington	5	7	3	Put the mushrooms into a food processor with some seasoning and pulse to a rough paste. Scrape the paste into a pan and cook over a high heat for about 10 mins, tossing frequently, to cook out the moisture from the mushrooms. Spread out on a plate to cool.\r\nHeat in a frying pan and add a little olive oil. Season the beef and sear in the hot pan for 30 secs only on each side. (You don't want to cook it at this stage, just colour it). Remove the beef from the pan and leave to cool, then brush all over with the mustard.\r\nLay a sheet of cling film on a work surface and arrange the Parma ham slices on it, in slightly overlapping rows. With a palette knife, spread the mushroom paste over the ham, then place the seared beef fillet in the middle. Keeping a tight hold of the cling film from the edge, neatly roll the Parma ham and mushrooms around the beef to form a tight barrel shape. Twist the ends of the cling film to secure. Chill for 15-20 mins to allow the beef to set and keep its shape.\r\nRoll out the puff pastry on a floured surface to a large rectangle, the thickness of a £1 coin. Remove the cling film from the beef, then lay in the centre. Brush the surrounding pastry with egg yolk. Fold the ends over, the wrap the pastry around the beef, cutting off any excess. Turn over, so the seam is underneath, and place on a baking sheet. Brush over all the pastry with egg and chill for about 15 mins to let the pastry rest.\r\nHeat the oven to 200C, 400F, gas 6.\r\nLightly score the pastry at 1cm intervals and glaze again with beaten egg yolk. Bake for 20 minutes, then lower the oven setting to 180C, 350F, gas 4 and cook for another 15 mins. Allow to rest for 10-15 mins before slicing and serving with the side dishes of your choice. The beef should still be pink in the centre when you serve it.	A classic and elegant dish made with beef tenderloin and puff pastry.	90	https://ftp.goit.study/img/so-yummy/preview/Beef%20Wellington.jpg	2025-07-09 17:36:38.533+00	2025-07-09 17:36:38.533+00
63	Tuna Nicoise	1	9	3	Heat oven to 200C/fan 180C/gas 6. Toss the potatoes with 2 tsp oil and some seasoning. Tip onto a large baking tray, then roast for 20 mins, stirring halfway, until crisp, golden and cooked through.\r\nMeanwhile, put eggs in a small pan of water, bring to the boil, then simmer for 8-10 mins, depending on how you like them cooked. Plunge into a bowl of cold water to cool for a few mins. Peel away the shells, then cut into halves.\r\nIn a large salad bowl, whisk together the remaining oil, red wine vinegar, capers and chopped tomatoes. Season, tip in the onion, spinach, tuna and potatoes, then gently toss together. Top with the eggs, then serve straight away.	A classic French salad with tuna, potatoes, green beans, and boiled eggs, dressed with a vinaigrette.	30	https://ftp.goit.study/img/so-yummy/preview/Tuna%20Nicoise.jpg	2025-07-09 17:36:38.543+00	2025-07-09 17:36:38.543+00
64	Matar Paneer	9	10	3	Heat the oil in a frying pan over high heat until it’s shimmering hot. Add the paneer, then turn the heat down a little. Fry until it starts to brown at the edges, then turn it over and brown on each side – the paneer will brown faster than you think, so don’t walk away. Remove the paneer from the pan and drain on kitchen paper.\r\nPut the ginger, cumin, turmeric, ground coriander and chilli in the pan, and fry everything for 1 min. Add the tomatoes, mashing them with the back of a spoon and simmer everything for 5 mins until the sauce smells fragrant. Add a splash of water if it’s too thick. Season well. Add the peas and simmer for a further 2 mins, then stir in the paneer and sprinkle over the garam masala. Divide between two bowls, top with coriander leaves and serve with naan bread, roti or rice.	A popular Indian dish made with paneer (a type of cheese) and peas in a creamy tomato sauce.	25	https://ftp.goit.study/img/so-yummy/preview/Matar%20Paneer.jpg	2025-07-09 17:36:38.555+00	2025-07-09 17:36:38.555+00
65	Minced Beef Pie	5	7	3	Preheat the oven to 200C/400F/Gas 6.\r\nHeat the oil in a deep frying pan and fry the beef mince for 4-5 minutes, breaking it up with a wooden spoon as it browns.\r\nAdd the onion and cook for 2-3 minutes, then stir in the tomato purée and cook for 2-3 more minutes. Stir in the flour and cook for a further minute, then add the chopped mushrooms, the stout or beef stock and a couple of dashes of Worcestershire sauce. Bring to the boil, then reduce the heat, cover the pan with a lid and leave to simmer for 20 minutes. Set aside and leave to cool, then turn the meat mixture into a one litre pie dish.\r\nRoll out the pastry on a floured work surface until it is slightly larger than the pie dish. Gently drape the pastry over the dish, pressing firmly onto the edges. Trim, then shape the edges into a fluted shape.\r\nCut some leaf shapes out of the pastry trimmings and decorate the top of the pie, sticking them to the pastry with the beaten egg yolk.\r\nMake three or four slits in the pastry to allow the steam to escape, then brush the pie with the rest of the beaten egg yolk and bake in the oven for 20-25 minutes, or until golden-brown.\r\nTo serve, slice into wedges.	A simple yet satisfying pie filled with minced beef and gravy.	70	https://ftp.goit.study/img/so-yummy/preview/Minced%20Beef%20Pie.jpg	2025-07-09 17:36:38.566+00	2025-07-09 17:36:38.566+00
66	Home-made Mandazi	12	26	3	This is one recipe a lot of people have requested and I have tried to make it as simple as possible and I hope it will work for you. Make sure you use the right flour which is basically one with raising agents. Adjust the amount of sugar to your taste and try using different flavours to have variety whenever you have them.\r\nYou can use Coconut milk instead of regular milk, you can also add desiccated coconut to the dry flour or other spices like powdered cloves or cinnamon.\r\nFor “healthy looking” mandazis do not roll the dough too thin before frying and use the procedure I have indicated above.\r\n\r\n1. Mix the flour,cinnamon and sugar in a suitable bowl.\r\n2. In a separate bowl whisk the egg into the milk\r\n3. Make a well at the centre of the flour and add the milk and egg mixture and slowly mix to form a dough.\r\n4. Knead the dough for 3-4 minutes or until it stops sticking to the sides of the bowl and you have a smooth surface.\r\n5. Cover the dough with a damp cloth  and allow to rest for 15 minutes.\r\n6. Roll the dough on a lightly floured surface into a 1cm thick piece.\r\n7. Using a sharp small knife, cut the dough into the desired size setting aside ready for deep frying.\r\n8. Heat your oil in a suitable pot and gently dip the mandazi pieces to cook until light brown on the first side then turn to cook on the second side.\r\n9. Serve them warm or cold	A popular East African snack made with flour, coconut milk, sugar, and spices, fried until golden brown.	55	https://ftp.goit.study/img/so-yummy/preview/Home-made%20Mandazi.jpg	2025-07-09 17:36:38.575+00	2025-07-09 17:36:38.575+00
74	Parkin Cake	6	7	3	Heat oven to 160C/140C fan/gas 3. Grease a deep 22cm/9in square cake tin and line with baking parchment. Beat the egg and milk together with a fork.\r\n\r\nGently melt the syrup, treacle, sugar and butter together in a large pan until the sugar has dissolved. Remove from the heat. Mix together the oatmeal, flour and ginger and stir into the syrup mixture, followed by the egg and milk.\r\n\r\nPour the mixture into the tin and bake for 50 mins - 1 hr until the cake feels firm and a little crusty on top. Cool in the tin then wrap in more parchment and foil and keep for 3-5 days before eating if you can – it’ll become softer and stickier the longer you leave it, up to 2 weeks.\r\n	A gingerbread cake made with oatmeal and black treacle. It is a traditional cake from Northern England and is often served during Bonfire Night celebrations.	60	https://ftp.goit.study/img/so-yummy/preview/Parkin%20Cake.jpg	2025-07-09 17:36:38.661+00	2025-07-09 17:36:38.661+00
67	Brown Stew Chicken	4	24	3	Squeeze lime over chicken and rub well. Drain off excess lime juice.\r\nCombine tomato, scallion, onion, garlic, pepper, thyme, pimento and soy sauce in a large bowl with the chicken pieces. Cover and marinate at least one hour.\r\nHeat oil in a dutch pot or large saucepan. Shake off the seasonings as you remove each piece of chicken from the marinade. Reserve the marinade for sauce.\r\nLightly brown the chicken a few pieces at a time in very hot oil. Place browned chicken pieces on a plate to rest while you brown the remaining pieces.\r\nDrain off excess oil and return the chicken to the pan. Pour the marinade over the chicken and add the carrots. Stir and cook over medium heat for 10 minutes.\r\nMix flour and coconut milk and add to stew, stirring constantly. Turn heat down to minimum and cook another 20 minutes or until tender.	A classic Caribbean dish featuring tender chicken pieces, slow-cooked with flavorful herbs and spices in a rich, brown gravy, served with rice and peas.	90	https://ftp.goit.study/img/so-yummy/preview/Brown%20Stew%20Chicken.jpg	2025-07-09 17:36:38.583+00	2025-07-09 17:36:38.583+00
68	Vegetable Shepherd's Pie	5	6	3	Add Ingredients:\r\n\r\n12 cups chopped mixed vegetables\r\n1   cup chopped fresh mushrooms \r\n1   cup pearl onions\r\n\r\nTOPPING:\r\n\r\nPreheat oven to 450°. Bake potatoes on a foil-lined baking sheet until tender, about 45 minutes. Let cool slightly, then peel. Press potatoes through a ricer, food mill, or colander into a large bowl. Add butter; stir until well blended. Stir in milk. Season to taste with salt.\r\n\r\nFILLING:\r\n\r\nSoak dried porcini in 3 cups hot water; set aside. Combine lentils, 1 garlic clove, 1 tsp. salt, and 4 cups water in a medium saucepan. Bring to a boil; reduce heat and simmer, stirring occasionally, until lentils are tender but not mushy, 15–20 minutes. Drain lentils and discard garlic.\r\n\r\nHeat 3 Tbsp. oil in a large heavy pot over medium heat. Add onions and cook, stirring occasionally, until soft, about 12 minutes. Add chopped garlic and cook for 1 minute. Stir in tomato paste. Cook, stirring constantly, until tomato paste is caramelized, 2–3 minutes.\r\n\r\nAdd bay leaves and wine; stir, scraping up any browned bits. Stir in porcini, slowly pouring porcini soaking liquid into pan but leaving any sediment behind. Bring to a simmer and cook until liquid is reduced by half, about 10 minutes. Stir in broth and cook, stirring occasionally, until reduced by half, about 45 minutes.\r\n\r\nStrain mixture into a large saucepan and bring to a boil; discard solids in strainer. Stir cornstarch and 2 Tbsp. water in a small bowl to dissolve. Add cornstarch mixture; simmer until thickened, about 5 minutes. Whisk in miso. Season sauce with salt and pepper. Set aside.\r\n\r\nPreheat oven to 450°. Toss vegetables and pearl onions with remaining 2 Tbsp. oil, 5 garlic cloves, and rosemary sprigs in a large bowl; season with salt and pepper. Divide between 2 rimmed baking sheets. Roast, stirring once, until tender, 20–25 minutes. Transfer garlic cloves to a small bowl; mash well with a fork and stir into sauce. Discard rosemary. DO AHEAD: Lentils, sauce, and vegetables can be made 1 day ahead. Cover separately; chill.\r\nArrange lentils in an even layer in a 3-qt. baking dish; set dish on a foil-lined rimmed baking sheet. Toss roasted vegetables with fresh mushrooms and chopped herbs; layer on top of lentils. Pour sauce over vegetables. Spoon potato mixture evenly over.\r\n\r\nBake until browned and bubbly, about 30 minutes. Let stand for 15 minutes before serving.	This vegetarian version of the classic shepherd's pie is made with a hearty mix of vegetables, such as mushrooms, carrots, and peas, topped with a layer of creamy mashed potatoes.	150	https://ftp.goit.study/img/so-yummy/preview/Vegetable%20Shepherd_s%20Pie.jpg	2025-07-09 17:36:38.595+00	2025-07-09 17:36:38.595+00
69	Japanese gohan rice	13	8	3	STEP 1\r\nRinsing and soaking your rice is key to achieving the perfect texture. Measure the rice into a bowl, cover with cold water, then use your fingers to massage the grains of rice – the water will become cloudy. Drain and rinse again with fresh water. Repeat five more times until the water stays clear.\r\n\r\nSTEP 2\r\nTip the rinsed rice into a saucepan with 400ml water, or 200ml dashi and 200ml water, bring to the boil, then turn down the heat to a low simmer, cover with a tight-fitting lid with a steam hole and cook for 15 mins. Remove from the heat and leave to sit for another 15 mins, then stir through the mirin. Remove the lid and give it a good stir. Serve with any or all of the optional toppings.	A staple in Japanese cuisine, Gohan rice is a short-grain, sticky rice that is commonly served alongside main dishes or used as a base for sushi.	30	https://ftp.goit.study/img/so-yummy/preview/Japanese%20gohan%20rice.jpg	2025-07-09 17:36:38.616+00	2025-07-09 17:36:38.616+00
70	Grilled Mac and Cheese Sandwich	11	11	3	Make the mac and cheese\r\n\r\n1. Bring a medium saucepan of generously salted water (you want it to taste like seawater) to a boil. Add the pasta and cook, stirring occasionally, until al dente, 8 to 10 minutes, or according to the package directions. The pasta should be tender but still chewy.\r\n2. While the pasta is cooking, in a small bowl, whisk together the flour, mustard powder, garlic powder, salt, black pepper, and cayenne pepper.\r\n3. Drain the pasta in a colander. Place the empty pasta pan (no need to wash it) over low heat and add the butter. When the butter has melted, whisk in the flour mixture and continue to cook, whisking frequently, until the mixture is beginning to brown and has a pleasant, nutty aroma, about 1 minute. Watch carefully so it does not scorch on the bottom of the pan.\r\n4. Slowly whisk the milk and cream into the flour mixture until everything is really well combined. Cook, whisking constantly, until the sauce is heated through and just begins to thicken, about 2 minutes. Remove from the heat. Gradually add the cheese while stirring constantly with a wooden spoon or silicone spatula and keep stirring until the cheese has melted into the sauce. Then stir in the drained cooked pasta.\r\n5. Line a 9-by-13-inch (23-by-33-centimeter) rimmed baking sheet with parchment paper or aluminum foil. Coat the paper or foil with nonstick cooking spray or slick it with butter. Pour the warm mac and cheese onto the prepared baking sheet and spread it evenly with a spatula. Coat another piece of parchment paper with cooking spray or butter and place it, oiled or buttered side down, directly on the surface of the mac and cheese. Refrigerate until cool and firm, about 1 hour.\r\n\r\nMake the grilled cheese\r\n6. Heat a large cast-iron or nonstick skillet over medium-low heat.\r\n7. In a small bowl, stir together the 4 tablespoons (55 grams) butter and garlic powder until well blended.\r\n8. Remove the mac and cheese from the refrigerator and peel off the top layer of parchment paper. Carefully cut into 8 equal pieces. Each piece will make 1 grilled mac and cheese sandwich. (You can stash each individual portion in a double layer of resealable plastic bags and refrigerate for up to 3 days or freeze it for up to 1 month.)\r\n9. Spread 3/4 teaspoon garlic butter on one side of each bread slice. Place half of the slices, buttered-side down, on a clean cutting board. Top each with one slice of Cheddar, then 1 piece of the mac and cheese. (Transfer from the baking sheet by scooting your hand or a spatula under each piece of mac and cheese and then flipping it over onto a sandwich.) Place 1 slice of Jack on top of each. Finish with the remaining bread slices, buttered-side up.\r\n10. Using a wide spatula, place as many sandwiches in the pan as will fit without crowding it. Cover and cook until the bottoms are nicely browned, about 4 minutes. Turn and cook until the second sides are browned, the cheese is melted, and the mac and cheese is heated through, about 4 minutes more.\r\n11. Repeat with the remaining ingredients. Cut the sandwiches in half, if desired, and serve.	Grilled sandwich with macaroni and cheese	75	https://ftp.goit.study/img/so-yummy/preview/Grilled%20Mac%20and%20Cheese%20Sandwich.jpg	2025-07-09 17:36:38.621+00	2025-07-09 17:36:38.621+00
71	Lamb and Potato pie	2	7	3	Dust the meat with flour to lightly coat.\r\nHeat enough vegetable oil in a large saucepan to fill the base, and fry the onion and meat until lightly browned. Season with salt and pepper.\r\nAdd the carrots, stock and more seasoning to taste.\r\nBring to the boil, cover and reduce the heat to a simmer. Simmer for at least an hour or until the meat is tender. Take your time cooking the meat, the longer you leave it to cook, the better the flavour will be.\r\nPreheat the oven to 180C/350F/Gas 4.\r\nAdd the drained potato cubes to the lamb.\r\nTurn the mixture into a pie dish or casserole and cover with the shortcrust pastry. Make three slits in the top of the pastry to release any steam while cooking.\r\nBrush with beaten egg and bake for about 40 minutes, until the pastry is golden brown.\r\nServe.	A delicious lamb pie with tender chunks of meat and chunks of potatoes.	100	https://ftp.goit.study/img/so-yummy/preview/Lamb%20and%20Potato%20pie.jpg	2025-07-09 17:36:38.634+00	2025-07-09 17:36:38.634+00
72	New York cheesecake	6	11	3	Position an oven shelf in the middle of the oven. Preheat the oven to fan 160C/conventional 180C/gas 4. Line the base of a 23cm springform cake tin with parchment paper. For the crust, melt the butter in a medium pan. Stir in the biscuit crumbs and sugar so the mixture is evenly moistened. Press the mixture into the bottom of the pan and bake for 10 minutes. Cool on a wire rack while preparing the filling.\r\nFor the filling, increase the oven temperature to fan 200C/conventional 240C/gas 9. In a table top mixer fitted with the paddle attachment, beat the soft cheese at medium-low speed until creamy, about 2 minutes. With the mixer on low, gradually add the sugar, then the flour and a pinch of salt, scraping down the sides of the bowl and the paddle twice.\r\nSwap the paddle attachment for the whisk. Continue by adding the vanilla, lemon zest and juice. Whisk in the eggs and yolk, one at a time, scraping the bowl and whisk at least twice. Stir the 284ml carton of soured cream until smooth, then measure 200ml/7fl oz (just over 3⁄4 of the carton). Continue on low speed as you add the measured soured cream (reserve the rest). Whisk to blend, but don't over-beat. The batter should be smooth, light and somewhat airy.\r\nBrush the sides of the springform tin with melted butter and put on a baking sheet. Pour in the filling - if there are any lumps, sink them using a knife - the top should be as smooth as possible. Bake for 10 minutes. Reduce oven temperature to fan 90C/conventional 110C/gas 1⁄4 and bake for 25 minutes more. If you gently shake the tin, the filling should have a slight wobble. Turn off the oven and open the oven door for a cheesecake that's creamy in the centre, or leave it closed if you prefer a drier texture. Let cool in the oven for 2 hours. The cheesecake may get a slight crack on top as it cools.\r\nCombine the reserved soured cream with the 142ml carton, the sugar and lemon juice for the topping. Spread over the cheesecake right to the edges. Cover loosely with foil and refrigerate for at least 8 hours or overnight.\r\nRun a round-bladed knife around the sides of the tin to loosen any stuck edges. Unlock the side, slide the cheesecake off the bottom of the tin onto a plate, then slide the parchment paper out from underneath.	A classic dessert made with cream cheese and a graham cracker crust, creamy and indulgent.	195	https://ftp.goit.study/img/so-yummy/preview/New%20York%20cheesecake.jpg	2025-07-09 17:36:38.647+00	2025-07-09 17:36:38.647+00
73	Christmas Pudding Flapjack	6	7	3	Preheat the oven to 180°C/fan 160°C/gas mark 4 and grease and line a 25cm x 20cm tin. Melt the butter, sugar, syrup and orange zest in a large saucepan over a medium heat. The aim is to dissolve all the ingredients so that they are smooth, but to not lose any volume through boiling so be careful not to overheat.\r\n\r\nAdd the oats and stir well until evenly coated. Stir through the leftover Christmas pudding and tip into the prepared tin. Use a spoon to flatten the top and bake for 40 minutes until the edges start to brown. Whilst still warm in the tin, score into 12 squares. Allow to cool completely before cutting along the scores.\r\n\r\nKeeps for 5 days in an air tight tin or freeze for up to 1 month.	A festive twist on a classic flapjack recipe, with added spices and dried fruit.	50	https://ftp.goit.study/img/so-yummy/preview/Christmas%20Pudding%20Flapjack.jpg	2025-07-09 17:36:38.655+00	2025-07-09 17:36:38.655+00
75	Stovetop Eggplant With Harissa, Chickpeas, and Cumin Yogurt	9	11	3	Heat the oil in a 12-inch skillet over high heat until shimmering. Add the eggplants and lower the heat to medium. Season with salt and pepper as you rotate the eggplants, browning them on all sides. Continue to cook, turning regularly, until a fork inserted into the eggplant meets no resistance (you may have to stand them up on their fat end to finish cooking the thickest parts), about 20 minutes, lowering the heat and sprinkling water into the pan as necessary if the eggplants threaten to burn or smoke excessively.\r\n\r\n2.\r\nMix the harissa, chickpeas and tomatoes together, then add to the eggplants. Cook until the tomatoes have blistered and broken down, about 5 minutes more. Season with salt and pepper and add water as necessary to thin to a saucy consistency. Meanwhile, combine the yogurt and cumin in a serving bowl. Season with salt and pepper.\r\n\r\n3.\r\nTop the eggplant mixture with the parsley, drizzle with more extra virgin olive oil, and serve with the yogurt on the side.	A spicy and satisfying Middle Eastern dish of stovetop-cooked eggplant served with harissa, chickpeas, and a tangy cumin yogurt sauce.	35	https://ftp.goit.study/img/so-yummy/preview/Stovetop%20Eggplant%20With%20Harissa_%20Chickpeas_%20and%20Cumin%20Yogurt.jpg	2025-07-09 17:36:38.669+00	2025-07-09 17:36:38.669+00
76	French Lentils With Garlic and Thyme	10	9	3	Place a large saucepan over medium heat and add oil. When hot, add chopped vegetables and sauté until softened, 5 to 10 minutes.\r\nAdd 6 cups water, lentils, thyme, bay leaves and salt. Bring to a boil, then reduce to a fast simmer.\r\nSimmer lentils until they are tender and have absorbed most of the water, 20 to 25 minutes. If necessary, drain any excess water after lentils have cooked. Serve immediately, or allow them to cool and reheat later.\r\nFor a fuller taste, use some chicken stock and reduce the water by the same amount.	A simple yet flavorful French dish of lentils cooked with garlic, thyme, and other aromatics.	40	https://ftp.goit.study/img/so-yummy/preview/French%20Lentils%20With%20Garlic%20and%20Thyme.jpg	2025-07-09 17:36:38.68+00	2025-07-09 17:36:38.68+00
77	Salmon Prawn Risotto	1	2	3	Melt the butter in a thick-based pan and gently cook the onion without colour until it is soft.\r\nAdd the rice and stir to coat all the grains in the butter\r\nAdd the wine and cook gently stirring until it is absorbed\r\nGradually add the hot stock, stirring until each addition is absorbed. Keep stirring until the rice is tender\r\nSeason with the lemon juice and zest, and pepper to taste. (there will probably be sufficient saltiness from the salmon to not need to add salt) Stir gently to heat through\r\nServe scattered with the Parmesan and seasonal vegetables.\r\nGrill the salmon and gently place onto the risotto with the prawns and asparagus	Creamy risotto with salmon and prawns	40	https://ftp.goit.study/img/so-yummy/preview/Salmon%20Prawn%20Risotto.jpg	2025-07-09 17:36:38.687+00	2025-07-09 17:36:38.687+00
78	Yaki Udon	9	8	3	Boil some water in a large saucepan. Add 250ml cold water and the udon noodles. (As they are so thick, adding cold water helps them to cook a little bit slower so the middle cooks through). If using frozen or fresh noodles, cook for 2 mins or until al dente; dried will take longer, about 5-6 mins. Drain and leave in the colander.\r\nHeat 1 tbsp of the oil, add the onion and cabbage and sauté for 5 mins until softened. Add the mushrooms and some spring onions, and sauté for 1 more min. Pour in the remaining sesame oil and the noodles. If using cold noodles, let them heat through before adding the ingredients for the sauce – otherwise tip in straight away and keep stir-frying until sticky and piping hot. Sprinkle with the remaining spring onions.	A Japanese noodle dish made with udon noodles, vegetables, and a savory sauce.	35	https://ftp.goit.study/img/so-yummy/preview/Yaki%20Udon.jpg	2025-07-09 17:36:38.697+00	2025-07-09 17:36:38.697+00
79	Rock Cakes	6	7	3	Preheat oven to 180C/350F/Gas 4 and line a baking tray with baking parchment.\r\nMix the flour, sugar and baking powder in a bowl and rub in the cubed butter until the mixture looks like breadcrumbs, then mix in the dried fruit.\r\nIn a clean bowl, beat the egg and milk together with the vanilla extract.\r\nAdd the egg mixture to the dry ingredients and stir with a spoon until the mixture just comes together as a thick, lumpy dough. Add a teaspoon more milk if you really need it to make the mixture stick together.\r\nPlace golfball-sized spoons of the mixture onto the prepared baking tray. Leave space between them as they will flatten and spread out to double their size during baking.\r\nBake for 15-20 minutes, until golden-brown. Remove from the oven, allow to cool for a couple of minutes then turn them out onto a wire rack to cool.	A traditional British cake made with flour, butter, sugar, and dried fruits. It is a crumbly and slightly sweet cake that is perfect with a cup of tea.	20	https://ftp.goit.study/img/so-yummy/preview/Rock%20Cakes.jpg	2025-07-09 17:36:38.71+00	2025-07-09 17:36:38.71+00
80	Chicken Quinoa Greek Salad	4	19	3	Cook the quinoa following the pack instructions, then rinse in cold water and drain thoroughly.\r\n\r\nMeanwhile, mix the butter, chilli and garlic into a paste. Toss the chicken fillets in 2 tsp of the olive oil with some seasoning. Lay in a hot griddle pan and cook for 3-4 mins each side or until cooked through. Transfer to a plate, dot with the spicy butter and set aside to melt.\r\n\r\nNext, tip the tomatoes, olives, onion, feta and mint into a bowl. Toss in the cooked quinoa. Stir through the remaining olive oil, lemon juice and zest, and season well. Serve with the chicken fillets on top, drizzled with any buttery chicken juices.	A healthy and satisfying salad made with fresh greens, grilled chicken, nutty quinoa, and a tangy Greek dressing, perfect for lunch or dinner.	30	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Quinoa%20Greek%20Salad.jpg	2025-07-09 17:36:38.717+00	2025-07-09 17:36:38.717+00
81	Tourtiere	8	16	3	Heat oven to 200C/180C fan/gas 6. Boil the potato until tender, drain and mash, then leave to cool. Heat the oil in a non-stick pan, add the mince and onion and quickly fry until browned. Add the garlic, spices, stock, plenty of pepper and a little salt and mix well. Remove from the heat, stir into the potato and leave to cool.\r\nRoll out half the pastry and line the base of a 20-23cm pie plate or flan tin. Fill with the pork mixture and brush the edges of the pastry with water. Roll out the remaining dough and cover the pie. Press the edges of the pastry to seal, trimming off the excess. Prick the top of the pastry case to allow steam to escape and glaze the top with the beaten egg.\r\nBake for 30 mins until the pastry is crisp and golden. Serve cut into wedges with a crisp green salad. Leftovers are good cold for lunch the next day, served with a selection of pickles.	A traditional French-Canadian meat pie made with ground pork, beef, and spices, baked in a flaky pastry crust.	60	https://ftp.goit.study/img/so-yummy/preview/Tourtiere.jpg	2025-07-09 17:36:38.727+00	2025-07-09 17:36:38.727+00
89	Vegetarian Casserole	9	7	3	Heat the oil in a large, heavy-based pan. Add the onions and cook gently for 5 – 10 mins until softened.\r\nAdd the garlic, spices, dried thyme, carrots, celery and peppers and cook for 5 minutes.\r\nAdd the tomatoes, stock, courgettes and fresh thyme and cook for 20 - 25 minutes.\r\nTake out the thyme sprigs. Stir in the lentils and bring back to a simmer. Serve with wild and white basmati rice, mash or quinoa.	A hearty casserole made with a variety of vegetables, perfect for a cozy dinner.	40	https://ftp.goit.study/img/so-yummy/preview/Vegetarian%20Casserole.jpg	2025-07-09 17:36:38.82+00	2025-07-09 17:36:38.82+00
82	Fish fofos	1	20	3	STEP 1\r\n\r\nPut the fish into a lidded pan and pour over enough water to cover. Bring to a simmer and gently poach for 10 minutes over a low heat with the lid on. Drain and flake the fish.\r\n\r\nSTEP 2\r\n\r\nPut the fish, potato, green chilli, coriander, cumin, black pepper, garlic and ginger in a large bowl. Season, add the rice flour, mix well and break in 1 egg. Stir the mixture and divide into 15, then form into small logs. Break the remaining eggs into a bowl and whisk lightly. Put the breadcrumbs into another bowl. Dip each fofo in the beaten egg followed by the breadcrumb mixture. Chill for 20 minutes.\r\n\r\nSTEP 3\r\n\r\nHeat 1cm of oil in a large frying pan over a medium heat. Fry the fofos in batches for 2 minutes on each side, turning gently to get an even golden brown colour all over. Drain on kitchen paper and repeat with the remaining fofos.\r\n\r\nSTEP 4\r\n\r\nFor the onion salad, mix together the onion, coriander and lemon juice with a pinch of salt. Serve with the fofos and mango chutney.	Fish fofos are a popular Portuguese dish of fish patties made with mashed potatoes, cod or hake, and herbs, fried until golden brown and crispy on the outside, soft and moist on the inside.	60	https://ftp.goit.study/img/so-yummy/preview/Fish%20fofos.jpg	2025-07-09 17:36:38.741+00	2025-07-09 17:36:38.741+00
83	White chocolate creme brulee	6	9	3	Heat the cream, chocolate and vanilla pod in a pan until the chocolate has melted. Take off the heat and allow to infuse for 10 mins, scraping the pod seeds into the cream. If using the vanilla extract, add straight away. Heat oven to 160C/fan 140C/gas 3.\r\nBeat yolks and sugar until pale. stir in the chocolate cream. Strain into a jug and pour into ramekins. Place in a deep roasting tray and pour boiling water halfway up the sides. Bake for 15-20 mins until just set with a wobbly centre. Chill in the fridge for at least 4 hrs.\r\nTo serve, sprinkle some sugar on top of the brûlées and caramelise with a blowtorch or briefly under a hot grill. Leave caramel to harden, then serve.	A rich and creamy French dessert made with white chocolate custard and a caramelized sugar topping.	40	https://ftp.goit.study/img/so-yummy/preview/White%20chocolate%20creme%20brulee.jpg	2025-07-09 17:36:38.755+00	2025-07-09 17:36:38.755+00
84	Fresh sardines	13	21	3	Wash the fish under the cold tap. Roll in the flour and deep fry in oil until crispy. Lay on kitchen towel to get rid of the excess oil and serve hot or cold with a slice of lemon.	Fresh sardines are a simple, flavorful, and nutritious seafood dish that can be grilled, fried, or baked. They are rich in omega-3 fatty acids, protein, and minerals, and are a staple of Mediterranean cuisine.	15	https://ftp.goit.study/img/so-yummy/preview/Fresh%20sardines.jpg	2025-07-09 17:36:38.762+00	2025-07-09 17:36:38.762+00
85	Tunisian Lamb Soup	2	18	3	Add the lamb to a casserole and cook over high heat. When browned, remove from the heat and set aside.\r\nKeep a tablespoon of fat in the casserole and discard the rest. Reduce to medium heat then add the garlic, onion and spinach and cook until the onion is translucent and the spinach wilted or about 5 minutes.\r\nReturn the lamb to the casserole with the onion-spinach mixture, add the tomato puree, cumin, harissa, chicken, chickpeas, lemon juice, salt and pepper in the pan. Simmer over low heat for about 20 minutes.\r\nAdd the pasta and cook for 15 minutes or until pasta is cooked.	A warming soup made with tender lamb, root vegetables, chickpeas, and a blend of aromatic spices.	40	https://ftp.goit.study/img/so-yummy/preview/Tunisian%20Lamb%20Soup.jpg	2025-07-09 17:36:38.766+00	2025-07-09 17:36:38.766+00
86	Mince Pies	6	7	3	To make the pastry, rub 225g cold, diced butter into 350g plain flour, then mix in 100g golden caster sugar and a pinch of salt.\r\n\r\nCombine the pastry into a ball – don’t add liquid – and knead it briefly. The dough will be fairly firm, like shortbread dough. You can use the dough immediately, or chill for later.\r\n\r\nPreheat the oven to 200C/gas 6/fan 180C. Line 18 holes of two 12-hole patty tins, by pressing small walnut-sized balls of pastry into each hole.\r\n\r\nSpoon 280g mincemeat into the pies.\r\n\r\nTake slightly smaller balls of pastry than before and pat them out between your hands to make round lids, big enough to cover the pies. \r\n\r\nTop the pies with their lids, pressing the edges gently together to seal – you don’t need to seal them with milk or egg as they will stick on their own. (The pies may now be frozen for up to 1 month).\r\n\r\nBeat 1 small egg and brush the tops of the pies. Bake for 20 mins until golden. Leave to cool in the tin for 5 mins, then remove to a wire rack.\r\n\r\nTo serve, lightly dust with icing sugar.	These small, sweet pies are filled with a mixture of spiced fruit mincemeat, and are a popular dessert during the holiday season in the UK and other parts of the world.	20	https://ftp.goit.study/img/so-yummy/preview/Mince%20Pies.jpg	2025-07-09 17:36:38.781+00	2025-07-09 17:36:38.781+00
87	Portuguese fish stew (Caldeirada de peixe)	1	20	3	STEP 1\r\n\r\nHeat a drizzle of oil in a large, deep-sided frying pan, and fry the onion and pepper on a medium heat until softened but not browned. Finely chop the coriander stalks (keep the leaves for later), and add to the pan with the chilli and chopped garlic. Fry for another few minutes. Add the wine, saffron and bay leaf and let it simmer until reduced by half.\r\n\r\nSTEP 2\r\n\r\nAdd the potatoes, tomatoes, and 300ml water and bring to a gentle boil. Break up the tomatoes with a spoon on the side of the pan and simmer for 20-25 minutes until the potatoes are just tender, and the tomatoes have broken down.\r\n\r\nSTEP 3\r\n\r\nSeason well, then gently push the fish into the sauce, and arrange the squid, prawns, clams and mussels on the surface. Put the lid on and cook for 6-8 minutes until the mussel and clam shells have opened, the prawns are cooked and the fish is flaky. Toast the bread, rub lightly with the halved garlic clove and drizzle with olive oil. Serve the stew scatted with chopped coriander leaves, and the toasts for dunking.	Caldeirada de peixe is a hearty Portuguese fish stew made with a variety of fresh fish, potatoes, tomatoes, onions, and herbs, simmered in a flavorful broth until the flavors meld together.	40	https://ftp.goit.study/img/so-yummy/preview/Portuguese%20fish%20stew%20_Caldeirada%20de%20peixe_.jpg	2025-07-09 17:36:38.786+00	2025-07-09 17:36:38.786+00
88	Spinach & Ricotta Cannelloni	9	2	3	First make the tomato sauce. Heat the oil in a large pan and fry the garlic for 1 min. Add the sugar, vinegar, tomatoes and some seasoning and simmer for 20 mins, stirring occasionally, until thick. Add the basil and divide the sauce between 2 or more shallow ovenproof dishes (see Tips for freezing, below). Set aside. Make a sauce by beating the mascarpone with the milk until smooth, season, then set aside.\r\n\r\nPut the spinach in a large colander and pour over a kettle of boiling water to wilt it (you may need to do this in batches). When cool enough to handle squeeze out the excess water. Roughly chop the spinach and mix in a large bowl with 100g Parmesan and ricotta. Season well with salt, pepper and the nutmeg.\r\n\r\nHeat oven to 200C/180C fan/gas 6. Using a piping bag or plastic food bag with the corner snipped off, squeeze the filling into the cannelloni tubes. Lay the tubes, side by side, on top of the tomato sauce and spoon over the mascarpone sauce. Top with Parmesan and mozzarella. You can now freeze the cannelloni, uncooked, or you can cook it first and then freeze. Bake for 30-35 mins until golden and bubbling. Remove from oven and let stand for 5 mins before serving.	A vegetarian pasta dish filled with spinach and ricotta cheese, baked in a tomato sauce.	105	https://ftp.goit.study/img/so-yummy/preview/Spinach%20_%20Ricotta%20Cannelloni.jpg	2025-07-09 17:36:38.799+00	2025-07-09 17:36:38.799+00
90	Portuguese barbecued pork (Febras assadas)	8	20	3	STEP 1\r\n\r\nCut the tenderloins into 5 equal-size pieces leaving the tail ends a little longer. Take a clear plastic bag and slip one of the pieces in. Bash it into an escalope the size of a side-plate with a rolling pin and repeat with the remaining pieces.\r\n\r\nSTEP 2\r\n\r\nPut the wine, paprika, some salt and pepper and the juice of ½ a lemon in a bowl and add the pork. Leave to marinate for 20-30 minutes, while you get your barbecue to the stage where the coals are glowing but there are no flames.\r\n\r\nSTEP 3\r\n\r\nTo make the chips, fill a basin with cool water and cut the potatoes into 3cm-thick chips. Soak them in the water for 5 minutes and then change the water. Leave for 5 more minutes. Drain and then pat dry on a towel or with kitchen paper.\r\n\r\nSTEP 4\r\n\r\nHeat the oil in a deep fryer or a deep heavy-based pan with a lid to 130C and lower the chips into the oil (in batches). Blanch for 8-10 minutes. Remove from the oil and drain well. Place on a tray to cool. Reheat the oil to 180C (make sure it’s hot or your chips will be soggy) and lower the basket of chips into the oil (again, do this in batches). Leave to cook for 2 minutes and then give them a little shake. Cook for another minute or so until they are well coloured and crisp to the touch. Drain well for a few minutes, tip into a bowl and sprinkle with sea salt.\r\n\r\nSTEP 5\r\n\r\nThe pork will cook quickly so do it in 2 batches. Take the pieces out of the marinade, rub them with oil, and drop them onto the barbecue (you could also use a chargrill). Cook for 1 minute on each side – they may flare up as you do so. This should really be enough time as they will keep on cooking. Take them off the barbecue and pile onto a plate. Repeat with the remaining batch.\r\n\r\nSTEP 6\r\n\r\nServe by piling a plate with chips, drop the pork on top of each pile and pouring the juices from the plate over so the chips take up the flavours. Top with a spoon of mayonnaise and a wedge of lemon.	Febras assadas is a flavorful Portuguese dish of marinated pork loin grilled over charcoal until tender and juicy, served with a side of rice and fries.	74	https://ftp.goit.study/img/so-yummy/preview/Portuguese%20barbecued%20pork%20_Febras%20assadas_.jpg	2025-07-09 17:36:38.838+00	2025-07-09 17:36:38.838+00
91	Chocolate Souffle	6	9	3	Heat oven to 220C/fan 200C/gas 7 and place a baking tray on the top shelf. For the sauce, heat the cream and sugar until boiling. Remove from the heat, stir in the chocolate and butter until melted, then keep warm.\r\nBrush 6 x 150ml ramekins with melted butter, sprinkle with the 2 tbsp caster sugar, then tip out any excess. Melt the chocolate and cream in a bowl over a pan of simmering water, cool, then mix in the egg yolks. Whisk the egg whites until they hold their shape, then add the sugar, 1 tbsp at a time, whisking back to the same consistency. Mix a spoonful into the chocolate, then gently fold in the rest.\r\nWorking quickly, fill the ramekins, wipe the rims clean and run your thumb around the edges. Turn oven down to 200C/fan 180C/gas 6, place the ramekins onto the baking tray, then bake for 8-10 mins until risen with a slight wobble. Don’t open the oven door too early as this may make them collapse.\r\nOnce the soufflés are ready, dust with icing sugar, scoop a small hole from their tops, then pour in some of the hot chocolate sauce. Replace the lids and serve straight away.	A light and airy chocolate dessert made with eggs, sugar, and chocolate. It is a delicate dessert that requires precise preparation and is often served in French restaurants.	10	https://ftp.goit.study/img/so-yummy/preview/Chocolate%20Souffle.jpg	2025-07-09 17:36:38.848+00	2025-07-09 17:36:38.848+00
92	Pouding chomeur	6	16	3	In a large bowl, with an electric mixer, mix the butter and sugar till the mix is light.\r\nAdd eggs and vanilla and mix.\r\nIn another bowl, mix flour and baking powder.\r\nAlternate flour mix and milk to the butter mix.\r\nPour into a 13 inch by 9 inch greased pan.\r\nMAPLE SAUCE.\r\nIn a large casserole, bring to boil the syrup, brown sugar, cream and butter and constantly stir.\r\nReduce heat and and gently cook 2 minutes or till sauce has reduced a little bit.\r\nPour sauce gently over cake.\r\nBake at 325°f (160°c) about 35 minutes or till cake is light brown and when toothpick inserted comes out clean.	A French-Canadian dessert consisting of a cake-like batter that is baked in a pool of maple syrup, resulting in a rich, moist cake with a sweet syrupy sauce.	35	https://ftp.goit.study/img/so-yummy/preview/Pouding%20chomeur.jpg	2025-07-09 17:36:38.855+00	2025-07-09 17:36:38.855+00
93	Honey Balsamic Chicken with Crispy Broccoli & Potatoes	4	11	3	2 Servings\r\n\r\n1. Preheat oven to 425 degrees. Wash and dry all produce. Cut potatoes into 1/2-inch-thick wedges. Toss on one side of a baking sheet with a drizzle of oil, salt, and pepper. (For 4 servings, spread potatoes out across entire sheet.) Roast on top rack for 5 minutes (we'll add the broccoli then). \r\n\r\n2. Meanwhile, cut broccoli florets into bite-size pieces, if necessary. Peel and finely chop garlic. In a small microwave-safe bowl, combine 1 TBSP olive oil (2 TBSP for 4 servings) and half the garlic. Microwave until garlic sizzles, 30 seconds. \r\n\r\n3. Once potatoes have roasted 5 minutes, remove sheet from oven and add broccoli to empty side; carefully toss with garlic oil, salt, and pepper. (For 4 servings, add broccoli to a second sheet.) Continue roasting until potatoes and broccoli are browned and crispy, 15-20 minutes more. \r\n\r\n4. While veggies roast, pat chicken dry with paper towels; season all over with salt and pepper. Heat a drizzle of oil in a large pan over medium-high heat. Add chicken and cook until browned and cooked through, 5-6 minutes per side. (If chicken browns too quickly, reduce heat to medium.) Turn off heat; set chicken aside to rest. Wash out pan. \r\n\r\n5. Heat pan used for chicken over medium-high heat. Add a drizzle of oil and remaining garlic; cook until fragrant, 30 seconds. Stir in vinegar, honey, stock concentrate, and 1/4 cup water (1/3 cup for 4 servings). Simmer until thick and glossy, 2-3 minutes. Remove from heat and stir in 1 TBSP butter (2 TBSP for 4). Season with salt and pepper. \r\n\r\n6. Return chicken to pan and turn to coat in glaze. Divide chicken, broccoli, and potatoes between plates. Spoon any remaining glaze over chicken and serve. 	This sweet and tangy chicken is cooked in a honey balsamic glaze and served with crispy roasted broccoli and potatoes.	40	https://ftp.goit.study/img/so-yummy/preview/Honey%20Balsamic%20Chicken%20with%20Crispy%20Broccoli%20_%20Potatoes.jpg	2025-07-09 17:36:38.868+00	2025-07-09 17:36:38.868+00
94	French Onion Soup	13	9	3	Melt the butter with the oil in a large heavy-based pan. Add the onions and fry with the lid on for 10 mins until soft. Sprinkle in the sugar and cook for 20 mins more, stirring frequently, until caramelised. The onions should be really golden, full of flavour and soft when pinched between your fingers. Take care towards the end to ensure that they don’t burn.\r\nAdd the garlic for the final few mins of the onions’ cooking time, then sprinkle in the flour and stir well. Increase the heat and keep stirring as you gradually add the wine, followed by the hot stock. Cover and simmer for 15-20 mins.\r\nTo serve, turn on the grill, and toast the bread. Ladle the soup into heatproof bowls. Put a slice or two of toast on top of the bowls of soup, and pile on the cheese. Grill until melted. Alternatively, you can complete the toasts under the grill, then serve them on top.	A soup made with caramelized onions, beef broth, and bread. It is often topped with melted cheese and is a popular soup in French cuisine.	70	https://ftp.goit.study/img/so-yummy/preview/French%20Onion%20Soup.jpg	2025-07-09 17:36:38.879+00	2025-07-09 17:36:38.879+00
95	Beef Rendang	5	13	3	Chop the spice paste ingredients and then blend it in a food processor until fine.\r\nHeat the oil in a stew pot, add the spice paste, cinnamon, cloves, star anise, and cardamom and stir-fry until aromatic. Add the beef and the pounded lemongrass and stir for 1 minute. Add the coconut milk, tamarind juice, water, and simmer on medium heat, stirring frequently until the meat is almost cooked. Add the kaffir lime leaves, kerisik (toasted coconut), sugar or palm sugar, stirring to blend well with the meat.\r\nLower the heat to low, cover the lid, and simmer for 1 to 1 1/2 hours or until the meat is really tender and the gravy has dried up. Add more salt and sugar to taste. Serve immediately with steamed rice and save some for overnight.	A spicy and aromatic Indonesian curry made with tender beef slow-cooked in coconut milk and a blend of flavorful spices like lemongrass, galangal, and turmeric. Served with a side of steamed rice for a hearty meal.	120	https://ftp.goit.study/img/so-yummy/preview/Beef%20Rendang.jpg	2025-07-09 17:36:38.889+00	2025-07-09 17:36:38.889+00
96	Gigantes Plaki	9	19	3	Soak the beans overnight in plenty of water. Drain, rinse, then place in a pan covered with water. Bring to the boil, reduce the heat, then simmer for approx 50 mins until slightly tender but not soft. Drain, then set aside.\r\n\r\nHeat oven to 180C/160C fan/gas 4. Heat the olive oil in a large frying pan, tip in the onion and garlic, then cook over a medium heat for 10 mins until softened but not browned. Add the tomato purée, cook for a further min, add remaining ingredients, then simmer for 2-3 mins. Season generously, then stir in the beans. Tip into a large ovenproof dish, then bake for approximately 1 hr, uncovered and without stirring, until the beans are tender. The beans will absorb all the fabulous flavours and the sauce will thicken. Allow to cool, then scatter with parsley and drizzle with a little more olive oil to serve.	A hearty Greek dish made with giant white beans, simmered in a rich tomato sauce with onions, garlic, and herbs, served hot and delicious with crusty bread.	480	https://ftp.goit.study/img/so-yummy/preview/Gigantes%20Plaki.jpg	2025-07-09 17:36:38.904+00	2025-07-09 17:36:38.904+00
97	Oxtail with broad beans	5	24	3	Toss the oxtail with the onion, spring onion, garlic, ginger, chilli, soy sauce, thyme, salt and pepper. Heat the vegetable oil in a large frying pan over medium-high heat. Brown the oxtail in the pan until browned all over, about 10 minutes. Place into a pressure cooker, and pour in 375ml water. Cook at pressure for 25 minutes, then remove from heat, and remove the lid according to manufacturer's directions.\r\nAdd the broad beans and pimento berries, and bring to a simmer over medium-high heat. Dissolve the cornflour in 2 tablespoons water, and stir into the simmering oxtail. Cook and stir a few minutes until the sauce has thickened, and the broad beans are tender.	Tender oxtail cooked with broad beans, carrots, and other vegetables in a savory sauce. Served with rice and plantains.	35	https://ftp.goit.study/img/so-yummy/preview/Oxtail%20with%20broad%20beans.jpg	2025-07-09 17:36:38.913+00	2025-07-09 17:36:38.913+00
98	Kidney Bean Curry	9	10	3	Heat the oil in a large frying pan over a low-medium heat. Add the onion and a pinch of salt and cook slowly, stirring occasionally, until softened and just starting to colour. Add the garlic, ginger and coriander stalks and cook for a further 2 mins, until fragrant.\r\n\r\nAdd the spices to the pan and cook for another 1 min, by which point everything should smell aromatic. Tip in the chopped tomatoes and kidney beans in their water, then bring to the boil.\r\n\r\nTurn down the heat and simmer for 15 mins until the curry is nice and thick. Season to taste, then serve with the basmati rice and the coriander leaves.	A delicious and filling curry made with kidney beans and a variety of spices, perfect for a vegetarian meal.	30	https://ftp.goit.study/img/so-yummy/preview/Kidney%20Bean%20Curry.jpg	2025-07-09 17:36:38.923+00	2025-07-09 17:36:38.923+00
99	Baingan Bharta	9	10	3	Rinse the baingan (eggplant or aubergine) in water. Pat dry with a kitchen napkin. Apply some oil all over and\r\nkeep it for roasting on an open flame. You can also grill the baingan or roast in the oven. But then you won't get\r\nthe smoky flavor of the baingan. Keep the eggplant turning after a 2 to 3 minutes on the flame, so that its evenly\r\ncooked. You could also embed some garlic cloves in the baingan and then roast it.\r\n2. Roast the aubergine till its completely cooked and tender. With a knife check the doneness. The knife should slid\r\neasily in aubergines without any resistance. Remove the baingan and immerse in a bowl of water till it cools\r\ndown.\r\n3. You can also do the dhungar technique of infusing charcoal smoky flavor in the baingan. This is an optional step.\r\nUse natural charcoal for this method. Heat a small piece of charcoal on flame till it becomes smoking hot and red.\r\n4. Make small cuts on the baingan with a knife. Place the red hot charcoal in the same plate where the roasted\r\naubergine is kept. Add a few drops of oil on the charcoal. The charcoal would begin to smoke.\r\n5. As soon as smoke begins to release from the charcoal, cover the entire plate tightly with a large bowl. Allow the\r\ncharcoal smoke to get infused for 1 to 2 minutes. The more you do, the more smoky the baingan bharta will\r\nbecome. I just keep for a minute. Alternatively, you can also do this dhungar method once the baingan bharta is\r\ncooked, just like the way we do for Dal Tadka.\r\n6. Peel the skin from the roasted and smoked eggplant.\r\n7. Chop the cooked eggplant finely or you can even mash it.\r\n8. In a kadai or pan, heat oil. Then add finely chopped onions and garlic.\r\n9. Saute the onions till translucent. Don't brown them.\r\n10. Add chopped green chilies and saute for a minute.\r\n11. Add the chopped tomatoes and mix it well.\r\n12. Bhuno (saute) the tomatoes till the oil starts separating from the mixture.\r\n13. Now add the red chili powder. Stir and mix well.\r\n14. Add the chopped cooked baingan.\r\n15. Stir and mix the chopped baingan very well with the onion­tomato masala mixture.\r\n16. Season with salt. Stir and saute for some more 4 to 5 minutes more.\r\n17. Finally stir in the coriander leaves with the baingan bharta or garnish it with them. Serve Baingan Bharta with\r\nphulkas, rotis or chapatis. It goes well even with bread, toasted or grilled bread and plain rice or jeera rice.	A vegetarian Indian dish made with roasted eggplant and a mix of spices and herbs.	40	https://ftp.goit.study/img/so-yummy/preview/Baingan%20Bharta.jpg	2025-07-09 17:36:38.938+00	2025-07-09 17:36:38.938+00
100	Chilli prawn linguine	11	2	3	Mix the dressing ingredients in a small bowl and season with salt and pepper. Set aside.\r\n\r\nCook the pasta according to the packet instructions. Add the sugar snap peas for the last minute or so of cooking time.\r\n\r\nMeanwhile, heat the oil in a wok or large frying pan, toss in the garlic and chilli and cook over a fairly gentle heat for about 30 seconds without letting the garlic brown. Tip in the prawns and cook over a high heat, stirring frequently, for about 3 minutes until they turn pink.\r\n\r\nAdd the tomatoes and cook, stirring occasionally, for 3 minutes until they just start to soften. Drain the pasta and sugar snaps well, then toss into the prawn mixture. Tear in the basil leaves, stir, and season with salt and pepper.\r\n\r\nServe with salad leaves drizzled with the lime dressing, and warm crusty bread.	Spicy pasta dish with prawns	30	https://ftp.goit.study/img/so-yummy/preview/Chilli%20prawn%20linguine.jpg	2025-07-09 17:36:38.946+00	2025-07-09 17:36:38.946+00
101	Beef and Mustard Pie	5	7	3	Preheat the oven to 150C/300F/Gas 2.\r\nToss the beef and flour together in a bowl with some salt and black pepper.\r\nHeat a large casserole until hot, add half of the rapeseed oil and enough of the beef to just cover the bottom of the casserole.\r\nFry until browned on each side, then remove and set aside. Repeat with the remaining oil and beef.\r\nReturn the beef to the pan, add the wine and cook until the volume of liquid has reduced by half, then add the stock, onion, carrots, thyme and mustard, and season well with salt and pepper.\r\nCover with a lid and place in the oven for two hours.\r\nRemove from the oven, check the seasoning and set aside to cool. Remove the thyme.\r\nWhen the beef is cool and you're ready to assemble the pie, preheat the oven to 200C/400F/Gas 6.\r\nTransfer the beef to a pie dish, brush the rim with the beaten egg yolks and lay the pastry over the top. Brush the top of the pastry with more beaten egg.\r\nTrim the pastry so there is just enough excess to crimp the edges, then place in the oven and bake for 30 minutes, or until the pastry is golden-brown and cooked through.\r\nFor the green beans, bring a saucepan of salted water to the boil, add the beans and cook for 4-5 minutes, or until just tender.\r\nDrain and toss with the butter, then season with black pepper.\r\nTo serve, place a large spoonful of pie onto each plate with some green beans alongside.	A savory beef pie with a tangy mustard flavor, perfect for a hearty meal.	210	https://ftp.goit.study/img/so-yummy/preview/Beef%20and%20Mustard%20Pie.jpg	2025-07-09 17:36:38.961+00	2025-07-09 17:36:38.961+00
102	Three Fish Pie	1	7	3	Preheat the oven to 200C/400F/Gas 6 (180C fan).\r\nPut the potatoes into a saucepan of cold salted water. Bring up to the boil and simmer until completely tender. Drain well and then mash with the butter and milk. Add pepper and taste to check the seasoning. Add salt and more pepper if necessary.\r\nFor the fish filling, melt the butter in a saucepan, add the leeks and stir over the heat. Cover with a lid and simmer gently for 10 minutes, or until soft. Measure the flour into a small bowl. Add the wine and whisk together until smooth.\r\nAdd the milk to the leeks, bring to the boil and then add the wine mixture. Stir briskly until thickened. Season and add the parsley and fish. Stir over the heat for two minutes, then spoon into an ovenproof casserole. Scatter over the eggs. Allow to cool until firm.\r\nSpoon the mashed potatoes over the fish mixture and mark with a fork. Sprinkle with cheese.\r\nBake for 30-40 minutes, or until lightly golden-brown on top and bubbling around the edges.	A seafood lovers delight with a mix of salmon, cod, and smoked haddock in a creamy sauce.	70	https://ftp.goit.study/img/so-yummy/preview/Three%20Fish%20Pie.jpg	2025-07-09 17:36:38.973+00	2025-07-09 17:36:38.973+00
103	Key Lime Pie	6	11	3	Heat the oven to 160C/fan 140C/gas 3. Whizz the biscuits to crumbs in a food processor (or put in a strong plastic bag and bash with a rolling pin). Mix with the melted butter and press into the base and up the sides of a 22cm loose-based tart tin. Bake in the oven for 10 minutes. Remove and cool.\r\nPut the egg yolks in a large bowl and whisk for a minute with electric beaters. Add the condensed milk and whisk for 3 minutes then add the zest and juice and whisk again for 3 minutes. Pour the filling into the cooled base then put back in the oven for 15 minutes. Cool then chill for at least 3 hours or overnight if you like.\r\nWhen you are ready to serve, carefully remove the pie from the tin and put on a serving plate. To decorate, softly whip together the cream and icing sugar. Dollop or pipe the cream onto the top of the pie and finish with extra lime zest.	A tart and refreshing pie made with fresh lime juice, perfect for summer.	211	https://ftp.goit.study/img/so-yummy/preview/Key%20Lime%20Pie.jpg	2025-07-09 17:36:38.983+00	2025-07-09 17:36:38.983+00
104	Chicken Congee	4	22	3	STEP 1 - MARINATING THE CHICKEN\r\nIn a bowl, add chicken, salt, white pepper, ginger juice and then mix it together well.\r\nSet the chicken aside.\r\nSTEP 2 - RINSE THE WHITE RICE\r\nRinse the rice in a metal bowl or pot a couple times and then drain the water.\r\nSTEP 2 - BOILING THE WHITE RICE\r\nNext add 8 cups of water and then set the stove on high heat until it is boiling. Once rice porridge starts to boil, set the stove on low heat and then stir it once every 8-10 minutes for around 20-25 minutes.\r\nAfter 25 minutes, this is optional but you can add a little bit more water to make rice porridge to make it less thick or to your preference.\r\nNext add the marinated chicken to the rice porridge and leave the stove on low heat for another 10 minutes.\r\nAfter an additional 10 minutes add the green onions, sliced ginger, 1 pinch of salt, 1 pinch of white pepper and stir for 10 seconds.\r\nServe the rice porridge in a bowl\r\nOptional: add Coriander on top of the rice porridge.	A comforting and hearty rice porridge with tender chicken, ginger, and scallions. Great for a warm and filling meal.	60	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Congee.jpg	2025-07-09 17:36:38.994+00	2025-07-09 17:36:38.994+00
105	French Omelette	10	9	3	Get everything ready. Warm a 20cm (measured across the top) non-stick frying pan on a medium heat. Crack the eggs into a bowl and beat them with a fork so they break up and mix, but not as completely as you would for scrambled egg. With the heat on medium-hot, drop one knob of butter into the pan. It should bubble and sizzle, but not brown. Season the eggs with the Parmesan and a little salt and pepper, and pour into the pan.\r\nLet the eggs bubble slightly for a couple of seconds, then take a wooden fork or spatula and gently draw the mixture in from the sides of the pan a few times, so it gathers in folds in the centre. Leave for a few seconds, then stir again to lightly combine uncooked egg with cooked. Leave briefly again, and when partly cooked, stir a bit faster, stopping while there’s some barely cooked egg left. With the pan flat on the heat, shake it back and forth a few times to settle the mixture. It should slide easily in the pan and look soft and moist on top. A quick burst of heat will brown the underside.\r\nGrip the handle underneath. Tilt the pan down away from you and let the omelette fall to the edge. Fold the side nearest to you over by a third with your fork, and keep it rolling over, so the omelette tips onto a plate – or fold it in half, if that’s easier. For a neat finish, cover the omelette with a piece of kitchen paper and plump it up a bit with your fingers. Rub the other knob of butter over to glaze. Serve immediately.	A classic French dish made with fluffy eggs, filled with cheese, herbs, and other savory ingredients.	15	https://ftp.goit.study/img/so-yummy/preview/French%20Omelette.jpg	2025-07-09 17:36:39.003+00	2025-07-09 17:36:39.003+00
106	Beef Bourguignon	5	9	3	Heat a large casserole pan and add 1 tbsp goose fat. Season the beef and fry until golden brown, about 3-5 mins, then turn over and fry the other side until the meat is browned all over, adding more fat if necessary. Do this in 2-3 batches, transferring the meat to a colander set over a bowl when browned.\r\nIn the same pan, fry the bacon, shallots or pearl onions, mushrooms, garlic and bouquet garni until lightly browned. Mix in the tomato purée and cook for a few mins, stirring into the mixture. This enriches the bourguignon and makes a great base for the stew. Then return the beef and any drained juices to the pan and stir through.\r\nPour over the wine and about 100ml water so the meat bobs up from the liquid, but isn’t completely covered. Bring to the boil and use a spoon to scrape the caramelised cooking juices from the bottom of the pan – this will give the stew more flavour.\r\nHeat oven to 150C/fan 130C/gas 2. Make a cartouche: tear off a square of foil slightly larger than the casserole, arrange it in the pan so it covers the top of the stew and trim away any excess foil. Then cook for 3 hrs. If the sauce looks watery, remove the beef and veg with a slotted spoon, and set aside. Cook the sauce over a high heat for a few mins until the sauce has thickened a little, then return the beef and vegetables to the pan.\r\nTo make the celeriac mash, peel the celeriac and cut into cubes. Heat the olive oil in a large frying pan. Tip in the celeriac and fry for 5 mins until it turns golden. Season well with salt and pepper. Stir in the rosemary, thyme, bay and cardamom pods, then pour over 200ml water, enough to nearly cover the celeriac. Turn the heat to low, partially cover the pan and leave to simmer for 25-30 mins.\r\nAfter 25-30 mins, the celeriac should be soft and most of the water will have evaporated. Drain away any remaining water, then remove the herb sprigs, bay and cardamom pods. Lightly crush with a potato masher, then finish with a glug of olive oil and season to taste. Spoon the beef bourguignon into serving bowls and place a large spoonful of the celeriac mash on top. Garnish with one of the bay leaves, if you like.	A classic French beef stew made with red wine, beef broth, bacon, and vegetables like carrots and onions. It is typically served with mashed potatoes or crusty bread.	220	https://ftp.goit.study/img/so-yummy/preview/Beef%20Bourguignon.jpg	2025-07-09 17:36:39.01+00	2025-07-09 17:36:39.01+00
107	Kung Pao Chicken	4	22	3	Combine the sake or rice wine, soy sauce, sesame oil and cornflour dissolved in water. Divide mixture in half.\r\nIn a glass dish or bowl, combine half of the sake mixture with the chicken pieces and toss to coat. Cover dish and place in refrigerator for about 30 minutes.\r\nIn a medium frying pan, combine remaining sake mixture, chillies, vinegar and sugar. Mix together and add spring onion, garlic, water chestnuts and peanuts. Heat sauce slowly over medium heat until aromatic.\r\nMeanwhile, remove chicken from marinade and sauté in a large frying pan until juices run clear. When sauce is aromatic, add sautéed chicken and let simmer together until sauce thickens.	A spicy Chinese dish made with diced chicken, peanuts, and vegetables in a flavorful sauce. Served with rice or noodles.	35	https://ftp.goit.study/img/so-yummy/preview/Kung%20Pao%20Chicken.jpg	2025-07-09 17:36:39.028+00	2025-07-09 17:36:39.028+00
108	Pizza Express Margherita	10	2	3	1 Preheat the oven to 230°C.\r\n\r\n2 Add the sugar and crumble the fresh yeast into warm water.\r\n\r\n3 Allow the mixture to stand for 10 – 15 minutes in a warm place (we find a windowsill on a sunny day works best) until froth develops on the surface.\r\n\r\n4 Sift the flour and salt into a large mixing bowl, make a well in the middle and pour in the yeast mixture and olive oil.\r\n\r\n5 Lightly flour your hands, and slowly mix the ingredients together until they bind.\r\n\r\n6 Generously dust your surface with flour.\r\n\r\n7 Throw down the dough and begin kneading for 10 minutes until smooth, silky and soft.\r\n\r\n8 Place in a lightly oiled, non-stick baking tray (we use a round one, but any shape will do!)\r\n\r\n9 Spread the passata on top making sure you go to the edge.\r\n\r\n10 Evenly place the mozzarella (or other cheese) on top, season with the oregano and black pepper, then drizzle with a little olive oil.\r\n\r\n11 Cook in the oven for 10 – 12 minutes until the cheese slightly colours.\r\n\r\n12 When ready, place the basil leaf on top and tuck in!	A classic Italian pizza topped with tangy tomato sauce, fresh mozzarella cheese, and fragrant basil, baked to crispy perfection in a wood-fired oven.	27	https://ftp.goit.study/img/so-yummy/preview/Pizza%20Express%20Margherita.jpg	2025-07-09 17:36:39.04+00	2025-07-09 17:36:39.04+00
109	Chicken Basquaise	4	9	3	Preheat the oven to 180°C/Gas mark 4. Have the chicken joints ready to cook. Heat the butter and 3 tbsp olive oil in a flameproof casserole or large frying pan. Brown the chicken pieces in batches on both sides, seasoning them with salt and pepper as you go. Don't crowd the pan - fry the chicken in small batches, removing the pieces to kitchen paper as they are done.\r\n\r\nAdd a little more olive oil to the casserole and fry the onions over a medium heat for 10 minutes, stirring frequently, until softened but not browned. Add the rest of the oil, then the peppers and cook for another 5 minutes.\r\n\r\nAdd the chorizo, sun-dried tomatoes and garlic and cook for 2-3 minutes. Add the rice, stirring to ensure it is well coated in the oil. Stir in the tomato paste, paprika, bay leaves and chopped thyme. Pour in the stock and wine. When the liquid starts to bubble, turn the heat down to a gentle simmer. Press the rice down into the liquid if it isn't already submerged and place the chicken on top. Add the lemon wedges and olives around the chicken.\r\n\r\nCover and cook in the oven for 50 minutes. The rice should be cooked but still have some bite, and the chicken should have juices that run clear when pierced in the thickest part with a knife. If not, cook for another 5 minutes and check again.	A traditional Basque dish made with chicken, peppers, onions, and tomatoes, and flavored with garlic, paprika, and white wine. Popular in France and Spain.	85	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Basquaise.jpg	2025-07-09 17:36:39.05+00	2025-07-09 17:36:39.05+00
110	Mbuzi Choma (Roasted Goat)	14	26	3	1. Steps for the Meat: \r\n Roast meat over medium heat for 50 minutes and salt it as you turn it.\r\n\r\n2. Steps for Ugali:\r\nBring the water and salt to a boil in a heavy-bottomed saucepan. Stir in the cornmeal slowly, letting it fall through the fingers of your hand.\r\n\r\n3. Reduce heat to medium-low and continue stirring regularly, smashing any lumps with a spoon, until the mush pulls away from the sides of the pot and becomes very thick, about 10 minutes.\r\n\r\n4.Remove from heat and allow to cool.\r\n\r\n5. Place the ugali into a large serving bowl. Wet your hands with water, form a ball and serve.\r\n\r\n6. Steps for Kachumbari: Mix the tomatoes, onions, chili and coriander leaves in a bowl.\r\n\r\n7. Serve and enjoy!\r\n\r\n	A Kenyan specialty of roasted goat meat that's been marinated in a flavorful spice blend. Tender, juicy, and packed with flavor.	70	https://ftp.goit.study/img/so-yummy/preview/Mbuzi%20Choma%20_Roasted%20Goat_.jpg	2025-07-09 17:36:39.069+00	2025-07-09 17:36:39.069+00
111	Red Peas Soup	5	24	3	Wash and rinse the dried kidney beans.. then cover with water in a deep bowl. Remember as they soak they will expand to at least triple the size they were originally so add a lot of water to the bowl. Soak them overnight or for at least 2 hrs to make the cooking step go quicker. I tossed out the water they were soaked in after it did the job.\r\n\r\nHave your butcher cut the salted pigtail into 2 inch pieces as it will be very difficult to cut with an ordinary kitchen knife. Wash, then place a deep pot with water and bring to a boil. Cook for 20 minutes, then drain + rinse and repeat (boil again in water). The goal is to make the pieces of pig tails tender and to remove most of the salt it was cured in.\r\n\r\nTime to start the soup. Place everything in the pot (except the flour and potato), then cover with water and place on a high flame to bring to a boil. As it comes to a boil, skim off any scum/froth at the top and discard. Reduce the heat to a gentle boil and allow it to cook for 1 hr and 15 mins.. basically until the beans are tender and start falling apart.\r\n\r\nIt’s now time to add the potato (and Yams etc if you’re adding it) as well as the coconut milk and continue cooking for 15 minutes.\r\n\r\nNow is a good time to start making the basic dough for the spinner dumplings. Mix the flour and water (add a pinch of salt if you want) until you have a soft/smooth dough. allow it to rest for 5 minutes, then pinch of a tablespoon at a time and roll between your hands to form a cigarette shape.\r\n\r\nAdd them to the pot, stir well and continue cooking for another 15 minutes on a rolling boil.\r\n\r\nYou’ll notice that I didn’t add any salt to the pot as the remaining salt from the salted pigtails will be enough to properly season this dish. However you can taste and adjust accordingly. Lets recap the timing part of things so you’re not confused. Cook the base of the soup for 1 hr and 15 minute or until tender, then add the potatoes and cook for 15 minutes, then add the dumplings and cook for a further 15 minutes. Keep in mind that this soup will thicken quite a bit as it cools.\r\n\r\nWhile this is not a traditional recipe to any one specific island, versions of this soup (sometimes called stewed peas) can be found throughout the Caribbean, Latin America and Africa. A hearty bowl of this soup will surely give you the sleepies (some may call it ethnic fatigue). You can certainly freeze the leftovers and heat it up another day.	A hearty soup made with red kidney beans, carrots, potatoes, and other vegetables. Served with dumplings and bread.	205	https://ftp.goit.study/img/so-yummy/preview/Red%20Peas%20Soup.jpg	2025-07-09 17:36:39.076+00	2025-07-09 17:36:39.076+00
112	Apple & Blackberry Crumble	6	7	3	Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\r\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\r\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.	A classic British dessert made with stewed apples and blackberries, topped with a crumbly	28	https://ftp.goit.study/img/so-yummy/preview/Apple%20_%20Blackberry%20Crumble.jpg	2025-07-09 17:36:39.09+00	2025-07-09 17:36:39.09+00
113	Christmas Pudding Trifle	6	7	3	Peel the oranges using a sharp knife, ensuring all the pith is removed. Slice as thinly as possible and arrange over a dinner plate. Sprinkle with the demerara sugar followed by the Grand Marnier and set aside.\r\n\r\nCrumble the Christmas pudding into large pieces and scatter over the bottom of a trifle bowl. Lift the oranges onto the pudding in a layer and pour over any juices.\r\n\r\nBeat the mascarpone until smooth, then stir in the custard. Spoon the mixture over the top of the oranges.\r\n\r\nLightly whip the cream and spoon over the custard. Sprinkle with the flaked almonds and grated chocolate. You can make this a day in advance if you like, chill until ready to serve.	A festive twist on the classic British trifle, made with layers of Christmas pudding, custard, fruit, and cream.	15	https://ftp.goit.study/img/so-yummy/preview/Christmas%20Pudding%20Trifle.jpg	2025-07-09 17:36:39.1+00	2025-07-09 17:36:39.1+00
114	Borscht	15	1	3	Preheat the oven to 200C. In an ovenproof dish, bake the pork ribs for about 30 minutes or until a golden crust forms. Meanwhile, wash and roughly chop the celery root. There is no need to peel it. Cut up the carrots into chunks of about the same size as the celery pieces. Transfer the baked ribs into a large pot, add about 3 litres of water. Add the celery and carrot chunks, and half an unpeeled onion. Bring to a boil and cook over medium heat for about 30 minutes.\r\n\r\nMake the sauteed vegetable base – this is what makes any borscht so flavorful. Dice the sweet bell pepper. Finely dice the tomatoes and the other half of the onion.\r\n\r\nHeat the butter in a frying pan and cook the vegetables until they soften. Add 200ml tomato juice and about 2 tbsp tomato paste and cook for another 5-7 minutes.\r\n\r\nUsing a box grater, shred one of the beetroots. Add it to the sauteed vegetables and keep cooking for another 3-4 minutes.\r\n\r\nUsing a food processor with a juicing attachment, squeeze the juice out of the other beet (alternatively, you can simply grate it using the fine attachment on your box grater). Add the beet juice or purée and the vegetables into the pot with the ribs and celery, along with the allspice and bay leaves. Salt to taste.\r\n\r\nWash and peel 3-4 potatoes.\r\n\r\nDice them roughly and add into the pot with the rib broth. Cut the head of garlic in half and add to the pot.\r\n\r\nShred the cabbage and set it aside – we will add it to the borscht almost at the very end.\r\n\r\nIf you like, you can add some canned white beans to the borscht at this point.\r\n\r\nAdd the smoked dried pears to the pot. They will enhance the borscht with their wonderful smoky flavor.\r\n\r\nOnce all of the ingredients have cooked through and are tender, add the shredded cabbage to the pot. Cook for 5 more minutes and take the borscht off the heat. Let it rest for at least half an hour before serving with sour cream and finely chopped dill. Keep the borscht in the fridge and remember that it will become even more delicious overnight.	It’s no secret that almost every family has its own special borscht recipe. Some of us just can’t imagine it without beans, while others prefer to cook it without cabbage. All these options have a right to exist, because there is no single “correct” recipe, just hundreds of fascinating variations.The Ukrainian soul lives in this dish.	90	https://ftp.goit.study/img/so-yummy/preview/Borscht.jpg	2025-07-09 17:36:39.109+00	2025-07-09 17:36:39.109+00
115	Salmon Eggs Eggs Benedict	12	11	3	First make the Hollandaise sauce. Put the lemon juice and vinegar in a small bowl, add the egg yolks and whisk with a balloon whisk until light and frothy. Place the bowl over a pan of simmering water and whisk until mixture thickens. Gradually add the butter, whisking constantly until thick – if it looks like it might be splitting, then whisk off the heat for a few mins. Season and keep warm.\r\n\r\nTo poach the eggs, bring a large pan of water to the boil and add the vinegar. Lower the heat so that the water is simmering gently. Stir the water so you have a slight whirlpool, then slide in the eggs one by one. Cook each for about 4 mins, then remove with a slotted spoon.\r\n\r\nLightly toast and butter the muffins, then put a couple of slices of salmon on each half. Top each with an egg, spoon over some Hollandaise and garnish with chopped chives.	A twist on the classic Eggs Benedict, featuring smoked salmon, poached eggs, and a rich hollandaise sauce. A decadent brunch option that's sure to impress.	20	https://ftp.goit.study/img/so-yummy/preview/Salmon%20Eggs%20Eggs%20Benedict.jpg	2025-07-09 17:36:39.132+00	2025-07-09 17:36:39.132+00
116	BeaverTails	6	16	3	In the bowl of a stand mixer, add warm water, a big pinch of sugar and yeast. Allow to sit until frothy.\r\nInto the same bowl, add 1/2 cup sugar, warm milk, melted butter, eggs and salt, and whisk until combined.\r\nPlace a dough hook on the mixer, add the flour with the machine on, until a smooth but slightly sticky dough forms.\r\nPlace dough in a bowl, cover with plastic wrap, and allow to proof for 1 1/2 hours.\r\nCut dough into 12 pieces, and roll out into long oval-like shapes about 1/4 inch thick that resemble a beaver’s tail.\r\nIn a large, deep pot, heat oil to 350 degrees. Gently place beavertail dough into hot oil and cook for 30 to 45 seconds on each side until golden brown.\r\nDrain on paper towels, and garnish as desired. Toss in cinnamon sugar, in white sugar with a squeeze of lemon, or with a generous slathering of Nutella and a handful of toasted almonds. Enjoy!	A Canadian pastry that is hand-stretched to resemble a beaver's tail and deep-fried until crispy, then topped with various sweet toppings.	120	https://ftp.goit.study/img/so-yummy/preview/BeaverTails.jpg	2025-07-09 17:36:39.141+00	2025-07-09 17:36:39.141+00
117	Chicken Marengo	4	9	3	Heat the oil in a large flameproof casserole dish and stir-fry the mushrooms until they start to soften. Add the chicken legs and cook briefly on each side to colour them a little.\r\nPour in the passata, crumble in the stock cube and stir in the olives. Season with black pepper – you shouldn’t need salt. Cover and simmer for 40 mins until the chicken is tender. Sprinkle with parsley and serve with pasta and a salad, or mash and green veg, if you like.	A classic French chicken dish made with sautéed chicken in a tomato and wine sauce, served with mushrooms and olives.	40	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Marengo.jpg	2025-07-09 17:36:39.159+00	2025-07-09 17:36:39.159+00
118	Sledz w Oleju (Polish Herrings)	1	25	3	Soak herring in cold water for at least 1 hour. If very salty, repeat, changing the water each time.\r\n\r\nDrain thoroughly and slice herring into bite-size pieces.\r\n\r\nPlace in a jar large enough to accommodate the pieces and cover with oil, allspice, peppercorns, and bay leaf. Close the jar.\r\n\r\nRefrigerate for 2 to 3 days before eating. This will keep refrigerated up to 2 weeks.\r\n\r\nServe with finely chopped onion or onion slices, lemon, and parsley or dill.	A popular Polish appetizer, Sledz w Oleju is a dish of marinated herring fillets served in a tangy marinade of vinegar, onions, and spices.	2940	https://ftp.goit.study/img/so-yummy/preview/Sledz%20w%20Oleju%20_Polish%20Herrings_.jpg	2025-07-09 17:36:39.168+00	2025-07-09 17:36:39.168+00
119	Chocolate Gateau	6	9	3	Preheat the oven to 180°C/350°F/Gas Mark 4. Grease and line the base of an 8 in round spring form cake tin with baking parchment\r\nBreak the chocolate into a heatproof bowl and place over a saucepan of gently simmering water and stir until it melts. (or melt in the microwave for 2-3 mins stirring occasionally)\r\nPlace the butter and sugar in a mixing bowl and cream together with a wooden spoon until light and fluffy. Gradually beat in the eggs, adding a little flour if the mixture begins to curdle. Fold in the remaining flour with the cooled, melted chocolate and milk. Mix until smooth.\r\nSpread the mixture into the cake tin and bake for 50-55 mins or until firm in the centre and a skewer comes out cleanly. Cool for 10 minutes, then turn out and cool completely.	A French dessert consisting of layers of chocolate sponge cake and chocolate ganache, typically topped with chocolate glaze and chocolate decorations.	75	https://ftp.goit.study/img/so-yummy/preview/Chocolate%20Gateau.jpg	2025-07-09 17:36:39.176+00	2025-07-09 17:36:39.176+00
126	Nanaimo Bars	6	16	3	Start by making the biscuit base. In a bowl, over a pan of simmering water, melt the butter with the sugar and cocoa powder, stirring occasionally until smooth. Whisk in the egg for 2 to 3 mins until the mixture has thickened. Remove from heat and mix in the biscuit crumbs, coconut and almonds if using, then press into the base of a lined 20cm square tin. Chill for 10 mins.\r\nFor the middle layer, make the custard icing; whisk together the butter, cream and custard powder until light and fluffy, then gradually add the icing sugar until fully incorporated. Spread over the bottom layer and chill in the fridge for at least 10 mins until the custard is no longer soft.\r\nMelt the chocolate and butter together in the microwave, then spread over the chilled bars and put back in the fridge. Leave until the chocolate has fully set (about 2 hrs). Take the mixture out of the tin and slice into squares to serve.	A classic Canadian dessert made with a chocolate and coconut base, custard filling, and chocolate topping.	140	https://ftp.goit.study/img/so-yummy/preview/Nanaimo%20Bars.jpg	2025-07-09 17:36:39.268+00	2025-07-09 17:36:39.268+00
120	Lamb tomato and sweet spices	2	3	3	Use pickled vine leaves here, preserved in brine. Small delicate leaves are better than the large bristly ones but, if only large leaves are to hand, then trim them to roughly 12 by 12 cms so that you don't get too many layers of leaves around the filling. And remove any stalks. Drain the preserved leaves, immerse them in boiling water for 10 minutes and then leave to dry on a tea towel before use. \r\nBasmati rice with butter and pine nuts is an ideal accompaniment. Couscous is great, too. Serves four.\r\nFirst make the filling. Put all the ingredients, apart from the tomatoes, in a bowl. Cut the tomatoes in half, coarsely grate into the bowl and discard the skins. Add half a teaspoon of salt and some black pepper, and stir. Leave on the side, or in the fridge, for up to a day. Before using, gently squeeze with your hands and drain away any juices that come out.\r\nTo make the sauce, heat the oil in a medium pan. Add the ginger and garlic, cook for a minute or two, taking care not to burn them, then add the tomato, lemon juice and sugar. Season, and simmer for 20 minutes.\r\nWhile the sauce is bubbling away, prepare the vine leaves. Use any torn or broken leaves to line the base of a wide, heavy saucepan. Trim any leaves from the fennel, cut it vertically into 0.5cm-thick slices and spread over the base of the pan to cover completely.\r\nLay a prepared vine leaf (see intro) on a work surface, veiny side up. Put two teaspoons of filling at the base of the leaf in a 2cm-long by 1cm-wide strip. Fold the sides of the leaf over the filling, then roll it tightly from bottom to top, in a cigar shape. Place in the pan, seam down, and repeat with the remaining leaves, placing them tightly next to each other in lines or circles (in two layers if necessary).\r\nPour the sauce over the leaves (and, if needed, add water just to cover). Place a plate on top, to weigh the leaves down, then cover with a lid. Bring to a boil, reduce the heat and cook on a bare simmer for 70 minutes. Most of the liquid should evaporate. Remove from the heat, and leave to cool a little - they are best served warm. When serving, bring to the table in the pan - it looks great. Serve a few vine leaves and fennel slices with warm rice. Spoon the braising juices on top and garnish with coriander.	A Moroccan-inspired dish made with lamb, tomatoes, onions, and spices (such as cinnamon, ginger, and cumin), typically served with couscous or bread.	90	https://ftp.goit.study/img/so-yummy/preview/Lamb%20tomato%20and%20sweet%20spices.jpg	2025-07-09 17:36:39.187+00	2025-07-09 17:36:39.187+00
121	Fish pie	1	7	3	01.Put the potatoes in a large pan of cold salted water and bring to the boil. Lower the heat, cover, then simmer gently for 15 minutes until tender. Drain, then return to the pan over a low heat for 30 seconds to drive off any excess water. Mash with 1 tbsp olive oil, then season.\r\n02.Meanwhile put the milk in a large sauté pan, add the fish and bring to the boil. Remove from the heat, cover and stand for 3 minutes. Remove the fish (reserving the milk) and pat dry with kitchen paper, then gently flake into an ovenproof dish, discarding the skin and any bones.\r\n03.Heat the remaining oil in a pan, stir in the flour and cook for 30 seconds. Gradually stir in 200-250ml of the reserved milk (discard the rest). Grate in nutmeg, season, then bubble until thick. Stir in the cream.\r\n04.Preheat the oven to 190°C/fan170°C/gas 5. Grate the artichokes and add to the dish with the leek, prawns and herbs. Stir the lemon zest and juice into the sauce, then pour over. Mix gently with a wooden spoon.\r\n05.Spoon the mash onto the fish mixture, then use a fork to make peaks, which will crisp and brown as it cooks. Sprinkle over the cheese, then bake for 35-40 minutes until golden and bubbling. Serve with wilted greens.	A traditional British dish made with flaky fish, creamy sauce, and mashed potatoes.	75	https://ftp.goit.study/img/so-yummy/preview/Fish%20pie.jpg	2025-07-09 17:36:39.199+00	2025-07-09 17:36:39.199+00
122	Chicken Couscous	4	3	3	Heat the olive oil in a large frying pan and cook the onion for 1-2 mins just until softened. Add the chicken and fry for 7-10 mins until cooked through and the onions have turned golden. Grate over the ginger, stir through the harissa to coat everything and cook for 1 min more.\r\n\r\nTip in the apricots, chickpeas and couscous, then pour over the stock and stir once. Cover with a lid or tightly cover the pan with foil and leave for about 5 mins until the couscous has soaked up all the stock and is soft. Fluff up the couscous with a fork and scatter over the coriander to serve. Serve with extra harissa, if you like.	A flavorful dish made with chicken, couscous, and vegetables. Easy to make and packed with nutrients.	25	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Couscous.jpg	2025-07-09 17:36:39.217+00	2025-07-09 17:36:39.217+00
123	Smoky Lentil Chili with Squash	9	7	3	Begin by roasting the squash. Slice it into thin crescents and drizzle with a little oil and sprinkle with sea salt. I added a fresh little sage I had in the fridge, but it’s unnecessary. Roast the squash a 205 C (400 F) for 20-30 minutes, flipping halfway through, until soft and golden. Let cool and chop into cubes.\r\nMeanwhile, rinse the lentils and cover them with water. Bring them to the boil then turn down to a simmer and let cook (uncovered) for 20-30 minutes, or until tender. Drain and set aside.\r\nWhile the lentils are cooking heat the 1 Tbsp. of oil on low in a medium pot. Add the onions and leeks and sauté for 5 or so minutes, or until they begin to soften. Add the garlic next along with the cumin and coriander, cooking for a few more minutes. Add the remaining spices – paprika, cinnamon, chilli, cocoa, Worcestershire sauce, salt, and oregano. Next add the can of tomatoes, the water or stock, and carrots. Let simmer, covered, for 20 minutes or until the veg is tender and the mixture has thickened up. You’ll need to check on the pot periodically for a stir and a top of of liquid if needed.\r\nAdd the lentils and chopped roasted squash. Let cook for 10 more minutes to heat through.\r\nServe with sliced jalapeno, lime wedges, cilantro, green onions, and cashew sour cream.\r\n\r\nSIMPLE CASHEW SOUR CREAM\r\n\r\n1 Cup Raw Unsalted Cashews\r\nPinch Sea Salt\r\n1 tsp. Apple Cider Vinegar\r\nWater\r\n\r\nBring some water to the boil, and use it to soak the cashews for at least four hours. Alternatively, you can use cold water and let the cashews soak overnight, but I’m forgetful/lazy, so often use the boil method which is much faster.\r\nAfter the cashews have soaked, drain them and add to a high speed blender. Begin to puree, slowly adding about 1/2 cup fresh water, until a creamy consistency is reached. You may need to add less or more water to reach the desired consistency.\r\nAdd a pinch of sea salt and vinegar (or lemon juice).	A hearty and flavorful vegetarian chili made with lentils and squash.	90	https://ftp.goit.study/img/so-yummy/preview/Smoky%20Lentil%20Chili%20with%20Squash.jpg	2025-07-09 17:36:39.229+00	2025-07-09 17:36:39.229+00
124	Beef Sunday Roast	5	7	3	Cook the Broccoli and Carrots in a pan of boiling water until tender.\r\n\r\nRoast the Beef and Potatoes in the oven for 45mins, the potatoes may need to be checked regularly to not overcook.\r\n\r\nTo make the Yorkshire puddings:\r\nHeat oven to 230C/fan 210C/gas 8. Drizzle a little sunflower oil evenly into 2 x 4-hole Yorkshire pudding tins or a 12-hole non-stick muffin tin and place in the oven to heat through\r\nTo make the batter, tip 140g plain flour into a bowl and beat in four eggs until smooth. Gradually add 200ml milk and carry on beating until the mix is completely lump-free. Season with salt and pepper. Pour the batter into a jug, then remove the hot tins from the oven. Carefully and evenly pour the batter into the holes. Place the tins back in the oven and leave undisturbed for 20-25 mins until the puddings have puffed up and browned. Serve immediately.\r\n\r\nPlate up and add the Gravy as desired.	Roast beef with vegetables and gravy	45	https://ftp.goit.study/img/so-yummy/preview/Beef%20Sunday%20Roast.jpg	2025-07-09 17:36:39.251+00	2025-07-09 17:36:39.251+00
125	Spicy Arrabiata Penne	9	2	3	Bring a large pot of water to a boil. Add kosher salt to the boiling water, then add the pasta. Cook according to the package instructions, about 9 minutes.\r\nIn a large skillet over medium-high heat, add the olive oil and heat until the oil starts to shimmer. Add the garlic and cook, stirring, until fragrant, 1 to 2 minutes. Add the chopped tomatoes, red chile flakes, Italian seasoning and salt and pepper to taste. Bring to a boil and cook for 5 minutes. Remove from the heat and add the chopped basil.\r\nDrain the pasta and add it to the sauce. Garnish with Parmigiano-Reggiano flakes and more basil and serve warm.	An Italian pasta dish made with penne and a spicy tomato-based sauce, typically containing garlic, chili flakes, and parsley.	25	https://ftp.goit.study/img/so-yummy/preview/Spicy%20Arrabiata%20Penne.jpg	2025-07-09 17:36:39.26+00	2025-07-09 17:36:39.26+00
127	Feteer Meshaltet	13	23	3	Mix the flour and salt then pour one cup of water and start kneading.\r\nIf you feel the dough is still not coming together or too dry, gradually add the remaining water until you get a dough that is very elastic so that when you pull it and it won’t be torn.\r\nLet the dough rest for just 10 minutes then divide the dough into 6-8 balls depending on the size you want for your feteer.\r\nWarm up the butter/ghee or oil you are using and pour into a deep bowl.\r\nImmerse the dough balls into the warm butter. Let it rest for 15 to 20 minutes.\r\nPreheat oven to 550F.\r\nStretch the first ball with your hands on a clean countertop. Stretch it as thin as you can, the goal here is to see your countertop through the dough.\r\nFold the dough over itself to form a square brushing in between folds with the butter mixture.\r\nSet aside and start making the next ball.\r\nStretch the second one thin as we have done for the first ball.\r\nPlace the previous one on the middle seam side down. Fold the outer one over brushing with more butter mixture as you fold. Set aside.\r\nKeep doing this for the third and fourth balls. Now we have one ready, place on a 10 inch baking/pie dish seam side down and brush the top with more butter.\r\nRepeat for the remaining 4 balls to make a second one. With your hands lightly press the folded feteer to spread it on the baking dish.\r\nPlace in preheated oven for 10 minutes when the feteer starts puffing turn on the broiler to brown the top.\r\nWhen it is done add little butter on top and cover so it won’t get dry.	A traditional Egyptian pastry made with layers of flaky dough, butter, and honey, baked until golden brown and served warm with a sprinkle of powdered sugar.	60	https://ftp.goit.study/img/so-yummy/preview/Feteer%20Meshaltet.jpg	2025-07-09 17:36:39.285+00	2025-07-09 17:36:39.285+00
128	Pear Tarte Tatin	6	9	3	Core the pears, then peel as neatly as possible and halve. If you like, they can be prepared up to a day ahead and kept in the fridge, uncovered, so that they dry out.\r\nTip the sugar, butter, star anise, cardamom and cinnamon into an ovenproof frying pan, about 20cm wide, and place over a high heat until bubbling. Shake the pan and stir the buttery sauce until it separates and the sugar caramelises to a toffee colour.\r\nLay the pears in the pan, then cook in the sauce for 10-12 mins, tossing occasionally, until completely caramelised. Don’t worry about them burning – they won’t – but you want to caramelise them as much as possible. Splash in the brandy and let it flambé, then set the pears aside.\r\nHeat oven to 200C/fan 180C/gas 6. Roll the pastry out to the thickness of a £1 coin. Using a plate slightly larger than the top of the pan, cut out a circle, then press the edges of the circle of pastry to thin them out.\r\nWhen the pears have cooled slightly, arrange them in the pan, cut side up, in a floral shape, with the pears around the edge pointing inwards. Rest the cinnamon stick on the top in the centre, with the cardamom pods scattered around.\r\nDrape the pastry over the pears, then tuck the edges down the pan sides and under the fruit (see Gordon’s guide). Pierce the pastry a few times, then bake for 15 mins. If a lot of juice bubbles up the side of the pan, pour it off at this stage (see guide). Reduce oven to 180C/fan 160C/gas 4 and bake for 15 mins more until the pastry is golden. Leave the tart to stand for 10 mins, then invert it carefully onto a serving dish.	A delicious French dessert made with caramelized pears baked on top of a buttery pastry crust.	42	https://ftp.goit.study/img/so-yummy/preview/Pear%20Tarte%20Tatin.jpg	2025-07-09 17:36:39.292+00	2025-07-09 17:36:39.292+00
129	Tamiya	9	23	3	oak the beans in water to cover overnight.Drain. If skinless beans are unavailable, rub to loosen the skins, then discard the skins. Pat the beans dry with a towel.\r\nGrind the beans in a food mill or meat grinder.If neither appliance is available, process them in a food processor but only until the beans form a paste. (If blended too smoothly, the batter tends to fall apart during cooking.) Add the scallions, garlic, cilantro, cumin, baking powder, cayenne, salt, pepper, and coriander, if using.  Refrigerate for at least 30 minutes.\r\nShape the bean mixture into 1-inch balls.Flatten slightly and coat with flour.\r\nHeat at least 1½-inches of oil over medium heat to 365 degrees.\r\nFry the patties in batches, turning once, until golden brown on all sides, about 5 minutes.Remove with a wire mesh skimmer or slotted spoon. Serve as part of a meze or in pita bread with tomato-cucumber salad and tahina sauce.	Tamiya is a popular Egyptian street food made with mashed fava beans, herbs, and spices, shaped into patties and deep-fried until crispy. It's a vegan and gluten-free dish that's packed with flavor and protein and can be enjoyed as a snack or a meal.	30	https://ftp.goit.study/img/so-yummy/preview/Tamiya.jpg	2025-07-09 17:36:39.303+00	2025-07-09 17:36:39.303+00
130	Jerk chicken with rice & peas	4	24	3	To make the jerk marinade, combine all the ingredients in a food processor along with 1 tsp salt, and blend to a purée. If you’re having trouble getting it to blend, just keep turning off the blender, stirring the mixture, and trying again. Eventually it will start to blend up – don’t be tempted to add water, as you want a thick paste.\r\n\r\nTaste the jerk mixture for seasoning – it should taste pretty salty, but not unpleasantly, puckering salty. You can now throw in more chillies if it’s not spicy enough for you. If it tastes too salty and sour, try adding in a bit more brown sugar until the mixture tastes well balanced.\r\n\r\nMake a few slashes in the chicken thighs and pour the marinade over the meat, rubbing it into all the crevices. Cover and leave to marinate overnight in the fridge.\r\n\r\nIf you want to barbecue your chicken, get the coals burning 1 hr or so before you’re ready to cook. Authentic jerked meats are not exactly grilled as we think of grilling, but sort of smoke-grilled. To get a more authentic jerk experience, add some wood chips to your barbecue, and cook your chicken over slow, indirect heat for 30 mins. To cook in the oven, heat to 180C/160C fan/gas 4. Put the chicken pieces in a roasting tin with the lime halves and cook for 45 mins until tender and cooked through.\r\n\r\nWhile the chicken is cooking, prepare the rice & peas. Rinse the rice in plenty of cold water, then tip it into a large saucepan with all the remaining ingredients except the kidney beans. Season with salt, add 300ml cold water and set over a high heat. Once the rice begins to boil, turn it down to a medium heat, cover and cook for 10 mins.\r\n\r\nAdd the beans to the rice, then cover with a lid. Leave off the heat for 5 mins until all the liquid is absorbed. Squeeze the roasted lime over the chicken and serve with the rice & peas, and some hot sauce if you like it really spicy.	A popular Jamaican dish made with chicken that has been marinated in a spicy mixture of jerk seasoning, then grilled or roasted. Served with rice and peas, which are made with coconut milk and kidney beans.	70	https://ftp.goit.study/img/so-yummy/preview/Jerk%20chicken%20with%20rice%20_%20peas.jpg	2025-07-09 17:36:39.318+00	2025-07-09 17:36:39.318+00
148	Chocolate Caramel Crispy	6	7	3	Grease and line a 20 x 20cm/8" x 8" baking tin with parchment paper.\r\nPut the mars bars and butter in a heat proof bowl and place over a pan of barely simmering water. Mixing with a whisk, melt until the mixture is smooth.\r\nPour over the rice krispies in a mixing bowl and mix until all the ingredients are evenly combined. Press evenly into the prepare baking tin and set aside.\r\nMelt the milk chocolate in the microwave or over a pan of barely simmering water.\r\nSpread the melted chocolate over the rice krispie mixture and leave to set in a cool place. Once set slice into squares and serve!	A crunchy and chocolatey treat made with crispy rice cereal, melted chocolate, and gooey caramel. Perfect for satisfying your sweet tooth.	30	https://ftp.goit.study/img/so-yummy/preview/Chocolate%20Caramel%20Crispy.jpg	2025-07-09 17:36:39.569+00	2025-07-09 17:36:39.569+00
131	Pierogi (Polish Dumplings)	13	25	3	To prepare the sauerkraut filling, melt the butter in a skillet over medium heat. Stir in the onion, and cook until translucent, about 5 minutes. Add the drained sauerkraut and cook for an additional 5 minutes. Season to taste with salt and pepper, then remove to a plate to cool.\r\n\r\nFor the mashed potato filling, melt the butter in a skillet over medium heat. Stir in the onion, and cook until translucent, about 5 minutes. Stir into the mashed potatoes, and season with salt and white pepper.\r\n\r\nTo make the dough, beat together the eggs and sour cream until smooth. Sift together the flour, salt, and baking powder; stir into the sour cream mixture until dough comes together. Knead the dough on a lightly floured surface until firm and smooth. Divide the dough in half, then roll out one half to 1/8 inch thickness. Cut into 3 inch rounds using a biscuit cutter.\r\n\r\nPlace a small spoonful of the mashed potato filling into the center of each round. Moisten the edges with water, fold over, and press together with a fork to seal. Repeat procedure with the remaining dough and the sauerkraut filling.\r\n\r\nBring a large pot of lightly salted water to a boil. Add perogies and cook for 3 to 5 minutes or until pierogi float to the top. Remove with a slotted spoon.	A classic Polish dish, Pierogi are boiled or fried dumplings filled with a variety of savory or sweet fillings, such as cheese and potatoes, sauerkraut and mushrooms, or fruit.	40	https://ftp.goit.study/img/so-yummy/preview/Pierogi%20_Polish%20Dumplings_.jpg	2025-07-09 17:36:39.331+00	2025-07-09 17:36:39.331+00
132	Snert (Dutch Split Pea Soup)	13	14	3	Gather the ingredients.\r\n\r\nIn a large soup pot, bring water, split peas, pork belly or bacon, pork chop, and bouillon cube to a boil. Reduce the heat to a simmer, cover and let cook for 45 minutes, stirring occasionally and skimming off any foam that rises to the top. \r\n\r\nRemove the pork chop, debone, and thinly slice the meat. Set aside.\r\n\r\nAdd the celery, carrots, potato, onion, leek, and celeriac to the soup. Return to the boil, reduce the heat to a simmer and let cook, uncovered, for another 30 minutes, adding a little extra water if the ingredients start to stick to the bottom of the pot.\r\n\r\nAdd the smoked sausage for the last 15 minutes of cooking time. When the vegetables are tender, remove the bacon and smoked sausage, slice thinly and set aside.\r\n\r\nIf you prefer a smooth consistency, purée the soup with a stick blender. Season to taste with salt and pepper. Add the meat back to the soup, setting some slices of rookworst aside.\r\n\r\nServe in heated bowls or soup plates, garnished with slices of rookworst and chopped celery leaf.\r\n\r\nEnjoy!	A hearty Dutch soup made with split peas, vegetables, and pork or sausage, often served with rye bread and cheese.	90	https://ftp.goit.study/img/so-yummy/preview/Snert%20_Dutch%20Split%20Pea%20Soup_.jpg	2025-07-09 17:36:39.343+00	2025-07-09 17:36:39.343+00
133	Recheado Masala Fish	1	10	3	Soak all the spices, ginger, garlic, tamarind pulp and kashmiri chilies except oil in vinegar.\r\nAdd sugar and salt.\r\nAlso add turmeric powder.\r\nCombine all nicely and marinate for 35-40 mins.\r\nGrind the mixture until soft and smooth. Add more vinegar if required but ensure the paste has to be thick so add vinegar accordingly. If the masala paste is thin then it would not stick to the fish.\r\nRinse the fish slit from the center and give some incision from the top. You could see the fish below for clarity.\r\nNow stuff the paste into the center and into the incision. Coat the entire fish with this paste. Marinate the fish for 30 mins.\r\nPlace oil in a shallow pan, once oil is quite hot shallow fry the stuffed mackerels.\r\nFry until golden brown from both sides\r\nServe the recheado mackerels hot with salad, lime wedges, rice and curry.\r\nNotes\r\n1. Ensure the masala paste is thick else the result won't be good.\r\n2. If you aren't able to find kashmiri chilies then use bedgi chilies or kashmiri red chili powder.\r\n3. You could use white vinegar or coconut vinegar.\r\n4. Any left over paste could be stored in the fridge for future use.\r\n5. Cinnamon could be avoided as it's a strong spice used generally for meat or chicken.	A Goan specialty of fish marinated with a spicy masala paste and fried or grilled to perfection.	105	https://ftp.goit.study/img/so-yummy/preview/Recheado%20Masala%20Fish.jpg	2025-07-09 17:36:39.355+00	2025-07-09 17:36:39.355+00
134	Choc Chip Pecan Pie	6	11	3	First, make the pastry. Tip the ingredients into a food processor with 1 /4 tsp salt. Blend until the mixture resembles breadcrumbs. Drizzle 2-3 tsp cold water into the funnel while the blade is running – the mixture should start to clump together. Tip onto a work surface and bring together, kneading briefly into a ball. Pat into a disc, wrap in cling film, and chill for at least 20 mins. Heat oven to 200C/180C fan/gas 6.\r\n\r\nRemove the pastry from the fridge and leave at room temperature for 5 mins to soften. Flour the work surface, then unwrap the pastry and roll to a circle the thickness of a £1 coin. Use the pastry to line a deep, 23cm round fluted tin – mine was about 3cm deep. Press the pastry into the corners and up the sides, making sure there are no gaps. Leave 1cm pastry overhanging (save some of the pastry scraps for later). Line with baking parchment (scrunch it up first to make it more pliable) and fill with baking beans. Blind-bake for 15-20 mins until the sides are set, then remove the parchment and beans and return to the oven for 5 mins until golden brown. Trim the pastry so it’s flush with the top of the tin – a small serrated knife is best for this. If there are any cracks, patch them up with the pastry scraps.\r\n\r\nMeanwhile, weigh the butter, syrup and sugars into a pan, and add 1 /4 tsp salt. Heat until the butter has melted and the sugar dissolved, stirring until smooth. Remove from the heat and cool for 10 mins. Reduce oven to 160C/140C fan/gas 3.\r\n\r\nBeat the eggs in a bowl. Add the syrup mixture, vanilla and pecans, and mix until well combined. Pour half the mixture into the tart case, scatter over half the chocolate chips, then cover with the remaining filling and chocolate chips. Bake on the middle shelf for 50-55 mins until set. Remove from the oven and leave to cool, then chill for at least 2 hrs before serving.	A delicious pie made with chocolate chips and pecans, perfect for any occasion.	205	https://ftp.goit.study/img/so-yummy/preview/Choc%20Chip%20Pecan%20Pie.jpg	2025-07-09 17:36:39.368+00	2025-07-09 17:36:39.368+00
135	Bubble & Squeak	8	7	3	Melt the fat in a non-stick pan, allow it to get nice and hot, then add the bacon. As it begins to brown, add the onion and garlic. Next, add the sliced sprouts or cabbage and let it colour slightly. All this will take 5-6 mins.\r\nNext, add the potato. Work everything together in the pan and push it down so that the mixture covers the base of the pan – allow the mixture to catch slightly on the base of the pan before turning it over and doing the same again. It’s the bits of potato that catch in the pan that define the term ‘bubble and squeak’, so be brave and let the mixture colour. Cut into wedges and serve.	A delicious dish made with leftover vegetables, typically served as a breakfast side.	12	https://ftp.goit.study/img/so-yummy/preview/Bubble%20_%20Squeak.jpg	2025-07-09 17:36:39.382+00	2025-07-09 17:36:39.382+00
154	Squash linguine	9	2	3	Heat oven to 200C/180C fan/gas 6. Put the squash and garlic on a baking tray and drizzle with the olive oil. Roast for 35-40 mins until soft. Season.\r\nCook the pasta according to pack instructions. Drain, reserving the water. Use a stick blender to whizz the squash with 400ml cooking water. Heat some oil in a frying pan, fry the sage until crisp, then drain on kitchen paper. Tip the pasta and sauce into the pan and warm through. Scatter with sage.	A light and flavorful pasta dish made with spaghetti squash and a variety of herbs and spices.	55	https://ftp.goit.study/img/so-yummy/preview/Squash%20linguine.jpg	2025-07-09 17:36:39.642+00	2025-07-09 17:36:39.642+00
136	Rigatoni with fennel sausage sauce	2	3	3	Heat a tablespoon of oil in a large saute pan for which you have a lid. Add the sausage pieces and fry on a medium-high heat for 10 minutes, stirring regularly, until golden-brown all over. Transfer the sausages to a plate, then add the onion and fennel to the hot pan and fry for 15 minutes, stirring once in a while, until soft and caramelised; if the pan goes a bit dry, add a teaspoon or so of extra oil. Stir in the paprika, garlic and half the fennel seeds, fry for two minutes more, then pour on the wine and boil for 30 seconds, to reduce by half. Add the tomatoes, sugar, 100ml water, the seared sausage and half a teaspoon of salt, cover and simmer for 30 minutes; remove the lid after 10 minutes, and cook until the sauce is thick and rich. Remove from the heat, stir through the olives and remaining fennel seeds and set aside until you’re ready to serve.\r\n\r\nBring a large pot of salted water to a boil, add the pasta and cook for 12-14 minutes (or according to the instructions on the packet), until al dente. Meanwhile, reheat the sauce. Drain the pasta, return it to the pot, stir in a tablespoon of oil, then divide between the bowls. \r\n\r\nPut all the pesto ingredients except the basil in the small bowl of a food processor. Add a tablespoon of water and blitz to a rough paste. Add the basil, then blitz until just combined (the pesto has a much better texture if the basil is not overblended).\r\n\r\nSpoon over the ragù and top with a spoonful of pesto. Finish with a sprinkling of chopped fennel fronds, if you have any, and serve at once.	An Italian pasta dish made with rigatoni and a sauce	75	https://ftp.goit.study/img/so-yummy/preview/Rigatoni%20with%20fennel%20sausage%20sauce.jpg	2025-07-09 17:36:39.387+00	2025-07-09 17:36:39.387+00
137	Tahini Lentils	9	3	3	In a jug, mix the tahini with the zest and juice of the lemon and 50ml of cold water to make a runny dressing. Season to taste, then set aside.\r\nHeat the oil in a wok or large frying pan over a medium-high heat. Add the red onion, along with a pinch of salt, and fry for 2 mins until starting to soften and colour. Add the garlic, pepper, green beans and courgette and fry for 5 min, stirring frequently.\r\nTip in the kale, lentils and the tahini dressing. Keep the pan on the heat for a couple of mins, stirring everything together until the kale is wilted and it’s all coated in the creamy dressing.	A flavorful vegetarian dish made with lentils, tahini, and a variety of spices and herbs.	25	https://ftp.goit.study/img/so-yummy/preview/Tahini%20Lentils.jpg	2025-07-09 17:36:39.4+00	2025-07-09 17:36:39.4+00
138	Cream Cheese Tart	3	4	3	Crust: make a dough from 250g flour (I like mixing different flours like plain and wholegrain spelt flour), 125g butter, 1 egg and a pinch of salt, press it into a tart form and place it in the fridge. Filling: stir 300g cream cheese and 100ml milk until smooth, add in 3 eggs, 100g grated parmesan cheese and season with salt, pepper and nutmeg. Take the crust out of the fridge and prick the bottom with a fork. Pour in the filling and bake at 175 degrees C for about 25 minutes. Cover the tart with some aluminium foil after half the time. In the mean time, slice about 350g mini tomatoes. In a small pan heat 3tbsp olive oil, 3tbsp white vinegar, 1 tbsp honey, salt and pepper and combine well. Pour over the tomato slices and mix well. With a spoon, place the tomato slices on the tart, avoiding too much liquid on it. Decorate with basil leaves and enjoy	A tart made with a sweet shortcrust pastry shell and a filling made with cream cheese, sugar, eggs, and vanilla extract.	50	https://ftp.goit.study/img/so-yummy/preview/Cream%20Cheese%20Tart.jpg	2025-07-09 17:36:39.417+00	2025-07-09 17:36:39.417+00
139	Fettucine alfredo	11	2	3	In a medium saucepan, stir the clotted cream, butter and cornflour over a low-ish heat and bring to a low simmer. Turn off the heat and keep warm.\r\nMeanwhile, put the cheese and nutmeg in a small bowl and add a good grinding of black pepper, then stir everything together (don’t add any salt at this stage).\r\nPut the pasta in another pan with 2 tsp salt, pour over some boiling water and cook following pack instructions (usually 3-4 mins). When cooked, scoop some of the cooking water into a heatproof jug or mug and drain the pasta, but not too thoroughly.\r\nAdd the pasta to the pan with the clotted cream mixture, then sprinkle over the cheese and gently fold everything together over a low heat using a rubber spatula. When combined, splash in 3 tbsp of the cooking water. At first, the pasta will look wet and sloppy: keep stirring until the water is absorbed and the sauce is glossy. Check the seasoning before transferring to heated bowls. Sprinkle over some chives or parsley, then serve immediately.	Creamy pasta with Parmesan cheese	30	https://ftp.goit.study/img/so-yummy/preview/Fettucine%20alfredo.jpg	2025-07-09 17:36:39.432+00	2025-07-09 17:36:39.432+00
140	Pumpkin Pie	6	11	3	Place the pumpkin in a large saucepan, cover with water and bring to the boil. Cover with a lid and simmer for 15 mins or until tender. Drain pumpkin; let cool.\r\nHeat oven to 180C/160C fan/gas 4. Roll out the pastry on a lightly floured surface and use it to line a 22cm loose-bottomed tart tin. Chill for 15 mins. Line the pastry with baking parchment and baking beans, then bake for 15 mins. Remove the beans and paper, and cook for a further 10 mins until the base is pale golden and biscuity. Remove from the oven and allow to cool slightly.\r\nIncrease oven to 220C/200C fan/gas 7. Push the cooled pumpkin through a sieve into a large bowl. In a separate bowl, combine the sugar, salt, nutmeg and half the cinnamon. Mix in the beaten eggs, melted butter and milk, then add to the pumpkin purée and stir to combine. Pour into the tart shell and cook for 10 mins, then reduce the temperature to 180C/160C fan/gas 4. Continue to bake for 35-40 mins until the filling has just set.\r\nLeave to cool, then remove the pie from the tin. Mix the remaining cinnamon with the icing sugar and dust over the pie. Serve chilled.	A traditional pie made with pumpkin puree and warming spices, perfect for fall.	105	https://ftp.goit.study/img/so-yummy/preview/Pumpkin%20Pie.jpg	2025-07-09 17:36:39.444+00	2025-07-09 17:36:39.444+00
141	Kafteji	9	18	3	Peel potatoes and cut into 5cm cubes.\r\nPour 1-2 cm of olive oil into a large pan and heat up very hot. Fry potatoes until golden brown for 20 minutes, turning from time to time. Place on kitchen paper to drain.\r\nCut the peppers in half and remove seeds. Rub a little olive oil on them and place the cut side down on a baking tray. Place them under the grill. Grill until the skin is dark and bubbly. While the peppers are still hot, put them into a plastic sandwich bag and seal it. Take them out after 15 minutes and remove skins.\r\nIn the meantime, heat more olive oil another pan. Peel the onions and cut into thin rings. Fry for 15 minutes until golden brown, turning them often. Add the Ras el hanout at the end.\r\nCut the pumpkin into 5cm cubes and fry in the same pan you used for the potatoes for 10-15 minutes until it is soft and slightly browned. Place on kitchen paper.\r\nPour the remaining olive oil out of the pan and put all the cooked vegetables into the pan and mix. Whisk eggs and pour them over the vegetables. Put the lid on the pan so that the eggs cook. Put the contents of the pan onto a large chopping board, add salt and pepper and chopped and mix everything with a big knife.	A Tunisian dish of fried vegetables, including eggplant, potato, and pepper, served with harissa sauce. A delicious vegetarian option for any meal.	95	https://ftp.goit.study/img/so-yummy/preview/Kafteji.jpg	2025-07-09 17:36:39.458+00	2025-07-09 17:36:39.458+00
142	Jam Roly-Poly	6	7	3	Put a deep roasting tin onto the bottom shelf of the oven, and make sure that there’s another shelf directly above it. Pull the roasting tin out on its shelf, fill two-thirds with boiling water from the kettle, then carefully slide it back in. Heat oven to 180C/160C fan/gas 4. Tear off a large sheet of foil and greaseproof paper (about 30 x 40cm). Sit the greaseproof on top of the foil and butter it.\r\nTip butter, flour and vanilla seeds into a food processor; pulse until the butter has disappeared. Tip into a mixing bowl. Stir through the suet, pour in the milk and work together with a cutlery knife until you get a sticky dough. You may need a drop more milk, depending on your flour.\r\nTip the dough out onto a floured surface, quickly pat together to smooth, then roll out to a square roughly 25 x 25cm. Spread the jam all over, leaving a gap along one edge, then roll up from the opposite edge. Pinch the jam-free edge into the dough where it meets, and pinch the ends roughly, too. Carefully lift onto the greased paper, join-side down (you might find a flat baking sheet helpful for this), loosely bring up the paper and foil around it, then scrunch together along the edges and ends to seal. The roly-poly will puff quite a bit during cooking so don’t wrap it tightly. Lift the parcel directly onto the rack above the tin and cook for 1 hr.\r\nLet the pudding sit for 5 mins before unwrapping, then carefully open the foil and paper, and thickly slice to serve.	A simple yet delicious pudding made with suet pastry and jam, often served with custard.	65	https://ftp.goit.study/img/so-yummy/preview/Jam%20Roly-Poly.jpg	2025-07-09 17:36:39.485+00	2025-07-09 17:36:39.485+00
143	Kapsalon	2	14	3	Cut the meat into strips. Heat oil in a pan and fry the strips for 6 minutes until it's ready.\r\nBake the fries until golden brown in a deep fryrer. When ready transfer to a backing dish. Make sure the fries are spread over the whole dish.\r\nCover the fries with a new layer of meat and spread evenly.\r\nAdd a layer of cheese over the meat. You can also use grated cheese. When done put in the oven for a few minutes until the cheese is melted.\r\nChop the lettuce, tomato and cucumber in small pieces and mix together. for a basic salad. As extra you can add olives jalapenos and a red union.\r\nDived the salad over the dish and Serve with garlicsauce and hot sauce	A Dutch fast food dish made with fries, kebab, cheese, and salad.	63	https://ftp.goit.study/img/so-yummy/preview/Kapsalon.jpg	2025-07-09 17:36:39.493+00	2025-07-09 17:36:39.493+00
144	Clam chowder	3	11	3	Rinse the clams in several changes of cold water and drain well. Tip the clams into a large pan with 500ml of water. Cover, bring to the boil and simmer for 2 mins until the clams have just opened. Tip the contents of the pan into a colander over a bowl to catch the clam stock. When cool enough to handle, remove the clams from their shells – reserving a handful of empty shells for presentation if you want. Strain the clam stock into a jug, leaving any grit in the bottom of the bowl. You should have around 800ml stock.\r\nHeat the butter in the same pan and sizzle the bacon for 3-4 mins until it starts to brown. Stir in the onion, thyme and bay and cook everything gently for 10 mins until the onion is soft and golden. Scatter over the flour and stir in to make a sandy paste, cook for 2 mins more, then gradually stir in the clam stock then the milk and the cream.\r\nThrow in the potatoes, bring everything to a simmer and leave to bubble away gently for 10 mins or until the potatoes are cooked. Use a fork to crush a few of the potato chunks against the side of the pan to help thicken – you still want lots of defined chunks though. Stir through the clam meat and the few clam shells, if you've gone down that route, and simmer for a minute to reheat. Season with plenty of black pepper and a little salt, if needed, then stir through the parsley just before ladling into bowls or hollowed-out crusty rolls.	A creamy soup made with clams, potatoes, and other ingredients. Perfect for a cozy night in.	50	https://ftp.goit.study/img/so-yummy/preview/Clam%20chowder.jpg	2025-07-09 17:36:39.503+00	2025-07-09 17:36:39.503+00
145	Fish Stew with Rouille	1	9	3	Twist the heads from the prawns, then peel away the legs and shells, but leave the tails intact. Devein each prawn. Fry the shells in 1 tbsp oil for 5 mins, until dark pink and golden in patches. Add the wine, boil down by two thirds, then pour in the stock. Strain into a jug, discarding the shells.\r\nHeat the rest of the oil in a deep frying pan or casserole. Add the fennel, onion and garlic, season, then cover and gently cook for 10 mins until softened. Meanwhile, peel the potato and cut into 2cm-ish chunks. Put into a pan of cold water, bring to the boil and cook for 5 mins until almost tender. Drain in a colander.\r\nPeel a strip of zest from the orange. Put the zest, star anise, bay and ½ tsp harissa into the pan. Fry gently, uncovered, for 5-10 mins, until the vegetables are soft, sweet and golden.\r\nStir in the tomato purée, cook for 2 mins, then add the tomatoes and stock. Simmer for 10 mins until the sauce thickens slightly. Season to taste. The sauce can be made ahead, then reheated later in the day. Meantime, scrub the mussels or clams and pull away any stringy beards. Any that are open should be tapped sharply on the worktop – if they don’t close after a few seconds, discard them.\r\nReheat the sauce if necessary, then stir the potato, chunks of fish and prawns very gently into the stew. Bring back to the boil, then cover and gently simmer for 3 mins. Scatter the mussels or clams over the stew, then cover and cook for 2 mins more or until the shells have opened wide. Discard any that remain closed. The chunks of fish should flake easily and the prawns should be pink through. Scatter with the thyme leaves.\r\nTo make the quick rouille, stir the rest of the harissa through the mayonnaise. Serve the stew in bowls, topped with spoonfuls of rouille, which will melt into the sauce and enrich it. Have some good bread ready, as you’ll definitely want to mop up the juices.	A hearty French fish stew made with white fish, vegetables, and potatoes, topped with a spicy rouille sauce.	45	https://ftp.goit.study/img/so-yummy/preview/Fish%20Stew%20with%20Rouille.jpg	2025-07-09 17:36:39.518+00	2025-07-09 17:36:39.518+00
146	Sugar Pie	6	16	3	Preheat oven to 350 degrees F (175 degrees C). Grease a 9-inch pie dish.\r\nPlace the brown sugar and butter in a mixing bowl, and beat them together with an electric mixer until creamy and very well combined, without lumps. Beat in eggs, one at a time, incorporating the first egg before adding the next one. Add the vanilla extract and salt; beat the flour in, a little at a time, and then the milk, making a creamy batter. Pour the batter into the prepared pie dish.\r\nBake in the preheated oven for 35 minutes; remove pie, and cover the rim with aluminum foil to prevent burning. Return to oven, and bake until the middle sets and the top forms a crusty layer, about 15 more minutes. Let the pie cool to room temperature, then refrigerate for at least 1 hour before serving.	A traditional dessert from Quebec, Canada, made with a flaky pastry crust filled with a rich mixture of brown sugar, cream, and flour.	50	https://ftp.goit.study/img/so-yummy/preview/Sugar%20Pie.jpg	2025-07-09 17:36:39.539+00	2025-07-09 17:36:39.539+00
147	Szechuan Beef	5	22	3	STEP 1 - MARINATING THE BEEF\r\nIn a bowl, add the beef, salt, sesame seed oil, white pepper, egg white, 2 Tablespoon of corn starch and 1 Tablespoon of oil.\r\nSTEP 2 - STIR FRY\r\nFirst Cook the beef by adding 2 Tablespoon of oil until the beef is golden brown.\r\nSet the beef aside\r\nIn a wok add 1 Tablespoon of oil, minced ginger, minced garlic and stir-fry for few seconds.\r\nNext add all of the vegetables and then add sherry cooking wine and 1 cup of water.\r\nTo make the sauce add oyster sauce, hot pepper sauce, and sugar.\r\nadd the cooked beef and 1 spoon of soy sauce\r\nTo thicken the sauce, whisk together 1 Tablespoon of cornstarch and 2 Tablespoon of water in a bowl and slowly add to your stir-fry until it's the right thickness.	A spicy Chinese dish made with tender strips of beef, vegetables, and Szechuan peppercorns. Served with rice or noodles.	35	https://ftp.goit.study/img/so-yummy/preview/Szechuan%20Beef.jpg	2025-07-09 17:36:39.547+00	2025-07-09 17:36:39.547+00
149	Tarte Tatin	6	9	3	Roll the pastry to a 3mm-thick round on a lightly floured surface and cut a 24cm circle, using a plate as a guide. Lightly prick all over with a fork, wrap in cling film on a baking sheet and freeze while preparing the apples.\r\nHeat oven to 180C/160C fan/gas 4. Peel, quarter and core the apples. Put the sugar in a flameproof 20cm ceramic Tatin dish or a 20cm ovenproof heavy-based frying pan and place over a medium-high heat. Cook the sugar for 5-7 mins to a dark amber caramel syrup that’s starting to smoke, then turn off the heat and stir in the 60g diced chilled butter.\r\nTo assemble the Tarte Tatin, arrange the apple quarters very tightly in a circle around the edge of the dish first, rounded-side down, then fill in the middle in a similar fashion. Gently press with your hands to ensure there are no gaps. Brush the fruit with the melted butter.\r\nBake in the oven for 30 mins, then remove and place the disc of frozen puff pastry on top – it will quickly defrost. Tuck the edges down the inside of the dish and, with a knife, prick a few holes in the pastry to allow steam to escape. Bake for a further 40-45 mins until the pastry is golden brown and crisp.\r\nAllow to cool to room temperature for 1 hr before running a knife around the edge of the dish and inverting it onto a large serving plate that is deep enough to contain the juices. Serve with crème fraîche or vanilla ice cream.	A classic French dessert with caramelized apples baked on top of a buttery pastry crust.	80	https://ftp.goit.study/img/so-yummy/preview/Tarte%20Tatin.jpg	2025-07-09 17:36:39.573+00	2025-07-09 17:36:39.573+00
150	Sticky Toffee Pudding Ultimate	6	7	3	Stone and chop the dates quite small, put them in a bowl, then pour the boiling water over. Leave for about 30 mins until cool and well-soaked, then mash a bit with a fork. Stir in the vanilla extract. Butter and flour seven mini pudding tins (each about 200ml/7fl oz) and sit them on a baking sheet. Heat oven to 180C/fan 160C/gas 4.\r\nWhile the dates are soaking, make the puddings. Mix the flour and bicarbonate of soda together and beat the eggs in a separate bowl. Beat the butter and sugar together in a large bowl for a few mins until slightly creamy (the mixture will be grainy from the sugar). Add the eggs a little at a time, beating well between additions. Beat in the black treacle then, using a large metal spoon, gently fold in one-third of the flour, then half the milk, being careful not to overbeat. Repeat until all the flour and milk is used. Stir the soaked dates into the pudding batter. The mix may look a little curdled at this point and will be like a soft, thick batter. Spoon it evenly between the tins and bake for 20-25 mins, until risen and firm.\r\nMeanwhile, put the sugar and butter for the sauce in a medium saucepan with half the cream. Bring to the boil over a medium heat, stirring all the time, until the sugar has completely dissolved. Stir in the black treacle, turn up the heat slightly and let the mixture bubble away for 2-3 mins until it is a rich toffee colour, stirring occasionally to make sure it doesn’t burn. Take the pan off the heat and beat in the rest of the cream.\r\nRemove the puddings from the oven. Leave in the tins for a few mins, then loosen them well from the sides of the tins with a small palette knife before turning them out. You can serve them now with the sauce drizzled over, but they’ll be even stickier if left for a day or two coated in the sauce. To do this, pour about half the sauce into one or two ovenproof serving dishes. Sit the upturned puddings on the sauce, then pour the rest of the sauce over them. Cover with a loose tent of foil so that the sauce doesn’t smudge (no need to chill).\r\nWhen ready to serve, heat oven to 180C/fan 160C/gas 4. Warm the puddings through, still covered, for 15-20 mins or until the sauce is bubbling. Serve them on their own, or with cream or custard.	Warm toffee pudding with caramel sauce	75	https://ftp.goit.study/img/so-yummy/preview/Sticky%20Toffee%20Pudding%20Ultimate.jpg	2025-07-09 17:36:39.58+00	2025-07-09 17:36:39.58+00
151	Lamb Rogan josh	2	10	3	\r\nPut the onions in a food processor and whizz until very finely chopped. Heat the oil in a large heavy-based pan, then fry the onion with the lid on, stirring every now and then, until it is really golden and soft. Add the garlic and ginger, then fry for 5 mins more.\r\nTip the curry paste, all the spices and the bay leaves into the pan, with the tomato purée. Stir well over the heat for about 30 secs, then add the meat and 300ml water. Stir to mix, turn down the heat, then add the yogurt.\r\nCover the pan, then gently simmer for 40-60 mins until the meat is tender and the sauce nice and thick. Serve scattered with coriander, with plain basmati or pilau rice.	A spicy lamb dish from Kashmiri cuisine, flavored with a blend of aromatic spices and yogurt.	90	https://ftp.goit.study/img/so-yummy/preview/Lamb%20Rogan%20josh.jpg	2025-07-09 17:36:39.592+00	2025-07-09 17:36:39.592+00
152	Lamb Biryani	2	10	3	Grind the cashew, poppy seeds and cumin seeds into a smooth paste, using as little water as possible. Set aside. \r\n\r\nDeep fry the sliced onions when it is hot. Don’t overcrowd the oil. When the onions turn light brown, remove from oil and drain on paper towel. The fried onion will crisp up as it drains. Also fry the cashewnuts till golden brown. Set aside.\r\n\r\nWash the rice and soak in water for twenty minutes.\r\nMeanwhile, take a big wide pan, add oil in medium heat, add the sliced onions, add the blended paste, to it add the green chillies, ginger garlic paste and garlic and fry for a minute.\r\nThen add the tomatoes and sauté them well till they are cooked and not mushy.\r\n\r\nThen to it add the red chilli powder, biryani powder, mint, coriander leaves and sauté them well.\r\nAdd the yogurt and mix well. I always move the skillet away from the heat when adding yogurt which prevents it from curdling.\r\n\r\nNow after returning the skillet back to the stove, add the washed lamb and salt and ½ cup water and mix well. Cook for 1 hour and cook it covered in medium low heat or put it in a pressure cooker for 6 whistles. If the water is not drained totally, heat it by keeping it open.\r\n\r\nTake another big pan, add thrice the cup of rice you use, and boil it. When it is boiling high, add the rice, salt and jeera and mix well. After 7 minutes exact or when the rice is 80% done. Switch off and drain the rice.\r\n\r\nNow, the layering starts. To the lamb, pat and level it. Add the drained hot rice on the top of it. Garnish with fried onions, ghee, mint, coriander leaves and saffron dissolved in milk.\r\n\r\nCover the dish and bake in a 350f oven for 15 minutes or till the cooked but not mushy. Or cook in the stove medium heat for 12 minutes and lowest heat for 5 minutes. And switch off. Mix and serve hot!\r\nNotes\r\n1. If you are cooking in oven, do make sure to cook in a big oven safe pan and cover it tight and then keep in oven for the final step.\r\n2. You can skip biryani masala if you don’t have and add just garam masala (1 tsp and red chilli powder – 3 tsp instead of 1 tsp)\r\n3. If it is spicy in the end, squeeze some lemon, it will reduce the heat and enhance the flavors also.	A flavorful Indian rice dish made with lamb and a blend of aromatic spices.	90	https://ftp.goit.study/img/so-yummy/preview/Lamb%20Biryani.jpg	2025-07-09 17:36:39.606+00	2025-07-09 17:36:39.606+00
153	Coq au vin	4	9	3	Heat 1 tbsp of the oil in a large, heavy-based saucepan or flameproof dish. Tip in the bacon and fry until crisp. Remove and drain on kitchen paper. Add the shallots to the pan and fry, stirring or shaking the pan often, for 5-8 mins until well browned all over. Remove and set aside with the bacon.\r\nPat the chicken pieces dry with kitchen paper. Pour the remaining oil into the pan, then fry half the chicken pieces, turning regularly, for 5-8 mins until well browned. Remove, then repeat with the remaining chicken. Remove and set aside.\r\nScatter in the garlic and fry briefly, then, with the heat medium-high, pour in the brandy or Cognac, stirring the bottom of the pan to deglaze. The alcohol should sizzle and start to evaporate so there is not much left.\r\nReturn the chicken legs and thighs to the pan along with any juices, then pour in a little of the wine, stirring the bottom of the pan again. Stir in the rest of the wine, the stock and tomato purée, drop in the bouquet garni, season with pepper and a pinch of salt, then return the bacon and shallots to the pan. Cover, lower the heat to a gentle simmer, add the chicken breasts and cook for 50 mins-1hr.\r\nJust before ready to serve, heat the oil for the mushrooms in a large non-stick frying pan. Add the mushrooms and fry over a high heat for a few mins until golden. Remove and keep warm.\r\nLift the chicken, shallots and bacon from the pan and transfer to a warmed serving dish. Remove the bouquet garni. To make the thickener, mix the flour, olive oil and butter in a small bowl using the back of a teaspoon. Bring the wine mixture to a gentle boil, then gradually drop in small pieces of the thickener, whisking each piece in using a wire whisk. Simmer for 1-2 mins. Scatter the mushrooms over the chicken, then pour over the wine sauce. Garnish with chopped parsley.	French chicken stew with wine	80	https://ftp.goit.study/img/so-yummy/preview/Coq%20au%20vin.jpg	2025-07-09 17:36:39.622+00	2025-07-09 17:36:39.622+00
155	McSinghs Scotch pie	2	7	3	Heat a large frying pan and toast the cumin seeds for a few minutes, then set aside. Heat the oil in the same pan and fry the onion, garlic, chilli, pepper and a good pinch of salt for around eight minutes, until there is no moisture left. Remove from the heat, stir in the toasted cumin seeds, ground mace (or nutmeg) and ground coriander. Leave to cool.\r\nIn a large bowl mix together the minced lamb, white pepper, fresh coriander, and the cooled spiced onion mixture until combined. Set aside, covered, in the fridge.\r\nPreheat the oven to 200C/400F/Gas 6 and generously grease a 20cm/8in diameter loose-bottomed or springform round cake tin with lard.\r\nTo make the pastry, sift the flour and salt in a large bowl and make a well in the centre.\r\nPut the milk, lard and 90ml/3fl oz of water in a saucepan and heat gently. When the lard has melted, increase the heat and bring to the boil.\r\nPour the boiling liquid into the flour, and use a wooden spoon to combine until cool enough to handle. Bring together into a ball.\r\nDust a work surface with flour and, working quickly, knead the dough briefly – it will be soft and moist. Set aside a third of the pastry and roll the rest out on a well-floured surface. Line the pie dish with the pastry, pressing it right up the sides until it pokes just over the top of the tin.\r\nAdd the filling into the pastry-lined tin bit by bit. As you reach the top, form a slight peak. Roll out the reserved pastry and top the pie with it. Pinch the edges to seal and trim the excess. Poke a hole in the top of the pie and insert a small tube made from aluminium foil to allow steam to escape.\r\nBrush the top of the pie with a little beaten egg yolk, and bake in the preheated oven for 30 minutes (put a tray on the shelf below to catch any drips). Then reduce the temperature to 160C/325F/Gas 3 and cook for a further 1¼ hours until golden-brown. Leave to cool completely before refrigerating for two hours, or overnight.\r\nRun a knife around the edge of the pie, remove from the tin and serve with chutneys, salads or pickles.	A traditional Scottish meat pie, filled with seasoned minced beef and wrapped in pastry.	158	https://ftp.goit.study/img/so-yummy/preview/McSinghs%20Scotch%20pie.jpg	2025-07-09 17:36:39.648+00	2025-07-09 17:36:39.648+00
156	Hot Chocolate Fudge	6	11	3	Line an 8-inch-square baking pan with wax paper or foil, and coat with non-stick spray.\r\nIn a microwave-safe bowl, combine the dark chocolate chips, heavy cream and half of the sweetened condensed milk. Microwave the dark chocolate mixture in 20-second intervals, stirring in between each interval, until the chocolate is melted.\r\nAdd the vanilla extract to the dark chocolate mixture and stir well until smooth.\r\nTransfer the dark chocolate mixture into the prepared pan and spread into an even layer.\r\nIn a separate bowl, combine the white chocolate chips with the remaining half of the sweetened condensed milk. Microwave the white chocolate mixture in 20-second intervals, stirring in between each interval, until the chocolate is melted.\r\nEvenly spread the white chocolate mixture on top of dark chocolate layer.\r\nTop the chocolate layers with the Mallow Bits or miniature marshmallows, and gently press them down.\r\nRefrigerate for 4 hours, or until set.\r\nRemove the fudge and wax paper from the pan. Carefully peel all of the wax paper from the fudge.\r\nCut the fudge into bite-sized pieces and serve.	A decadent chocolate fudge made with hot cocoa mix and topped with marshmallows.	350	https://ftp.goit.study/img/so-yummy/preview/Hot%20Chocolate%20Fudge.jpg	2025-07-09 17:36:39.665+00	2025-07-09 17:36:39.665+00
157	Banana Pancakes	6	11	3	In a bowl, mash the banana with a fork until it resembles a thick purée. Stir in the eggs, baking powder and vanilla.\r\nHeat a large non-stick frying pan or pancake pan over a medium heat and brush with half the oil. Using half the batter, spoon two pancakes into the pan, cook for 1-2 mins each side, then tip onto a plate. Repeat the process with the remaining oil and batter. Top the pancakes with the pecans and raspberries.	A twist on classic pancakes, made with mashed bananas for added flavor and nutrition.	15	https://ftp.goit.study/img/so-yummy/preview/Banana%20Pancakes.jpg	2025-07-09 17:36:39.671+00	2025-07-09 17:36:39.671+00
158	Spaghetti Bolognese	5	2	3	Put the onion and oil in a large pan and fry over a fairly high heat for 3-4 mins. Add the garlic and mince and fry until they both brown. Add the mushrooms and herbs, and cook for another couple of mins.\r\n\r\nStir in the tomatoes, beef stock, tomato ketchup or purée, Worcestershire sauce and seasoning. Bring to the boil, then reduce the heat, cover and simmer, stirring occasionally, for 30 mins.\r\n\r\nMeanwhile, cook the spaghetti in a large pan of boiling, salted water, according to packet instructions. Drain well, run hot water through it, put it back in the pan and add a dash of olive oil, if you like, then stir in the meat sauce. Serve in hot bowls and hand round Parmesan cheese, for sprinkling on top.	An Italian pasta dish made with spaghetti and a meat-based sauce, typically containing beef, tomatoes, onions, garlic, and herbs.	45	https://ftp.goit.study/img/so-yummy/preview/Spaghetti%20Bolognese.jpg	2025-07-09 17:36:39.678+00	2025-07-09 17:36:39.678+00
159	Vietnamese Grilled Pork (bun-thit-nuong)	8	17	3	Slice the uncooked pork thinly, about ⅛". It helps to slightly freeze it (optional).\r\nMince garlic and shallots. Mix in a bowl with sugar, fish sauce, thick soy sauce, pepper, and oil until sugar dissolves.\r\nMarinate the meat for 1 hour, or overnight for better results.\r\nBake the pork at 375F for 10-15 minutes or until about 80% cooked. Finish cooking by broiling in the oven until a nice golden brown color develops, flipping the pieces midway.\r\nAssemble your bowl with veggies, noodles, and garnish. Many like to mix the whole bowl up and pour the fish sauce on top, but I like to make individual bites and sauce it slowly.	A flavorful Vietnamese dish made with grilled pork and served over rice noodles.	75	https://ftp.goit.study/img/so-yummy/preview/Vietnamese%20Grilled%20Pork%20_bun-thit-nuong_.jpg	2025-07-09 17:36:39.691+00	2025-07-09 17:36:39.691+00
160	Eton Mess	6	7	3	Purée half the strawberries in a blender. Chop the remaining strawberries, reserving four for decoration.\r\nWhip the double cream until stiff peaks form, then fold in the strawberry purée and crushed meringue. Fold in the chopped strawberries and ginger cordial, if using.\r\nSpoon equal amounts of the mixture into four cold wine glasses. Serve garnished with the remaining strawberries and a sprig of mint.	A traditional English dessert made with whipped cream, meringue, and fresh berries.	20	https://ftp.goit.study/img/so-yummy/preview/Eton%20Mess.jpg	2025-07-09 17:36:39.703+00	2025-07-09 17:36:39.703+00
161	Lamb Tagine	2	3	3	Heat the olive oil in a heavy-based pan and add the onion and carrot. Cook for 3- 4 mins until softened.\r\n\r\nAdd the diced lamb and brown all over. Stir in the garlic and all the spices and cook for a few mins more or until the aromas are released.\r\n\r\nAdd the honey and apricots, crumble in the stock cube and pour over roughly 500ml boiling water or enough to cover the meat. Give it a good stir and bring to the boil. Turn down to a simmer, put the lid on and cook for 1 hour.\r\n\r\nRemove the lid and cook for a further 30 mins, then stir in the squash. Cook for 20 – 30 mins more until the squash is soft and the lamb is tender. Serve alongside rice or couscous and sprinkle with parsley and pine nuts, if using.	A Moroccan stew made with lamb, vegetables, and spices. Served with couscous or rice.	120	https://ftp.goit.study/img/so-yummy/preview/Lamb%20Tagine.jpg	2025-07-09 17:36:39.707+00	2025-07-09 17:36:39.707+00
221	Hot and Sour Soup	8	22	3	STEP 1 - MAKING THE SOUP\r\nIn a wok add chicken broth and wait for it to boil.\r\nNext add salt, sugar, sesame seed oil, white pepper, hot pepper sauce, vinegar and soy sauce and stir for few seconds.\r\nAdd Tofu, mushrooms, black wood ear mushrooms to the wok.\r\nTo thicken the sauce, whisk together 1 Tablespoon of cornstarch and 2 Tablespoon of water in a bowl and slowly add to your soup until it's the right thickness.\r\nNext add 1 egg slightly beaten with a knife or fork and add it to the soup and stir for 8 seconds\r\nServe the soup in a bowl and add the bbq pork and sliced green onions on top.	A classic Chinese soup with a spicy and tangy broth, tofu, mushrooms, and bamboo shoots. A delicious and warming soup for any occasion.	15	https://ftp.goit.study/img/so-yummy/preview/Hot%20and%20Sour%20Soup.jpg	2025-07-09 17:36:40.32+00	2025-07-09 17:36:40.32+00
162	Mushroom & Chestnut Rotolo	9	7	3	Soak the dried mushrooms in 350ml boiling water and set aside until needed. Blitz ¾ of the chestnuts with 150ml water until creamy. Roughly chop the remaining chestnuts.\r\nHeat 2 tbsp olive oil in a large non-stick frying pan. Fry the shallots with a pinch of salt until softened, then add the garlic, chopped chestnuts and rosemary, and fry for 2 mins more. Add the wild mushrooms, 2 tbsp oil and some seasoning. Cook for 3 mins until they begin to soften. Drain and roughly chop the dried mushrooms (reserve the soaking liquid), then add those too, along with the soy sauce, and fry for 2 mins more.\r\nWhisk the wine, reserved mushroom liquid and chestnut cream together to create a sauce. Season, then add half to the mushroom mixture in the pan and cook for 1 min until the sauce becomes glossy. Remove and discard the rosemary sprigs, then set the mixture aside.\r\nHeat oven to 180C/160C fan/gas 4. Bring a large pan of salted water to the boil and get a large bowl of ice water ready. Drop the lasagne sheets into the boiling water for 2 mins or until pliable and a little cooked, then immediately plunge them into the cold water. Using your fingers, carefully separate the sheets and transfer to a clean tea towel. Spread a good spoonful of the sauce on the bottom two thirds of each sheet, then, rolling away from yourself, roll up the shorter ends. Cut each roll in half, then position the rolls of pasta cut-side up in a pie dish that you are happy to serve from at the table. If you have any mushroom sauce remaining after you’ve rolled up all the sheets, simply push it into some of the exposed rolls of pasta.\r\nPour the rest of the sauce over the top of the pasta, then bake for 10 mins or until the pasta no longer has any resistance when tested with a skewer.\r\nMeanwhile, put the breadcrumbs, the last 2 tbsp olive oil, sage leaves and some seasoning in a bowl, and toss everything together. Scatter the rotolo with the crumbs and sage, then bake for another 10 mins, until the top is golden and the sage leaves are crispy. Leave to cool for 10 mins to allow the pasta to absorb the sauce, then drizzle with a little truffle oil, if you like, before taking your dish to the table.	A vegetarian dish made with pasta, mushrooms, and chestnuts, rolled and baked to perfection.	90	https://ftp.goit.study/img/so-yummy/preview/Mushroom%20_%20Chestnut%20Rotolo.jpg	2025-07-09 17:36:39.722+00	2025-07-09 17:36:39.722+00
163	Canadian Butter Tarts	6	16	3	Preheat the oven to fan 170C/ conventional 190C/gas 5. Roll out the pastry on a lightly floured surface so it’s slightly thinner than straight from the pack. Then cut out 18-20 rounds with a 7.5cm fluted cutter, re-rolling the trimmings. Use the rounds to line two deep 12-hole tart tins (not muffin tins). If you only have a regular-sized, 12-hole tart tin you will be able to make a few more slightly shallower tarts.\r\nBeat the eggs in a large bowl and combine with the rest of the ingredients except the walnuts. Tip this mixture into a pan and stir continuously for 3-4 minutes until the butter melts, and the mixture bubbles and starts to thicken. It should be thick enough to coat the back of a wooden spoon. Don’t overcook, and be sure to stir all the time as the mixture can easily burn. Remove from the heat and stir in the nuts.\r\nSpoon the filling into the unbaked tart shells so it’s level with the pastry. Bake for 15-18 minutes until set and pale golden. Leave in the tin to cool for a few minutes before lifting out on to a wire rack. Serve warm or cold.	A sweet pastry consisting of a filling of butter, sugar, syrup, and egg, baked in a pastry shell and commonly enjoyed in Canada.	35	https://ftp.goit.study/img/so-yummy/preview/Canadian%20Butter%20Tarts.jpg	2025-07-09 17:36:39.732+00	2025-07-09 17:36:39.732+00
164	Croatian lamb peka	5	21	3	Preheat oven to 200°C fan / 220°C / 425°F / Gas mark 7\r\nIf you have not bought diced lamb, cut your lamb shoulder or leg into large chunks and place to one side.\r\nChunks of chopped lamb of a red chopping board\r\nMake oil marinade -\r\nMix 80ml of olive oil in a bowl with garlic puree, sundried tomato puree ,black pepper and salt.\r\nolive oil, gia sundried tomato puree and gia garlic puree and black pepper mixed together in a silver bowl to make Croatian peka\r\nAdd potatoes and vegetables into a large lidded casserole dish.\r\nChopped up vegetables which consist of chopped up red onion, courgette, potatoes red peppers in a cast iron pan\r\nPlace diced lamb on top of the vegetables, pour the marinade and wine over the top.\r\nChunks of lamb covered in in a sundried tomato oil sauce which is on top of chopped red onion, aubergine, courgette and potatoes in a cast iron pan\r\nAdd the rosemary, thyme and sage, trying to keep the herbs on top.\r\nSo you can easily remove the herb stalks once cooked.\r\nChunks of lamb coated in a sundried tomato oil sauce and covered with thyme, rosemary and sage which is on top of chopped red onion, aubergine, courgette and potatoes in a cast iron pan\r\nPlace lid on the casserole dish and cook for 1hr 30 minute\r\nIf you do not have a lid cover very well with kitchen foil\r\nCast iron dish with lid on in the oven\r\nTake the lid off, remove any thick herb stems. Stir in 2 tbsp of olive oil.\r\nCook for a further 20-30 mins.\r\nCooked Croatian Lamb Peka in a cast iron pan in the oven\r\nServe with fresh homemade bread to dip into the juices.	A slow-cooked Croatian dish of lamb and vegetables, cooked in a special metal or clay pot called a peka. The dish is cooked over an open flame, with hot coals placed on top of the pot, resulting in tender and flavorful meat with a crispy outer layer.	110	https://ftp.goit.study/img/so-yummy/preview/Croatian%20lamb%20peka.jpg	2025-07-09 17:36:39.738+00	2025-07-09 17:36:39.738+00
165	Toad In The Hole	8	7	3	Preheat the oven to 200°C/fan180°C/gas 6. fry sausages in a non-stick pan until browned.\r\nDrizzle vegetable oil in a 30cm x 25cm x 6cm deep roasting tray and heat in the oven for 5 minutes.\r\nPut the plain flour in a bowl, crack in the medium free-range eggs, then stir in the grated horseradish. Gradually beat in the semi-skimmed milk. Season.\r\nPut the sausages into the hot roasting tray and pour over the batter. Top with cherry tomatoes on the vine and cook for 30 minutes until puffed and golden.	Sausages in Yorkshire pudding batter	40	https://ftp.goit.study/img/so-yummy/preview/Toad%20In%20The%20Hole.jpg	2025-07-09 17:36:39.75+00	2025-07-09 17:36:39.75+00
166	Classic Christmas pudding	6	7	3	Get everything for the pudding prepared. Chop the almonds coarsely. Peel, core and chop the cooking apples. Sharpen your knife and chop the candied peel. (You can chop the almonds and apples in a food processor, but the peel must be done by hand.) Grate three quarters of the nutmeg (sounds a lot but it's correct).\r\n\r\nMix the almonds, apples, candied peel, nutmeg, raisins, flour, breadcrumbs, light muscovado sugar, eggs and 2 tbsp brandy or cognac in a large bowl.\r\n\r\nHolding the butter in its wrapper, grate a quarter of it into the bowl, then stir everything together. Repeat until all the butter is grated, then stir for 3-4 mins – the mixture is ready when it subsides slightly after each stir. Ask the family to stir too, and get everyone to make a wish.\r\n\r\nGenerously butter two 1.2 litre bowls and put a circle of baking parchment in the bottom of each. Pack in the pudding mixture. Cover with a double layer of baking parchment, pleating it to allow for expansion, then tie with string (keep the paper in place with a rubber band while tying). Trim off any excess paper.\r\n\r\nNow stand each bowl on a large sheet of foil and bring the edges up over the top, then put another sheet of foil over the top and bring it down underneath to make a double package (this makes the puddings watertight). Tie with more string, and make a handle for easy lifting in and out of the pan. Watch our video to see how to tie up a pudding correctly.\r\n\r\nBoil or oven steam the puddings for 8 hrs, topping up with water as necessary. Remove from the pans and leave to cool overnight. When cold, discard the messy wrappings and re-wrap in new baking parchment, foil and string. Store in a cool, dry place until Christmas.\r\n\r\nTo make the brandy butter, cream the butter with the orange zest and icing sugar. Gradually beat in the brandy or cognac and chopped stem ginger. Put in a small bowl, fork the top attractively and put in the fridge to set. The butter will keep for a week in the fridge, or it can be frozen for up to six weeks.\r\n\r\nOn Christmas Day, boil or oven steam for 1 hr. Unwrap and turn out. To flame, warm 3-4 tbsp brandy in a small pan, pour it over the pudding and set light to it.	A traditional British dessert made with dried fruits, spices, and suet, often served with brandy sauce.	480	https://ftp.goit.study/img/so-yummy/preview/Classic%20Christmas%20pudding.jpg	2025-07-09 17:36:39.76+00	2025-07-09 17:36:39.76+00
167	Vegetarian Chilli	9	7	3	Heat oven to 200C/180C fan/ gas 6. Cook the vegetables in a casserole dish for 15 mins. Tip in the beans and tomatoes, season, and cook for another 10-15 mins until piping hot. Heat the pouch in the microwave on High for 1 min and serve with the chilli.	A hearty and flavorful vegetarian chili made with beans, vegetables, and warming spices.	30	https://ftp.goit.study/img/so-yummy/preview/Vegetarian%20Chilli.jpg	2025-07-09 17:36:39.769+00	2025-07-09 17:36:39.769+00
168	Creamy Tomato Soup	3	7	3	Put the oil, onions, celery, carrots, potatoes and bay leaves in a big casserole dish, or two saucepans. Fry gently until the onions are softened – about 10-15 mins. Fill the kettle and boil it.\r\nStir in the tomato purée, sugar, vinegar, chopped tomatoes and passata, then crumble in the stock cubes. Add 1 litre boiling water and bring to a simmer. Cover and simmer for 15 mins until the potato is tender, then remove the bay leaves. Purée with a stick blender (or ladle into a blender in batches) until very smooth. Season to taste and add a pinch more sugar if it needs it. The soup can now be cooled and chilled for up to 2 days, or frozen for up to 3 months.\r\nTo serve, reheat the soup, stirring in the milk – try not to let it boil. Serve in small bowls with cheesy sausage rolls.	A classic tomato soup made with cream for added richness. Goes great with grilled cheese sandwiches.	40	https://ftp.goit.study/img/so-yummy/preview/Creamy%20Tomato%20Soup.jpg	2025-07-09 17:36:39.772+00	2025-07-09 17:36:39.772+00
169	Breakfast Potatoes	12	16	3	Before you do anything, freeze your bacon slices that way when you're ready to prep, it'll be so much easier to chop!\r\nWash the potatoes and cut medium dice into square pieces. To prevent any browning, place the already cut potatoes in a bowl filled with water.\r\nIn the meantime, heat 1-2 tablespoons of oil in a large skillet over medium-high heat. Tilt the skillet so the oil spreads evenly.\r\nOnce the oil is hot, drain the potatoes and add to the skillet. Season with salt, pepper, and Old Bay as needed.\r\nCook for 10 minutes, stirring the potatoes often, until brown. If needed, add a tablespoon more of oil.\r\nChop up the bacon and add to the potatoes. The bacon will start to render and the fat will begin to further cook the potatoes. Toss it up a bit! The bacon will take 5-6 minutes to crisp.\r\nOnce the bacon is cooked, reduce the heat to medium-low, add the minced garlic and toss. Season once more. Add dried or fresh parsley. Control heat as needed.\r\nLet the garlic cook until fragrant, about one minute.\r\nJust before serving, drizzle over the maple syrup and toss. Let that cook another minute, giving the potatoes a caramelized effect.\r\nServe in a warm bowl with a sunny side up egg!	Crispy and golden brown potatoes that are seasoned with garlic, paprika, and herbs. A great side dish for any breakfast or brunch.	35	https://ftp.goit.study/img/so-yummy/preview/Breakfast%20Potatoes.jpg	2025-07-09 17:36:39.781+00	2025-07-09 17:36:39.781+00
170	Katsu Chicken curry	4	8	3	Prep:15min  ›  Cook:30min  ›  Ready in:45min \r\n\r\nFor the curry sauce: Heat oil in medium non-stick saucepan, add onion and garlic and cook until softened. Stir in carrots and cook over low heat for 10 to 12 minutes.\r\nAdd flour and curry powder; cook for 1 minute. Gradually stir in stock until combined; add honey, soy sauce and bay leaf. Slowly bring to the boil.\r\nTurn down heat and simmer for 20 minutes or until sauce thickens but is still of pouring consistency. Stir in garam masala. Pour the curry sauce through a sieve; return to saucepan and keep on low heat until ready to serve.\r\nFor the chicken: Season both sides of chicken breasts with salt and pepper. Place flour, egg and breadcrumbs in separate bowls and arrange in a row. Coat the chicken breasts in flour, then dip them into the egg, then coat in breadcrumbs, making sure you cover both sides.\r\nHeat oil in large frying pan over medium-high heat. Place chicken into hot oil and cook until golden brown, about 3 or 4 minutes each side. Once cooked, place on kitchen paper to absorb excess oil.\r\nPour curry sauce over chicken, serve with white rice and enjoy!	Japanese-style curry with breaded chicken	45	https://ftp.goit.study/img/so-yummy/preview/Katsu%20Chicken%20curry.jpg	2025-07-09 17:36:39.792+00	2025-07-09 17:36:39.792+00
171	Spicy North African Potato Salad	9	3	3	Cook potatoes - place potatoes in a pot of cold water, and bring to the boil. Boil 20 minutes, or until potatoes are tender. You know they are cooked when you can stick a knife in them and the knife goes straight through.\r\nCombine harissa spice, olive oil, salt and pepper and lemon juice in a small bowl and whisk until combined.\r\nOnce potatoes are cooked, drain water and roughly chop potatoes in half.\r\nAdd harissa mix and spring onions/green onions to potatoes and stir.\r\nIn a large salad bowl, lay out arugula/rocket.\r\nTop with potato mix and toss.\r\nAdd fetta, mint and sprinkle over pine nuts.\r\nAdjust salt and pepper to taste.	A zesty and spicy potato salad with North African flavors.	35	https://ftp.goit.study/img/so-yummy/preview/Spicy%20North%20African%20Potato%20Salad.jpg	2025-07-09 17:36:39.805+00	2025-07-09 17:36:39.805+00
172	Mulukhiyah	5	23	3	Saute the onions in the 3-4 tablespoons olive oil\r\nAdd the beef cubes or the chicken cutlets, sear for 3-4 min on each side\r\nAdd 1 liter of water or just enough to cover the meat\r\nCook over medium heat until the meat is done (I usually do this in the pressure cooker and press them for 5 min)\r\n\r\nAdd the frozen mulukhyia and stir until it thaws completely and then comes to a boil\r\n\r\nIn another pan add the 1/4 to 1/2 cup of olive oil and the cloves of garlic and cook over medium low heat until you can smell the garlic (don’t brown it, it will become bitter)\r\n\r\nAdd the oil and garlic to the mulukhyia and lower the heat and simmer for 5-10 minutes\r\nAdd salt to taste\r\n\r\nServe with a generous amount of lemon juice.\r\n\r\nYou can serve it with some short grain rice or some pita bread	A traditional Middle Eastern dish, Mulukhiyah is a stew made from the leaves of the Jute plant, which are simmered with meat or chicken and served with rice or bread.	47	https://ftp.goit.study/img/so-yummy/preview/Mulukhiyah.jpg	2025-07-09 17:36:39.819+00	2025-07-09 17:36:39.819+00
173	Wontons	8	22	3	Combine pork, garlic, ginger, soy sauce, sesame oil, and vegetables in a bowl.\r\nSeparate wonton skins.\r\nPlace a heaping teaspoon of filling in the center of the wonton.\r\nBrush water on 2 borders of the skin, covering 1/4 inch from the edge.\r\nFold skin over to form a triangle, sealing edges.\r\nPinch the two long outside points together.\r\nHeat oil to 450 degrees and fry 4 to 5 at a time until golden.\r\nDrain and serve with sauce.	A Chinese dish made with small dumplings filled with pork or shrimp, served in a savory broth. Perfect as an appetizer or light meal.	30	https://ftp.goit.study/img/so-yummy/preview/Wontons.jpg	2025-07-09 17:36:39.826+00	2025-07-09 17:36:39.826+00
174	Beef Dumpling Stew	5	7	3	Preheat the oven to 180C/350F/Gas 4.\r\n\r\nFor the beef stew, heat the oil and butter in an ovenproof casserole and fry the beef until browned on all sides.\r\n\r\nSprinkle over the flour and cook for a further 2-3 minutes.\r\n\r\nAdd the garlic and all the vegetables and fry for 1-2 minutes.\r\n\r\nStir in the wine, stock and herbs, then add the Worcestershire sauce and balsamic vinegar, to taste. Season with salt and freshly ground black pepper.\r\n\r\nCover with a lid, transfer to the oven and cook for about two hours, or until the meat is tender.\r\n\r\nFor the dumplings, sift the flour, baking powder and salt into a bowl.\r\nAdd the suet and enough water to form a thick dough.\r\n\r\nWith floured hands, roll spoonfuls of the dough into small balls.\r\n\r\nAfter two hours, remove the lid from the stew and place the balls on top of the stew. Cover, return to the oven and cook for a further 20 minutes, or until the dumplings have swollen and are tender. (If you prefer your dumplings with a golden top, leave the lid off when returning to the oven.)\r\n\r\nTo serve, place a spoonful of mashed potato onto each of four serving plates and top with the stew and dumplings. Sprinkle with chopped parsley.	A comforting stew made with beef, vegetables, and dumplings, perfect for a cold winter day.	140	https://ftp.goit.study/img/so-yummy/preview/Beef%20Dumpling%20Stew.jpg	2025-07-09 17:36:39.836+00	2025-07-09 17:36:39.836+00
176	Bread and Butter Pudding	6	7	3	Grease a 1 litre/2 pint pie dish with butter.\r\nCut the crusts off the bread. Spread each slice with on one side with butter, then cut into triangles.\r\nArrange a layer of bread, buttered-side up, in the bottom of the dish, then add a layer of sultanas. Sprinkle with a little cinnamon, then repeat the layers of bread and sultanas, sprinkling with cinnamon, until you have used up all of the bread. Finish with a layer of bread, then set aside.\r\nGently warm the milk and cream in a pan over a low heat to scalding point. Don't let it boil.\r\nCrack the eggs into a bowl, add three quarters of the sugar and lightly whisk until pale.\r\nAdd the warm milk and cream mixture and stir well, then strain the custard into a bowl.\r\nPour the custard over the prepared bread layers and sprinkle with nutmeg and the remaining sugar and leave to stand for 30 minutes.\r\nPreheat the oven to 180C/355F/Gas 4.\r\nPlace the dish into the oven and bake for 30-40 minutes, or until the custard has set and the top is golden-brown.	A comforting and classic British dessert made with bread, butter, and custard.	80	https://ftp.goit.study/img/so-yummy/preview/Bread%20and%20Butter%20Pudding.jpg	2025-07-09 17:36:39.865+00	2025-07-09 17:36:39.865+00
177	Chicken Alfredo Primavera	4	2	3	Heat 1 tablespoon of butter and 2 tablespoons of olive oil in a large skillet over medium-high heat. Season both sides of each chicken breast with seasoned salt and a pinch of pepper. Add the chicken to the skillet and cook for 5-7 minutes on each side, or until cooked through.  While the chicken is cooking, bring a large pot of water to a boil. Season the boiling water with a few generous pinches of kosher salt. Add the pasta and give it a stir. Cook, stirring occasionally, until al dente, about 12 minutes. Reserve 1/2 cup of  pasta water before draining the pasta.  Remove the chicken from the pan and transfer it to a cutting board; allow it to rest. Turn the heat down to medium and dd the remaining 1 tablespoon of butter and olive oil to the same pan you used to cook the chicken. Add the veggies (minus the garlic) and red pepper flakes to the pan and stir to coat with the oil and butter (refrain from seasoning with salt until the veggies are finished browning). Cook, stirring often, until the veggies are tender, about 5 minutes. Add the garlic and a generous pinch of salt and pepper to the pan and cook for 1 minute.  Deglaze the pan with the white wine. Continue to cook until the wine has reduced by half, about 3 minutes. Stir in the milk, heavy cream, and reserved pasta water. Bring the mixture to a gentle boil and allow to simmer and reduce for 2-3 minutes. Turn off the heat and add the Parmesan cheese and cooked pasta. Season with salt and pepper to taste. Garnish with Parmesan cheese and chopped parsley, if desired. 	A creamy and satisfying pasta dish made with chicken, vegetables, and Alfredo sauce.	40	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Alfredo%20Primavera.jpg	2025-07-09 17:36:39.874+00	2025-07-09 17:36:39.874+00
178	Corba	13	27	3	Pick through your lentils for any foreign debris, rinse them 2 or 3 times, drain, and set aside.  Fair warning, this will probably turn your lentils into a solid block that you’ll have to break up later\r\nIn a large pot over medium-high heat, sauté the olive oil and the onion with a pinch of salt for about 3 minutes, then add the carrots and cook for another 3 minutes.\r\nAdd the tomato paste and stir it around for around 1 minute. Now add the cumin, paprika, mint, thyme, black pepper, and red pepper as quickly as you can and stir for 10 seconds to bloom the spices. Congratulate yourself on how amazing your house now smells.\r\nImmediately add the lentils, water, broth, and salt. Bring the soup to a (gentle) boil.\r\nAfter it has come to a boil, reduce heat to medium-low, cover the pot halfway, and cook for 15-20 minutes or until the lentils have fallen apart and the carrots are completely cooked.\r\nAfter the soup has cooked and the lentils are tender, blend the soup either in a blender or simply use a hand blender to reach the consistency you desire. Taste for seasoning and add more salt if necessary.\r\nServe with crushed-up crackers, torn up bread, or something else to add some extra thickness.  You could also use a traditional thickener (like cornstarch or flour), but I prefer to add crackers for some texture and saltiness.  Makes great leftovers, stays good in the fridge for about a week.	A popular Turkish soup made with lamb or chicken, vegetables, legumes, and a blend of spices.	40	https://ftp.goit.study/img/so-yummy/preview/Corba.jpg	2025-07-09 17:36:39.893+00	2025-07-09 17:36:39.893+00
179	Lasagna Sandwiches	11	11	3	1. In a small bowl, combine the first four ingredients; spread on four slices of bread. Layer with bacon, tomato and cheese; top with remaining bread.\r\n\r\n2. In a large skillet or griddle, melt 2 tablespoons butter. Toast sandwiches until lightly browned on both sides and cheese is melted, adding butter if necessary.\r\n\r\nNutrition Facts\r\n1 sandwich: 445 calories, 24g fat (12g saturated fat), 66mg cholesterol, 1094mg sodium, 35g carbohydrate (3g sugars, 2g fiber), 21g protein.	A fun and delicious twist on classic lasagna, made with layers of pasta, meat sauce, cheese, and bread.	15	https://ftp.goit.study/img/so-yummy/preview/Lasagna%20Sandwiches.jpg	2025-07-09 17:36:39.904+00	2025-07-09 17:36:39.904+00
180	Peanut Butter Cookies	6	11	3	Preheat oven to 350ºF (180ºC).\r\nIn a large bowl, mix together the peanut butter, sugar, and egg.\r\nScoop out a spoonful of dough and roll it into a ball. Place the cookie balls onto a nonstick baking sheet.\r\nFor extra decoration and to make them cook more evenly, flatten the cookie balls by pressing a fork down on top of them, then press it down again at a 90º angle to make a criss-cross pattern.\r\nBake for 8-10 minutes or until the bottom of the cookies are golden brown.\r\nRemove from baking sheet and cool.\r\nEnjoy!	Soft and chewy peanut butter cookies with a hint of saltiness. Perfect for a sweet snack or dessert.	10	https://ftp.goit.study/img/so-yummy/preview/Peanut%20Butter%20Cookies.jpg	2025-07-09 17:36:39.915+00	2025-07-09 17:36:39.915+00
181	Chocolate Raspberry Brownies	6	11	3	Heat oven to 180C/160C fan/gas 4. Line a 20 x 30cm baking tray tin with baking parchment. Put the chocolate, butter and sugar in a pan and gently melt, stirring occasionally with a wooden spoon. Remove from the heat.\r\nStir the eggs, one by one, into the melted chocolate mixture. Sieve over the flour and cocoa, and stir in. Stir in half the raspberries, scrape into the tray, then scatter over the remaining raspberries. Bake on the middle shelf for 30 mins or, if you prefer a firmer texture, for 5 mins more. Cool before slicing into squares. Store in an airtight container for up to 3 days.	A rich and decadent brownie made with chocolate and raspberries. It is a popular dessert in many countries and is often served with ice cream or whipped cream.	35	https://ftp.goit.study/img/so-yummy/preview/Chocolate%20Raspberry%20Brownies.jpg	2025-07-09 17:36:39.92+00	2025-07-09 17:36:39.92+00
182	Kumpir	13	27	3	If you order kumpir in Turkey, the standard filling is first, lots of butter mashed into the potato, followed by cheese. There’s then a row of other toppings that you can just point at to your heart’s content – sweetcorn, olives, salami, coleslaw, Russian salad, allsorts – and you walk away with an over-stuffed potato because you got ever-excited by the choices on offer.\r\n\r\nGrate (roughly – you can use as much as you like) 150g of cheese.\r\nFinely chop one onion and one sweet red pepper.\r\nPut these ingredients into a large bowl with a good sprinkling of salt and pepper, chilli flakes (optional).	A baked potato dish from Turkey, stuffed with a variety of toppings such as cheese, vegetables, and meats.	30	https://ftp.goit.study/img/so-yummy/preview/Kumpir.jpg	2025-07-09 17:36:39.928+00	2025-07-09 17:36:39.928+00
183	Oatmeal Cookies With Peanuts	6	1	3	Preheat the oven to 180 degrees. Pour 100 g of oatmeal.\r\nPour 100 g of oatmeal. Chop the flakes with a blender.\r\nPut the chopped flakes to a large bowl, add 170 g of flour and ½ tsp. salt.\r\nCombine 1 tsp. of soda with 1 tsp. of lemon juice.\r\nPour 150 g of sugar into a bowl, add 200 g of soft butter and 100 g of peanuts.\r\nBeat 2 eggs in the dough and mix it well with your hands until smooth.\r\nRoll out 20 balls of dough and place on a baking dish covered with parchment, at a distance of about 5 cm from each other, because in the process of cooking the balls will become bigger. Bake cookies for 25 minutes in the oven. After that leave cookies to cool completely before removing from the parchment, as they are very fragile and gentle when warm.	Cookies are seasonless, do you agree with me? You can cook them whenever you want and feel the same cheerful warmth inside the body. Today I recommend you to cook oatmeal cookies with peanuts. Trust me, you’ll fall in love with them.	40	https://ftp.goit.study/img/so-yummy/preview/Oatmeal%20Cookies%20With%20Peanuts.jpg	2025-07-09 17:36:39.934+00	2025-07-09 17:36:39.934+00
184	Honey Yogurt Cheesecake	6	19	3	Heat oven to 160C/140C fan/gas 3. Crush the biscuits and most of the almonds inside a plastic food bag using a rolling pin. Mix with the butter, then press into the bottom of a deep, oval, 23cm dish (or something similar in size – a roasting tin, baking dish or cake tin will work). Bake for 10 mins until crisp.\r\n\r\nStir or mash together the yogurt and mascarpone, then whisk in the eggs, one at a time. Stir in the lemon and orange zests, then stir in most of the honey, reserving about 3 tbsp. Spread over the biscuit base, cover loosely with foil and cook for 1 hr. Remove the foil and cook for 15 mins more until lightly golden and the top is firm with just the slightest wobble in the middle. Leave to cool. Can be kept in the fridge for up to 2 days.\r\n\r\nTo serve, scatter with almonds, drizzle over the remaining honey, and hand around fresh fruit to go with it.	A delicious dessert made with a creamy blend of honey, yogurt, and cheesecake filling, baked to perfection and topped with fresh fruit and nuts.	85	https://ftp.goit.study/img/so-yummy/preview/Honey%20Yogurt%20Cheesecake.jpg	2025-07-09 17:36:39.943+00	2025-07-09 17:36:39.943+00
185	Shrimp Chow Fun	1	22	3	STEP 1 - SOAK THE RICE NOODLES\r\nSoak the rice noodles overnight untill they are soft\r\nSTEP 2 - BOIL THE RICE NOODLES\r\nBoil the noodles for 10-15 minutes and then rinse with cold water to stop the cooking process of the noodles.\r\nSTEP 3 -MARINATING THE SHRIMP\r\nIn a bowl add the shrimp, egg, 1 pinch of white pepper, 1 Teaspoon of sesame seed oil, 1 Tablespoon corn starch and 1 tablespoon of oil\r\nMix together well\r\nSTEP 4 - STIR FRY\r\nIn a wok add 2 Tablespoons of oil, shrimp and stir fry them until it is golden brown\r\nSet the shrimp aside\r\nAdd 1 Tablespoon of oil to the work and then add minced garlic, ginger and all of the vegetables.\r\nAdd the noodles to the wok\r\nNext add sherry cooking wine, oyster sauce, sugar, vinegar, sesame seed oil, 1 pinch white pepper, and soy sauce\r\nAdd back in the shrimp\r\nTo thicken the sauce, whisk together 1 Tablespoon of corn starch and 2 Tablespoon of water in a bowl and slowly add to your stir-fry until it's the right thickness.	A Cantonese dish made with stir-fried rice noodles, shrimp, and vegetables in a soy sauce-based gravy. Served hot and fresh.	30	https://ftp.goit.study/img/so-yummy/preview/Shrimp%20Chow%20Fun.jpg	2025-07-09 17:36:39.955+00	2025-07-09 17:36:39.955+00
186	Grilled Portuguese sardines	1	20	3	STEP 1\r\n\r\nPut all of the ingredients, except the sardines, into a bowl and mix together with some seasoning. Pour into a baking dish, add the sardines and toss really well. Cover and chill for a few hours.\r\n\r\nSTEP 2\r\n\r\nHeat a BBQ or griddle pan until hot. Cook the sardines for 4-5 minutes on each side or until really caramelised and charred. Put onto a serving plate, drizzle with oil, sprinkle with a little more paprika and squeeze over the lemon wedges.	Grilled Portuguese sardines are a simple but delicious dish of fresh sardines grilled with olive oil, garlic, and lemon juice, perfect as a light and healthy meal.	142	https://ftp.goit.study/img/so-yummy/preview/Grilled%20Portuguese%20sardines.jpg	2025-07-09 17:36:39.967+00	2025-07-09 17:36:39.967+00
187	Ma Po Tofu	5	22	3	Add a small pinch of salt and sesame oil to minced beef. Mix well and set aside.\r\nMix 1 tablespoon of cornstarch with 2 and ½ tablespoons of water in a small bowl to make water starch.\r\nCut tofu into square cubes (around 2cms). Bring a large amount of water to a boil and then add a pinch of salt. Slide the tofu in and cook for 1 minute. Move out and drain.\r\nGet a wok and heat up around 2 tablespoons of oil, fry the minced meat until crispy. Transfer out beef out and leave the oil in.\r\nFry doubanjiang for 1 minute over slow fire and then add garlic, scallion white, ginger and fermented black beans to cook for 30 seconds until aroma. Then mix pepper flakes in.\r\nAdd water to the seasonings and bring to boil over high fire. Gently slide the tofu cubes. Add light soy sauce and beef.Slow the heat after boiling and then simmer for 6-8 minutes. Then add chopped garlic greens.\r\nStir the water starch and then pour half of the mixture to the simmering pot. Wait for around 30 seconds and then pour the other half. You can slightly taste the tofu and add pinch of salt if not salty enough. By the way, if you feel it is too spicy, add some sugar can milder the taste. But be carefully as the broth is very hot at this point.\r\nTransfer out when almost all the seasonings stick to tofu cubes. Sprinkle Szechuan peppercorn powder (to taste)and chopped garlic greens if using.\r\nServe immediately with steamed rice.	A classic Sichuan dish made with soft tofu, ground pork, and a spicy bean sauce. Served with rice or noodles.	35	https://ftp.goit.study/img/so-yummy/preview/Ma%20Po%20Tofu.jpg	2025-07-09 17:36:39.973+00	2025-07-09 17:36:39.973+00
188	Soy-Glazed Meatloaves with Wasabi Mashed Potatoes & Roasted Carrots	5	11	3	1. Preheat oven to 425 degrees. Wash and dry all produce. Dice potatoes into 1/2-inch pieces. Trim, peel, and cut carrots on a diagonal into 1/2-inch-thick pieces. Trim and thinly slice scallions, separating whites from greens; finely chop whites. Peel and finely chop garlic.\r\n\r\n2. In a medium bowl, soak bread with 2 TBSP water (4 TBSP for 4 servings); break up with your hands until pasty. Stir in beef, sriracha, scallion whites, half the garlic, salt (we used 3/4 tsp kosher salt; 11/2 tsp for 4), and pepper. Form into two 1-inch-tall loaves (four loaves for 4). Place on one side of a baking sheet. Toss carrots on empty side of same sheet with a drizzle of oil, salt, and pepper. (For 4, spread meatloaves out across whole sheet and add carrots to a second sheet.) Bake for 20 minutes (we'll glaze the meatloaves then).\r\n\r\n3. Meanwhile, place potatoes in a medium pot with enough salted water to cover by 2 inches. Bring to a boil and cook until very\r\ntender, 12-15 minutes. Reserve 1/2 cup potato cooking liquid, then drain. While potatoes cook, in a small bowl, combine soy sauce, garlic powder, 1/4 cup ketchup (1/2 cup for 4 servings), and 2 tsp sugar (4 tsp for 4).\r\n\r\n4. Once meatloaves and carrots have baked 20 minutes, remove from oven. Spoon half the ketchup glaze over meatloaves (save\r\nthe rest for serving); return to oven until carrots are browned and tender, meatloaves are cooked through, and glaze is tacky, 4-5 minutes more.\r\n\r\n5. Meanwhile, melt 2 TBSP butter (4 TBSP for 4 servings) in pot used for potatoes over medium heat. Add remaining garlic and cook\r\nuntil fragrant, 30 seconds. Add potatoes and 1/4 tsp wasabi. Mash, adding splashes of reserved potato cooking liquid as necessary until smooth. Season with salt and pepper. (If you like things spicy, stir in more wasabi!)\r\n\r\n6. Divide meatloaves, mashed potatoes, and roasted carrots between plates. Sprinkle with scallion greens and serve with remaining ketchup glaze on the side for dipping.	This flavorful meatloaf is coated with a soy glaze and served with a side of creamy wasabi mashed potatoes and roasted carrots.	30	https://ftp.goit.study/img/so-yummy/preview/Soy-Glazed%20Meatloaves%20with%20Wasabi%20Mashed%20Potatoes%20_%20Roasted%20Carrots.jpg	2025-07-09 17:36:39.989+00	2025-07-09 17:36:39.989+00
189	Paszteciki (Polish Pasties)	5	25	3	Sift flour and salt into a large mixing bowl.\r\nUse a spoon to push the egg yolk through a fine sieve into the flour.\r\nAdd the raw egg and mix well.\r\nBeat in butter 1 tablespoon at a time.\r\nPlace dough on a floured surface and knead until smooth and elastic, then wrap in waxed paper and refrigerate until firm (at least 30 minutes).\r\nIn a heavy skillet, melt 2 tablespoons butter over medium heat; saute the onion and rutabaga until the onion is soft and transparent (5 minutes).\r\nPut the onions, rutabaga, and beef through a meat grinder twice if you have one, if not just chop them up as fine as possible.\r\nMelt the remaining 4 tablespoons butter over medium heat, and add the meat mixture.\r\nCook over low heat, stirring occasionally, until all of the liquid has evaporated and the mixture is thick enough to hold its shape.\r\nRemove from heat and let cool, then stir in 1 egg, and season with salt and pepper.\r\nPreheat oven to 350°F.\r\nOn a lightly floured surface, roll the dough out into a 13x8" rectangle (1/8" thick).\r\nSpoon the filling down the center of the rectangle lengthwise, leaving about an inch of space on each end.\r\nLightly brush the long sides with cold water, then fold one of the long sides over the filling and the other side over the top of that.\r\nBrush the short ends with cold water and fold them over the top, enclosing the filling.\r\nPlace pastry seam side down on a baking sheet and brush the top evenly with the remaining scrambled egg.\r\nBake in preheated oven until rich golden brown (30 minutes).\r\nSlice pastry diagonally into 1.5" long pieces and serve as an appetizer or with soup.	A savory pastry filled with ground meat, vegetables, and spices, wrapped in a crispy puff pastry shell and baked until golden brown, for a delicious and filling snack.	95	https://ftp.goit.study/img/so-yummy/preview/Paszteciki%20_Polish%20Pasties_.jpg	2025-07-09 17:36:39.997+00	2025-07-09 17:36:39.997+00
190	Jamaican Beef Patties	5	24	3	Make the Pastry Dough\r\n\r\nTo a large bowl, add flour, 1 teaspoon salt, and turmeric and mix thoroughly.\r\nRub shortening into flour until there are small pieces of shortening completely covered with flour.\r\nPour in 1/2 cup of the ice water and mix with your hands to bring the dough together. Keep adding ice water 2 to 3 tablespoons at a time until the mixture forms a dough.\r\nAt this stage, you can cut the dough into 2 large pieces, wrap in plastic and refrigerate for 30 minutes before using it.\r\nAlternatively, cut the dough into 10 to 12 equal pieces, place on a platter or baking sheet, cover securely with plastic wrap and let chill for 30 minutes while you make the filling.\r\nMake the Filling\r\n\r\nAdd ground beef to a large bowl. Sprinkle in allspice and black pepper. Mix together and set aside.\r\nHeat oil in a skillet until hot.\r\nAdd onions and sauté until translucent. Add hot pepper, garlic and thyme and continue to sauté for another minute. Add 1/4 teaspoon salt.\r\nAdd seasoned ground beef and toss to mix, breaking up any clumps, and let cook until the meat is no longer pink.\r\nAdd ketchup and more salt to taste.\r\nPour in 2 cups of water and stir. Bring the mixture to a boil then reduce heat and let simmer until most of the liquid has evaporated and whatever is remaining has reduced to a thick sauce.\r\nFold in green onions. Remove from heat and let cool completely.\r\nAssemble the Patties\r\n\r\nBeat the egg and water together to make an egg wash. Set aside.\r\nNow you can prepare the dough in two ways.\r\nFirst Method: Flour the work surface and rolling pin. If you had cut it into 2 large pieces, then take one of the large pieces and roll it out into a very large circle. Take a bowl with a wide rim (about 5 inches) and cut out three circles.\r\n\r\nPlace about 3 heaping tablespoons of the filling onto 1/2 of each circle. Dip a finger into the water and moisten the edges of the pastry. Fold over the other half and press to seal. \r\n\r\nTake a fork and crimp the edges. Cut off any extra to make it look neat and uniform. Place on a parchment-lined baking sheet and continue to work until you have rolled all the dough and filled the patties.\r\nSecond Method: If you had pre-cut the dough into individual pieces, work with one piece of dough at a time. Roll it out on a floured surface into a 5-inch circle or a little larger. Don’t worry if the edges are not perfect.\r\n\r\nPlace 3 heaping tablespoons of the filling on one side of the circle. Dip a finger into the water and moisten the edges of the pastry. Fold over the other half and press to seal.\r\n\r\nTake a fork and crimp the edges. Cut off any extra to make it look neat and uniform. Place on a parchment-lined baking sheet and continue work until you have rolled all the dough and filled the patties.\r\n\r\nFrying and Serving the Patties\r\n\r\nAfter forming the patties, place the pans in the refrigerator while you heat the oven to 350 F.\r\nJust before adding the pans with the patties to the oven, brush the patties with egg wash.\r\nBake patties for 30 minutes or until golden brown.\r\nCool on wire racks.\r\nServe warm.	A savory pastry filled with spicy ground beef, and seasoned with Jamaican spices such as allspice and scotch bonnet peppers. Popular in Jamaica and throughout the Caribbean.	90	https://ftp.goit.study/img/so-yummy/preview/Jamaican%20Beef%20Patties.jpg	2025-07-09 17:36:40.004+00	2025-07-09 17:36:40.004+00
191	Montreal Smoked Meat	5	16	3	To make the cure, in a small bowl mix together salt, pink salt, black pepper, coriander, sugar, bay leaf, and cloves. Coat entire brisket with the cure and place in an extra-large resealable plastic bag. Place in the coldest part of the refrigerator and cure for 4 days, flipping brisket twice a day.\r\nRemove brisket from bag and wash as much cure off as possible under cold running water. Place brisket in a large container and fill with water and let soak for 2 hours, replacing water every 30 minutes. Remove from water and pat dry with paper towels.\r\nTo make the rub, mix together black pepper, coriander, paprika, garlic powder, onion powder, dill weed, mustard, celery seed, and crushed red papper in a small bowl. Coat entire brisket with the rub.\r\nFire up smoker or grill to 225 degrees, adding chunks of smoking wood chunks when at temperature. When wood is ignited and producing smoke, place brisket in, fat side up, and smoke until an instant read thermometer registers 165 degrees when inserted into thickest part of the brisket, about 6 hours.\r\nTransfer brisket to large roasting pan with V-rack. Place roasting pan over two burners on stovetop and fill with 1-inch of water. Bring water to a boil over high heat, reduce heat to medium, cover roasting pan with aluminum foil, and steam brisket until an instant read thermometer registers 180 degrees when inserted into thickest part of the meat, 1 to 2 hours, adding more hot water as needed.\r\nTransfer brisket to cutting board and let cool slightly. Slice and serve, preferably on rye with mustard.	A type of deli meat made by salting and curing beef brisket with spices, then smoking it slowly over wood chips. A popular food in Montreal, Quebec.	420	https://ftp.goit.study/img/so-yummy/preview/Montreal%20Smoked%20Meat.jpg	2025-07-09 17:36:40.018+00	2025-07-09 17:36:40.018+00
192	Escovitch Fish	1	24	3	Rinse fish; rub with lemon or lime, seasoned with salt and pepper or use your favorite seasoning. I used creole seasoning. Set aside or place in the oven to keep it warm until sauce is ready.\r\n\r\nIn large skillet heat oil over medium heat, until hot, add the fish, cook each side- for about 5-7 minutes until cooked through and crispy on both sides. Remove fish and set aside. Drain oil and leave about 2-3 tablespoons of oil\r\nAdd, bay leave, garlic and ginger, stir-fry for about a minute making sure the garlic does not burn\r\nThen add onion, bell peppers, thyme, scotch bonnet, sugar, all spice-continue stirring for about 2-3 minutes. Add vinegar, mix an adjust salt and pepper according to preference. Let it simmer for about 2 more minutes. \r\n\r\nDiscard bay leave, thyme spring and serve over fish with a side of this bammy. You may make the sauce about 2 days in advance.	A Jamaican dish made with fried fish and a spicy sauce of vinegar, peppers, and onions. Served with rice and vegetables.	22	https://ftp.goit.study/img/so-yummy/preview/Escovitch%20Fish.jpg	2025-07-09 17:36:40.03+00	2025-07-09 17:36:40.03+00
193	Beef Banh Mi Bowls with Sriracha Mayo, Carrot & Pickled Cucumber	5	17	3	Add'l ingredients: mayonnaise, siracha\r\n\r\n1\r\n\r\nPlace rice in a fine-mesh sieve and rinse until water runs clear. Add to a small pot with 1 cup water (2 cups for 4 servings) and a pinch of salt. Bring to a boil, then cover and reduce heat to low. Cook until rice is tender, 15 minutes. Keep covered off heat for at least 10 minutes or until ready to serve.\r\n\r\n2\r\n\r\nMeanwhile, wash and dry all produce. Peel and finely chop garlic. Zest and quarter lime (for 4 servings, zest 1 lime and quarter both). Trim and halve cucumber lengthwise; thinly slice crosswise into half-moons. Halve, peel, and medium dice onion. Trim, peel, and grate carrot.\r\n\r\n3\r\n\r\nIn a medium bowl, combine cucumber, juice from half the lime, ¼ tsp sugar (½ tsp for 4 servings), and a pinch of salt. In a small bowl, combine mayonnaise, a pinch of garlic, a squeeze of lime juice, and as much sriracha as you’d like. Season with salt and pepper.\r\n\r\n4\r\n\r\nHeat a drizzle of oil in a large pan over medium-high heat. Add onion and cook, stirring, until softened, 4-5 minutes. Add beef, remaining garlic, and 2 tsp sugar (4 tsp for 4 servings). Cook, breaking up meat into pieces, until beef is browned and cooked through, 4-5 minutes. Stir in soy sauce. Turn off heat; taste and season with salt and pepper.\r\n\r\n5\r\n\r\nFluff rice with a fork; stir in lime zest and 1 TBSP butter. Divide rice between bowls. Arrange beef, grated carrot, and pickled cucumber on top. Top with a squeeze of lime juice. Drizzle with sriracha mayo.	These beef banh mi bowls are a deconstructed version of the classic Vietnamese sandwich, featuring marinated beef, pickled vegetables, and a spicy sriracha mayo sauce.	45	https://ftp.goit.study/img/so-yummy/preview/Beef%20Banh%20Mi%20Bowls%20with%20Sriracha%20Mayo_%20Carrot%20_%20Pickled%20Cucumber.jpg	2025-07-09 17:36:40.048+00	2025-07-09 17:36:40.048+00
229	Egg Drop Soup	9	22	3	In a wok add chicken broth and wait for it to boil.\r\nNext add salt, sugar, white pepper, sesame seed oil.\r\nWhen the chicken broth is boiling add the vegetables to the wok.\r\nTo thicken the sauce, whisk together 1 Tablespoon of cornstarch and 2 Tablespoon of water in a bowl and slowly add to your soup until it's the right thickness.\r\nNext add 1 egg slightly beaten with a knife or fork and add it to the soup slowly and stir for 8 seconds\r\nServe the soup in a bowl and add the green onions on top.	A classic Chinese soup made with eggs, chicken broth, and green onions. Light and flavorful, perfect as a starter or side dish.	15	https://ftp.goit.study/img/so-yummy/preview/Egg%20Drop%20Soup.jpg	2025-07-09 17:36:40.406+00	2025-07-09 17:36:40.406+00
194	Roasted Eggplant With Tahini, Pine Nuts, and Lentils	9	11	3	\r\nFor the Lentils: Adjust oven rack to center position and preheat oven to 450°F to prepare for roasting eggplant. Meanwhile, heat 2 tablespoons olive oil in a medium saucepan over medium heat until shimmering. Add carrots, celery, and onion and cook, stirring, until softened but not browned, about 4 minutes. Add garlic and cook, stirring, until fragrant, about 30 seconds. Add lentils, bay leaves, stock or water, and a pinch of salt. Bring to a simmer, cover with the lid partially ajar, and cook until lentils are tender, about 30 minutes. (Top up with water if lentils are at any point not fully submerged.) Remove lid, stir in vinegar, and reduce until lentils are moist but not soupy. Season to taste with salt and pepper, cover, and keep warm until ready to serve.\r\n\r\n2.\r\nFor the Eggplant: While lentils cook, cut each eggplant in half. Score flesh with the tip of a paring knife in a cross-hatch pattern at 1-inch intervals. Transfer to a foil-lined rimmed baking sheet, cut side up, and brush each eggplant half with 1 tablespoon oil, letting each brushstroke be fully absorbed before brushing with more. Season with salt and pepper. Place a rosemary sprig on top of each one. Transfer to oven and roast until completely tender and well charred, 25 to 35 minutes. Remove from oven and discard rosemary.\r\n\r\n3.\r\nTo Serve: Heat 2 tablespoons olive oil and pine nuts in a medium skillet set over medium heat. Cook, tossing nuts frequently, until golden brown and aromatic, about 4 minutes. Transfer to a bowl to halt cooking. Stir half of parsley and rosemary into lentils and transfer to a serving platter. Arrange eggplant halves on top. Spread a few tablespoons of tahini sauce over each eggplant half and sprinkle with pine nuts. Sprinkle with remaining parsley and rosemary, drizzle with additional olive oil, and serve.	A vegetarian Middle Eastern dish of roasted eggplant served with a creamy tahini sauce, toasted pine nuts, and lentils.	75	https://ftp.goit.study/img/so-yummy/preview/Roasted%20Eggplant%20With%20Tahini_%20Pine%20Nuts_%20and%20Lentils.jpg	2025-07-09 17:36:40.054+00	2025-07-09 17:36:40.054+00
195	Full English Breakfast	12	7	3	Heat the flat grill plate over a low heat, on top of 2 rings/flames if it fits, and brush sparingly with light olive oil.\r\nCook the sausages first. Add the sausages to the hot grill plate/the coolest part if there is one and allow to cook slowly for about 15-20 minutes, turning occasionally, until golden. After the first 10 minutes, increase the heat to medium before beginning to cook the other ingredients. If you are struggling for space, completely cook the sausages and keep hot on a plate in the oven.\r\nSnip a few small cuts into the fatty edge of the bacon. Place the bacon straight on to the grill plate and fry for 2-4 minutes each side or until your preferred crispiness is reached. Like the sausages, the cooked bacon can be kept hot on a plate in the oven.\r\nFor the mushrooms, brush away any dirt using a pastry brush and trim the stalk level with the mushroom top. Season with salt and pepper and drizzle over a little olive oil. Place stalk-side up on the grill plate and cook for 1-2 minutes before turning and cooking for a further 3-4 minutes. Avoid moving the mushrooms too much while cooking, as this releases the natural juices, making them soggy.\r\nFor the tomatoes, cut the tomatoes across the centre/or in half lengthways if using plum tomatoes , and with a small, sharp knife remove the green 'eye'. Season with salt and pepper and drizzle with a little olive oil. Place cut-side down on the grill plate and cook without moving for 2 minutes. Gently turn over and season again. Cook for a further 2-3 minutes until tender but still holding their shape.\r\nFor the black pudding, cut the black pudding into 3-4 slices and remove the skin. Place on the grill plate and cook for 1½-2 minutes each side until slightly crispy.\r\nFor 'proper' fried bread it's best to cook it in a separate pan. Ideally, use bread that is a couple of days old. Heat a frying pan to a medium heat and cover the base with oil. Add the bread and cook for 2-3 minutes each side until crispy and golden. If the pan becomes too dry, add a little more oil. For a richer flavour, add a knob of butter after you turn the slice.\r\nFor the fried eggs, break the egg straight into the pan with the fried bread and leave for 30 seconds. Add a good knob of butter and lightly splash/baste the egg with the butter when melted. Cook to your preferred stage, season and gently remove with a fish slice.\r\nOnce all the ingredients are cooked, serve on warm plates and enjoy straight away with a good squeeze of tomato ketchup or brown sauce.	Similar to the English Breakfast, but with additional items like black pudding, fried mushrooms, and hash browns. It is a more substantial breakfast meal.	51	https://ftp.goit.study/img/so-yummy/preview/Full%20English%20Breakfast.jpg	2025-07-09 17:36:40.067+00	2025-07-09 17:36:40.067+00
196	Tandoori chicken	4	10	3	Mix the lemon juice with the paprika and red onions in a large shallow dish. Slash each chicken thigh three times, then turn them in the juice and set aside for 10 mins.\r\nMix all of the marinade ingredients together and pour over the chicken. Give everything a good mix, then cover and chill for at least 1 hr. This can be done up to a day in advance.\r\nHeat the grill. Lift the chicken pieces onto a rack over a baking tray. Brush over a little oil and grill for 8 mins on each side or until lightly charred and completely cooked through.	A popular Indian dish of chicken marinated in yogurt and spices, then roasted in a tandoor oven.	80	https://ftp.goit.study/img/so-yummy/preview/Tandoori%20chicken.jpg	2025-07-09 17:36:40.078+00	2025-07-09 17:36:40.078+00
197	Mediterranean Pasta Salad	1	2	3	Bring a large saucepan of salted water to the boil\r\nAdd the pasta, stir once and cook for about 10 minutes or as directed on the packet.\r\nMeanwhile, wash the tomatoes and cut into quarters. Slice the olives. Wash the basil.\r\nPut the tomatoes into a salad bowl and tear the basil leaves over them. Add a tablespoon of olive oil and mix.\r\nWhen the pasta is ready, drain into a colander and run cold water over it to cool it quickly.\r\nToss the pasta into the salad bowl with the tomatoes and basil.\r\nAdd the sliced olives, drained mozzarella balls, and chunks of tuna. Mix well and let the salad rest for at least half an hour to allow the flavours to mingle.\r\nSprinkle the pasta with a generous grind of black pepper and drizzle with the remaining olive oil just before serving.	A salad made with pasta, vegetables (such as tomatoes, cucumbers, and olives), feta cheese, and a dressing made with olive oil and lemon juice.	27	https://ftp.goit.study/img/so-yummy/preview/Mediterranean%20Pasta%20Salad.jpg	2025-07-09 17:36:40.089+00	2025-07-09 17:36:40.089+00
198	Blackberry Fool	6	7	3	For the biscuits, preheat the oven to 200C/180C (fan)/Gas 6 and line two large baking trays with baking parchment. Scatter the nuts over a baking tray and roast in the oven for 6-8 minutes, or until golden-brown. Watch them carefully so that they don’t have a chance to burn. Remove from the oven, tip onto a board and leave to cool.\r\nPut the butter and sugar in a large bowl and beat with a wooden spoon until light and creamy. Roughly chop the cooled nuts and add to the creamed butter and sugar, along with the lemon zest, flour and baking powder. Stir well until the mixture comes together and forms a ball – you may need to use your hands.\r\nDivide the biscuit dough into 24 even pieces and roll into small balls. Place the balls the prepared baking trays, spaced well apart to allow for spreading.\r\nPress the biscuits to flatten to around 1cm/½in thick. Bake the biscuits, one tray at a time, for 12 minutes or until very pale golden-brown. Leave to cool on the trays. They will be very soft when you take them out of the oven, but will crisp as they cool.\r\nStore in an airtight tin and eat within five days.\r\nFor the fool, rinse the blackberries in a colander to wash away any dust or dirt. Put the blackberries in a non-stick saucepan and sprinkle over the caster sugar.\r\nStir in the lemon juice and heat gently for two minutes, or until the blackberries begin to soften and release their juices. Remove and reserve 12 blackberries for decoration and continue cooking the rest.\r\nSimmer the blackberries very gently for 15 minutes, stirring regularly until very soft and squidgy. Remove from the heat and press the berries and juice through a sieve over a bowl, using the bottom of a ladle to help you extract as much of the purée as possible. Leave the purée to cool and discard the seeds. You should end up with around 325ml/11fl oz of purée.\r\nPut the cream and yoghurt in a large bowl and whip with an electric whisk until soft peaks form when the whisk is removed from the bowl – the acidity of the fruit will thicken the cream further, so don’t take it too far.\r\nWhen the purée is completely cold, adjust the sweetness to taste by adding more sugar if needed. Pour it into the bowl with the whipped cream and yoghurt and stir just once or twice until very lightly combined.\r\nSpoon the blackberry fool into individual wide, glass dishes – or one large, single bowl. It should look quite marbled, so don’t over-stir it. Scatter a few tiny mint leaves on top and decorate with the reserved blackberries. Sprinkle with a little sugar if you like and serve with the hazelnut biscuits.	A light and creamy dessert made with whipped cream and blackberries, perfect for summer.	60	https://ftp.goit.study/img/so-yummy/preview/Blackberry%20Fool.jpg	2025-07-09 17:36:40.098+00	2025-07-09 17:36:40.098+00
199	Osso Buco alla Milanese	10	2	3	Heat the oven to 300 degrees.\r\nDredging the shanks: pour the flour into a shallow dish (a pie plate works nicely). Season the veal shanks on all sides with salt and pepper. One at a time, roll the shanks around in the flour coat, and shake and pat the shank to remove any excuses flour. Discard the remaining flour.\r\nBrowning the shanks: put the oil and 1 tablespoon of the butter in a wide Dutch oven or heavy braising pot (6 to 7 quart) and heat over medium-high heat. When the butter has melted and the oil is shimmering, lower the shanks into the pot, flat side down; if the shanks won’t fit without touching one another, do this in batches. Brown the shanks, turning once with tongs, until both flat sides are well caramelized, about 5 minutes per side. If the butter-oil mixture starts to burn, lower the heat just a bit. Transfer the shanks to a large platter or tray and set aside.\r\nThe aromatics: pour off and discard the fat from the pot. Wipe out any burnt bits with a damp paper towel, being careful not to remove any delicious little caramelized bits. Ad the remaining 2 tablespoons butter to the pot and melt it over medium heat. When the butter has stopped foaming, add the onion, carrot, celery, and fennel. Season with salt and pepper, stir, and cook the vegetables until they begin to soften but do not brown, about 6 minutes. Stir in the garlic, orange zest, marjoram, and bay leaf, and stew for another minute or two.\r\nThe braising liquid: add the wine, increase the heat to high, and bring to a boil. Boil, stirring occasionally, to reduce the wine by about half, 5 minutes. Add the stock and tomatoes, with their juice, and boil again to reduce the liquid to about 1 cup total, about 10 minutes.\r\nThe braise: Place the shanks in the pot so that they are sitting with the exposed bone facing up, and pour over any juices that accumulated as they sat. Cover with parchment paper, pressing down so the parchment nearly touches the veal and the edges hang over the sides of the pot by about an inch. Cover tightly with the lid, and slide into the lower part of the oven to braise at a gentle simmer. Check the pot after the first 15 minutes, and if the liquid is simmering too aggressively, lower the oven heat by 10 or 15 degrees. Continue braising, turning the shanks and spooning some pan juices over the top after the first 40 minutes, until the meat is completely tender and pulling away from the bone, about 2 hours.\r\nThe gremolata: While the shanks are braising, stir together the garlic, parsley, and lemon zest in a small bowl. Cover with plastic wrap and set aside in a cool place (or the refrigerator, if your kitchen is very warm.)\r\nThe finish: When the veal is fork-tender and falling away from the bone, remove the lid and sprinkle over half of the gremolata. Return the veal to the oven, uncovered, for another 15 minutes to caramelize it some.\r\nUsing a slotted spatula or spoon, carefully lift the shanks from the braising liquid, doing your best to keep them intact. The shanks will be very tender and threatening to fall into pieces, and the marrow will be wobbly inside the bones, so this can be a bit tricky. But if they do break apart, don’t worry, the flavor won’t suffer at all. Arrange the shanks on a serving platter or other large plate, without stacking, and cover with foil to keep warm.\r\nFinishing the sauce: Set the braising pot on top of the stove and evaluate the sauce: if there is a visible layer of fat floating on the surface, use a large spoon to skim it off and discard it. Taste the sauce for concentration of flavor. If it tastes a bit weak or flat, bring it to a boil over high heat, and boil to reduce the volume and intensify the flavor for 5 to 10 minutes. Taste again for salt and pepper. If the sauce wants more zip, stir in a teaspoon or two of the remaining gremolata.\r\nPortioning the veal shanks: if the shanks are reasonably sized, serve one per person. If the shanks are gargantuan or you’re dealing with modest appetites, pull apart the larger shanks, separating them at their natural seams, and serve smaller amounts. Be sure to give the marrow bones to whomever prizes them most.\r\nServing: Arrange the veal shanks on warm dinner plates accompanied by the risotto, if serving. Just before carrying the plates to the table, sprinkle on the remaining gremolata and then spoon over a generous amount of sauce – the contact with the hot liquid will aromatize the gremolata and perk up everyone’s appetite with the whiff of garlic and lemon.	A classic Italian dish of veal shanks slow-cooked in a tomato-based sauce and served with gremolata.	210	https://ftp.goit.study/img/so-yummy/preview/Osso%20Buco%20alla%20Milanese.jpg	2025-07-09 17:36:40.112+00	2025-07-09 17:36:40.112+00
200	Beef and Oyster pie	5	7	3	Season the beef cubes with salt and black pepper. Heat a tablespoon of oil in the frying pan and fry the meat over a high heat. Do this in three batches so that you don’t overcrowd the pan, transferring the meat to a large flameproof casserole dish once it is browned all over. Add extra oil if the pan seems dry.\r\nIn the same pan, add another tablespoon of oil and cook the shallots for 4-5 minutes, then add the garlic and fry for 30 seconds. Add the bacon and fry until slightly browned. Transfer the onion and bacon mixture to the casserole dish and add the herbs.\r\nPreheat the oven to 180C/350F/Gas 4.\r\nPour the stout into the frying pan and bring to the boil, stirring to lift any stuck-on browned bits from the bottom of the pan. Pour the stout over the beef in the casserole dish and add the stock. Cover the casserole and place it in the oven for 1½-2 hours, or until the beef is tender and the sauce is reduced.\r\nSkim off any surface fat, taste and add salt and pepper if necessary, then stir in the cornflour paste. Put the casserole dish on the hob – don’t forget that it will be hot – and simmer for 1-2 minutes, stirring, until thickened. Leave to cool.\r\nIncrease the oven to 200C/400F/Gas 6. To make the pastry, put the flour and salt in a very large bowl. Grate the butter and stir it into the flour in three batches. Gradually add 325ml/11fl oz cold water – you may not need it all – and stir with a round-bladed knife until the mixture just comes together. Knead the pastry lightly into a ball on a lightly floured surface and set aside 250g/9oz for the pie lid.\r\nRoll the rest of the pastry out until about 2cm/¾in larger than the dish you’re using. Line the dish with the pastry then pile in the filling, tucking the oysters in as well. Brush the edge of the pastry with beaten egg.\r\nRoll the remaining pastry until slightly larger than your dish and gently lift over the filling, pressing the edges firmly to seal, then trim with a sharp knife. Brush with beaten egg to glaze. Put the dish on a baking tray and bake for 25-30 minutes, or until the pastry is golden-brown and the filling is bubbling.	A rich and flavorful beef pie with the added luxury of fresh oysters.	210	https://ftp.goit.study/img/so-yummy/preview/Beef%20and%20Oyster%20pie.jpg	2025-07-09 17:36:40.124+00	2025-07-09 17:36:40.124+00
201	Kentucky Fried Chicken	4	11	3	Preheat fryer to 350°F. Thoroughly mix together all the spice mix ingredients.\r\nCombine spice mix with flour, brown sugar and salt.\r\nDip chicken pieces in egg white to lightly coat them, then transfer to flour mixture. Turn a few times and make sure the flour mix is really stuck to the chicken. Repeat with all the chicken pieces.\r\nLet chicken pieces rest for 5 minutes so crust has a chance to dry a bit.\r\nFry chicken in batches. Breasts and wings should take 12-14 minutes, and legs and thighs will need a few more minutes. Chicken pieces are done when a meat thermometer inserted into the thickest part reads 165°F.\r\nLet chicken drain on a few paper towels when it comes out of the fryer. Serve hot.	A famous American fast food chain known for its crispy, seasoned fried chicken.	60	https://ftp.goit.study/img/so-yummy/preview/Kentucky%20Fried%20Chicken.jpg	2025-07-09 17:36:40.138+00	2025-07-09 17:36:40.138+00
202	Chicken Karaage	4	8	3	Add the ginger, garlic, soy sauce, sake and sugar to a bowl and whisk to combine. Add the chicken, then stir to coat evenly. Cover and refrigerate for at least 1 hour.\r\n\r\nAdd 1 inch of vegetable oil to a heavy bottomed pot and heat until the oil reaches 360 degrees F. Line a wire rack with 2 sheets of paper towels and get your tongs out. Put the potato starch in a bowl\r\n\r\nAdd a handful of chicken to the potato starch and toss to coat each piece evenly.\r\n\r\nFry the karaage in batches until the exterior is a medium brown and the chicken is cooked through. Transfer the fried chicken to the paper towel lined rack. If you want the karaage to stay crispy longer, you can fry the chicken a second time, until it's a darker color after it's cooled off once. Serve with lemon wedges.	Japanese-style fried chicken	120	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Karaage.jpg	2025-07-09 17:36:40.156+00	2025-07-09 17:36:40.156+00
203	Spanish Tortilla	9	15	3	Put a large non-stick frying pan on a low heat. Cook the onion slowly in the oil and butter until soft but not brown – this should take about 15 mins. Add the potatoes, cover the pan and cook for a further 15-20 mins, stirring occasionally to make sure they fry evenly.\r\nWhen the potatoes are soft and the onion is shiny, crush 2 garlic cloves and stir in, followed by the beaten eggs.\r\nPut the lid back on the pan and leave the tortilla to cook gently. After 20 mins, the edges and base should be golden, the top set but the middle still a little wobbly. To turn it over, slide it onto a plate and put another plate on top, turn the whole thing over and slide it back into the pan to finish cooking. Once cooked, transfer to a plate and serve the tortilla warm or cold, scattered with the chopped parsley.\r\nTo accompany, take slices of warmed baguette, stab all over with a fork and rub with the remaining garlic, pile on grated tomatoes and season with sea salt and a drizzle of olive oil.	A classic Spanish dish made with potatoes, onions, and eggs, perfect for breakfast or brunch.	60	https://ftp.goit.study/img/so-yummy/preview/Spanish%20Tortilla.jpg	2025-07-09 17:36:40.164+00	2025-07-09 17:36:40.164+00
204	Chicken Enchilada Casserole	4	12	3	Cut each chicken breast in about 3 pieces, so that it cooks faster and put it in a small pot. Pour Enchilada sauce over it and cook covered on low to medium heat until chicken is cooked through, about 20 minutes. No water is needed, the chicken will cook in the Enchilada sauce. Make sure you stir occasionally so that it doesn't stick to the bottom.\r\nRemove chicken from the pot and shred with two forks.\r\nPreheat oven to 375 F degrees.\r\nStart layering the casserole. Start with about ¼ cup of the leftover Enchilada sauce over the bottom of a baking dish. I used a longer baking dish, so that I can put 2 corn tortillas across. Place 2 tortillas on the bottom, top with ⅓ of the chicken and ⅓ of the remaining sauce. Sprinkle with ⅓ of the cheese and repeat starting with 2 more tortillas, then chicken, sauce, cheese. Repeat with last layer with the remaining ingredients, tortillas, chicken, sauce and cheese.\r\nBake for 20 to 30 minutes uncovered, until bubbly and cheese has melted and started to brown on top.\r\nServe warm.	A Mexican-inspired casserole made with shredded chicken, enchilada sauce, tortillas, and cheese.	60	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Enchilada%20Casserole.jpg	2025-07-09 17:36:40.175+00	2025-07-09 17:36:40.175+00
205	Pilchard puttanesca	11	2	3	Cook the pasta following pack instructions. Heat the oil in a non-stick frying pan and cook the onion, garlic and chilli for 3-4 mins to soften. Stir in the tomato purée and cook for 1 min, then add the pilchards with their sauce. Cook, breaking up the fish with a wooden spoon, then add the olives and continue to cook for a few more mins.\r\n\r\nDrain the pasta and add to the pan with 2-3 tbsp of the cooking water. Toss everything together well, then divide between plates and serve, scattered with Parmesan.	Sauce made with tomatoes, olives, and pilchards	20	https://ftp.goit.study/img/so-yummy/preview/Pilchard%20puttanesca.jpg	2025-07-09 17:36:40.179+00	2025-07-09 17:36:40.179+00
206	Peach & Blueberry Grunt	6	11	3	Heat oven to 190C/170C fan/gas 5. Butter a wide shallow ovenproof dish. Blend the cornflour with the orange zest and juice, and put in a large pan with the sugar. Halve, stone and slice the peaches and add to the pan. Bring slowly to the boil, stirring gently until the sauce is shiny and thickened, about 3-4 mins. Remove from the heat, stir in the blueberries and tip into the prepared dish.\r\nTip the flour into a mixing bowl and add the 50g butter. Rub the butter into the flour until it resembles fine breadcrumbs, then stir in half the sugar. Mix the remaining sugar with the cinnamon and set aside.\r\nAdd the milk to the dry ingredients and mix to a soft dough. Turn out onto a lightly floured surface and knead briefly. Roll out to an oblong roughly 16 x 24cm. Brush with melted butter and sprinkle evenly with the spicy sugar. Roll up from one long side and cut into 12 slices. Arrange around the top of the dish, leaving the centre uncovered.\r\nBake for 20-25 mins, until the topping is crisp and golden. Serve warm.	A fruity dessert made with peaches and blueberries, topped with a sweet biscuit-like topping.	50	https://ftp.goit.study/img/so-yummy/preview/Peach%20_%20Blueberry%20Grunt.jpg	2025-07-09 17:36:40.186+00	2025-07-09 17:36:40.186+00
207	Kedgeree	1	7	3	For the rice, heat the oil in a large, lidded pan, add the onion, then gently fry for 5 mins until softened but not coloured. Add the spices, season with salt, then continue to fry until the mix start to go brown and fragrant; about 3 mins.\r\nAdd the rice and stir in well. Add 600ml water, stir, then bring to the boil. Reduce to a simmer, then cover for 10 mins. Take off the heat and leave to stand, covered, for 10-15 mins more. The rice will be perfectly cooked if you do not lift the lid before the end of the cooking.\r\nMeanwhile, put the haddock and bay leaves in a frying pan, cover with the milk, then poach for 10 mins until the flesh flakes. Remove from the milk, peel away the skin, then flake the flesh into thumbsize pieces. Place the eggs in a pan, cover with water, bring to the boil, then reduce to a simmer. Leave for 4½-5 mins, plunge into cold water, then peel and cut the eggs into quarters. Gently mix the fish, eggs, parsley, coriander and rice together in the pan. Serve hot, sprinkled with a few extra herbs.	A rice dish with smoked fish, eggs, and spices, often served as a breakfast or brunch item.	45	https://ftp.goit.study/img/so-yummy/preview/Kedgeree.jpg	2025-07-09 17:36:40.193+00	2025-07-09 17:36:40.193+00
208	Cajun spiced fish tacos	1	12	3	Cooking in a cajun spice and cayenne pepper marinade makes this fish super succulent and flavoursome. Top with a zesty dressing and serve in a tortilla for a quick, fuss-free main that's delightfully summery.\r\n\r\nOn a large plate, mix the cajun spice and cayenne pepper with a little seasoning and use to coat the fish all over.\r\n\r\nHeat a little oil in a frying pan, add in the fish and cook over a medium heat until golden. Reduce the heat and continue frying until the fish is cooked through, about 10 minutes. Cook in batches if you don’t have enough room in the pan.\r\n\r\nMeanwhile, prepare the dressing by combining all the ingredients with a little seasoning.\r\nSoften the tortillas by heating in the microwave for 5-10 seconds. Pile high with the avocado, lettuce and spring onion, add a spoonful of salsa, top with large flakes of fish and drizzle over the dressing.	A tasty Mexican dish of fish tacos seasoned with Cajun spices and served with a variety of toppings and sauces.	25	https://ftp.goit.study/img/so-yummy/preview/Cajun%20spiced%20fish%20tacos.jpg	2025-07-09 17:36:40.205+00	2025-07-09 17:36:40.205+00
209	Turkey Meatloaf	10	7	3	Heat oven to 180C/160C fan/gas 4. Heat the oil in a large frying pan and cook the onion for 8-10 mins until softened. Add the garlic, Worcestershire sauce and 2 tsp tomato purée, and stir until combined. Set aside to cool.\r\n\r\nPut the turkey mince, egg, breadcrumbs and cooled onion mix in a large bowl and season well. Mix everything to combine, then shape into a rectangular loaf and place in a large roasting tin. Spread 2 tbsp barbecue sauce over the meatloaf and bake for 30 mins.\r\n\r\nMeanwhile, drain 1 can of beans only, then pour both cans into a large bowl. Add the remaining barbecue sauce and tomato purée. Season and set aside.\r\n\r\nWhen the meatloaf has had its initial cooking time, scatter the beans around the outside and bake for 15 mins more until the meatloaf is cooked through and the beans are piping hot. Scatter over the parsley and serve the meatloaf in slices.	A healthier twist on the classic meatloaf, made with ground turkey and flavorful spices.	75	https://ftp.goit.study/img/so-yummy/preview/Turkey%20Meatloaf.jpg	2025-07-09 17:36:40.214+00	2025-07-09 17:36:40.214+00
210	Pancakes	6	11	3	Put the flour, eggs, milk, 1 tbsp oil and a pinch of salt into a bowl or large jug, then whisk to a smooth batter. Set aside for 30 mins to rest if you have time, or start cooking straight away.\r\nSet a medium frying pan or crêpe pan over a medium heat and carefully wipe it with some oiled kitchen paper. When hot, cook your pancakes for 1 min on each side until golden, keeping them warm in a low oven as you go.\r\nServe with lemon wedges and sugar, or your favourite filling. Once cold, you can layer the pancakes between baking parchment, then wrap in cling film and freeze for up to 2 months.	A classic breakfast staple made with flour, milk, and eggs. Serve with your favorite toppings.	30	https://ftp.goit.study/img/so-yummy/preview/Pancakes.jpg	2025-07-09 17:36:40.223+00	2025-07-09 17:36:40.223+00
211	Nutty Chicken Curry	4	10	3	Finely slice a quarter of the chilli, then put the rest in a food processor with the ginger, garlic, coriander stalks and one-third of the leaves. Whizz to a rough paste with a splash of water if needed.\r\nHeat the oil in a frying pan, then quickly brown the chicken chunks for 1 min. Stir in the paste for another min, then add the peanut butter, stock and yogurt. When the sauce is gently bubbling, cook for 10 mins until the chicken is just cooked through and sauce thickened. Stir in most of the remaining coriander, then scatter the rest on top with the chilli, if using. Eat with rice or mashed sweet potato.	A rich and spicy curry made with chicken, nuts, and other ingredients. Served over rice or with naan bread.	25	https://ftp.goit.study/img/so-yummy/preview/Nutty%20Chicken%20Curry.jpg	2025-07-09 17:36:40.229+00	2025-07-09 17:36:40.229+00
212	Mustard champ	13	6	3	STEP 1\r\nBoil the potatoes for 15 mins or until tender. Drain, then mash.\r\n\r\nSTEP 2\r\nHeat the milk and half the butter in the corner of the pan, then beat into the mash, along with the wholegrain mustard.\r\n\r\nSTEP 3\r\nGently fry the spring onions in the remaining butter for 2 mins until just soft but still a perky green. Fold into the mash and serve. Great with gammon or to top a fish pie.	Mustard champ is a classic Irish side dish made with mashed potatoes, scallions, and wholegrain mustard, perfect to pair with any main course.	20	https://ftp.goit.study/img/so-yummy/preview/Mustard%20champ.jpg	2025-07-09 17:36:40.239+00	2025-07-09 17:36:40.239+00
213	Spaghetti alla Carbonara	11	2	3	STEP 1\r\nPut a large saucepan of water on to boil.\r\n\r\nSTEP 2\r\nFinely chop the 100g pancetta, having first removed any rind. Finely grate 50g pecorino cheese and 50g parmesan and mix them together.\r\n\r\nSTEP 3\r\nBeat the 3 large eggs in a medium bowl and season with a little freshly grated black pepper. Set everything aside.\r\n\r\nSTEP 4\r\nAdd 1 tsp salt to the boiling water, add 350g spaghetti and when the water comes back to the boil, cook at a constant simmer, covered, for 10 minutes or until al dente (just cooked).\r\n\r\nSTEP 5\r\nSquash 2 peeled plump garlic cloves with the blade of a knife, just to bruise it.\r\n\r\nSTEP 6\r\nWhile the spaghetti is cooking, fry the pancetta with the garlic. Drop 50g unsalted butter into a large frying pan or wok and, as soon as the butter has melted, tip in the pancetta and garlic.\r\n\r\nSTEP 7\r\nLeave to cook on a medium heat for about 5 minutes, stirring often, until the pancetta is golden and crisp. The garlic has now imparted its flavour, so take it out with a slotted spoon and discard.\r\n\r\nSTEP 8\r\nKeep the heat under the pancetta on low. When the pasta is ready, lift it from the water with a pasta fork or tongs and put it in the frying pan with the pancetta. Don’t worry if a little water drops in the pan as well (you want this to happen) and don’t throw the pasta water away yet.\r\n\r\nSTEP 9\r\nMix most of the cheese in with the eggs, keeping a small handful back for sprinkling over later.\r\n\r\nSTEP 10\r\nTake the pan of spaghetti and pancetta off the heat. Now quickly pour in the eggs and cheese. Using the tongs or a long fork, lift up the spaghetti so it mixes easily with the egg mixture, which thickens but doesn’t scramble, and everything is coated.\r\n\r\nSTEP 11\r\nAdd extra pasta cooking water to keep it saucy (several tablespoons should do it). You don’t want it wet, just moist. Season with a little salt, if needed.\r\n\r\nSTEP 12\r\nUse a long-pronged fork to twist the pasta on to the serving plate or bowl. Serve immediately with a little sprinkling of the remaining cheese and a grating of black pepper. If the dish does get a little dry before serving, splash in some more hot pasta water and the glossy sauciness will be revived.	A classic Italian pasta dish made with spaghetti, eggs, pecorino romano cheese, pancetta, and black pepper.	35	https://ftp.goit.study/img/so-yummy/preview/Spaghetti%20alla%20Carbonara.jpg	2025-07-09 17:36:40.244+00	2025-07-09 17:36:40.244+00
214	Fruit and Cream Cheese Breakfast Pastries	12	11	3	Preheat oven to 400ºF (200ºC), and prepare two cookie sheets with parchment paper. In a bowl, mix cream cheese, sugar, and vanilla until fully combined. Lightly flour the surface and roll out puff pastry on top to flatten. Cut each sheet of puff pastry into 9 equal squares. On the top right and bottom left of the pastry, cut an L shape approximately ½ inch (1 cm) from the edge.\r\nNOTE: This L shape should reach all the way down and across the square, however both L shapes should not meet at the ends. Your pastry should look like a picture frame with two corners still intact.\r\nTake the upper right corner and fold down towards the inner bottom corner. You will now have a diamond shape.\r\nPlace 1 to 2 teaspoons of the cream cheese filling in the middle, then place berries on top.\r\nRepeat with the remaining pastry squares and place them onto the parchment covered baking sheet.\r\nBake for 15-20 minutes or until pastry is golden brown and puffed.\r\nEnjoy!\r\n	A delicious breakfast treat, Fruit and Cream Cheese Breakfast Pastries are flaky, buttery pastries filled with a sweet cream cheese and fruit filling, and then baked until golden brown.	20	https://ftp.goit.study/img/so-yummy/preview/Fruit%20and%20Cream%20Cheese%20Breakfast%20Pastries.jpg	2025-07-09 17:36:40.25+00	2025-07-09 17:36:40.25+00
215	French Onion Chicken with Roasted Carrots & Mashed Potatoes	4	11	3	1\r\n\r\nPreheat oven to 425 degrees. Wash and dry all produce. Trim, peel, and cut carrots on a diagonal into ¼-inch-thick pieces. Dice potatoes into ½-inch pieces. Halve, peel, and thinly slice onion.\r\n\r\n2\r\n\r\nToss carrots on a baking sheet with a drizzle of oil, salt, and pepper. Roast until browned and tender, 15-20 minutes.\r\n\r\n3\r\n\r\nMeanwhile, place potatoes in a medium pot with enough salted water to cover by 2 inches. Bring to a boil and cook until tender, 12-15 minutes. Drain and return potatoes to pot; cover to keep warm.\r\n\r\n4\r\n\r\nWhile potatoes cook, heat a drizzle of oil in a large pan over medium-high heat. Add onion and cook, stirring occasionally, until lightly browned and softened, 8-10 minutes. Sprinkle with 1 tsp sugar (2 tsp for 4 servings). Stir in stock concentrate and 2 TBSP water (¼ cup for 4); season with salt and pepper. Cook until jammy, 2-3 minutes more. Turn off heat; transfer to a small bowl. Wash out pan.\r\n\r\n5\r\n\r\nPat chicken dry with paper towels; season all over with salt and pepper. Heat a drizzle of oil in pan used for onion over medium-high heat. Add chicken and cook until browned and cooked through, 5-6 minutes per side. In the last 1-2 minutes of cooking, top with caramelized onion and cheese. Cover pan until cheese melts. (If your pan doesn’t have a lid, cover with a baking sheet!)\r\n\r\n6\r\n\r\nHeat pot with drained potatoes over low heat; mash with sour cream, 2 TBSP butter (4 TBSP for 4 servings), salt, pepper, and a splash of water (or milk, for extra richness) until smooth. Divide chicken, roasted carrots, and mashed potatoes between plates.	Tender chicken is smothered in a rich French onion sauce and served with sides of roasted carrots and creamy mashed potatoes.	50	https://ftp.goit.study/img/so-yummy/preview/French%20Onion%20Chicken%20with%20Roasted%20Carrots%20_%20Mashed%20Potatoes.jpg	2025-07-09 17:36:40.257+00	2025-07-09 17:36:40.257+00
216	Coddled pork with cider	8	6	3	STEP 1\r\nHeat the butter in a casserole dish until sizzling, then fry the pork for 2-3 mins on each side until browned. Remove from the pan.\r\n\r\nSTEP 2\r\nTip the bacon, carrot, potatoes and swede into the pan, then gently fry until slightly coloured. Stir in the cabbage, sit the chops back on top, add the bay leaf, then pour over the cider and stock. Cover the pan, then leave everything to gently simmer for 20 mins until the pork is cooked through and the vegetables are tender.\r\n\r\nSTEP 3\r\nServe at the table spooned straight from the dish.	Coddled pork with cider is a comforting Irish dish of tender pork loin simmered with apples, onions, and cider until it's juicy and flavorful.	25	https://ftp.goit.study/img/so-yummy/preview/Coddled%20pork%20with%20cider.jpg	2025-07-09 17:36:40.27+00	2025-07-09 17:36:40.27+00
217	Garides Saganaki	1	19	3	Place the prawns in a pot and add enough water to cover. Boil for 5 minutes. Drain, reserving the liquid, and set aside.\r\nHeat 2 tablespoons of oil in a saucepan. Add the onion; cook and stir until soft. Mix in the parsley, wine, tomatoes, garlic and remaining olive oil. Simmer, stirring occasionally, for about 30 minutes, or until the sauce is thickened.\r\nWhile the sauce is simmering, the prawns should become cool enough to handle. First remove the legs by pinching them, and then pull off the shells, leaving the head and tail on.\r\nWhen the sauce has thickened, stir in the prawns. Bring to a simmer again if the sauce has cooled with the prawns, and cook for about 5 minutes. Add the feta and remove from the heat. Let stand until the cheese starts to melt. Serve warm with slices of crusty bread.\r\nThough completely untraditional, you can add a few tablespoons of stock or passata to this recipe to make a delicious pasta sauce. Toss with pasta after adding the feta, and serve.	A Greek dish made with prawns, tomatoes, feta cheese, and herbs, cooked in a tomato-based sauce.	45	https://ftp.goit.study/img/so-yummy/preview/Garides%20Saganaki.jpg	2025-07-09 17:36:40.279+00	2025-07-09 17:36:40.279+00
218	Boxty Breakfast	8	6	3	STEP 1\r\nBefore you start, put your oven on its lowest setting, ready to keep things warm. Peel the potatoes, grate 2 of them, then set aside. Cut the other 2 into large chunks, then boil for 10-15 mins or until tender. Meanwhile, squeeze as much of the liquid from the grated potatoes as you can using a clean tea towel. Mash the boiled potatoes, then mix with the grated potato, spring onions and flour.\r\n\r\nSTEP 2\r\nWhisk the egg white in a large bowl until it holds soft peaks. Fold in the buttermilk, then add the bicarbonate of soda. Fold into the potato mix.\r\n\r\nSTEP 3\r\nHeat a large non-stick frying pan over a medium heat, then add 1 tbsp butter and some of the oil. Drop 3-4 spoonfuls of the potato mixture into the pan, then gently cook for 3-5 mins on each side until golden and crusty. Keep warm on a plate in the oven while you cook the next batch, adding more butter and oil to the pan before you do so. You will get 16 crumpet-size boxty from the mix. Can be made the day ahead, drained on kitchen paper, then reheated in a low oven for 20 mins.\r\n\r\nSTEP 4\r\nHeat the grill to medium and put the tomatoes in a heavy-based pan. Add a good knob of butter and a little oil, then fry for about 5 mins until softened. Grill the bacon, then pile onto a plate and keep warm. Stack up the boxty, bacon and egg, and serve the tomatoes on the side.	Boxty Breakfast is a traditional Irish breakfast dish made with grated potatoes, flour, and buttermilk, formed into pancakes and served with bacon, eggs, and black pudding.	50	https://ftp.goit.study/img/so-yummy/preview/Boxty%20Breakfast.jpg	2025-07-09 17:36:40.285+00	2025-07-09 17:36:40.285+00
219	Timbits	6	16	3	Sift together dry ingredients.\r\nMix together wet ingredients and incorporate into dry. Stir until smooth.\r\nDrop by teaspoonfuls(no bigger) into hot oil (365 degrees, no hotter), turning after a few moments until golden brown on all sides.\r\nRemove and drain.\r\nRoll in cinnamon sugar while still warm and serve.	A type of doughnut hole that is popular in Canada, sold at Tim Hortons coffee shops. They come in various flavors, such as honey dip, chocolate glazed, and birthday cake.	25	https://ftp.goit.study/img/so-yummy/preview/Timbits.jpg	2025-07-09 17:36:40.297+00	2025-07-09 17:36:40.297+00
222	Polskie Naleśniki (Polish Pancakes)	6	25	3	Add flour, eggs, milk, water, and salt in a large bowl then mix with a hand mixer until you have a smooth, lump-free batter.\r\nAt this point, mix in the butter or the vegetable oil. Alternatively, you can use them to grease the pan before frying each pancake.\r\nHeat a non-stick pan over medium heat, then pour in the batter, swirling the pan to help it spread.\r\nWhen the pancake starts pulling away a bit from the sides, and the top is no longer wet, flip it and cook shortly on the other side as well.\r\nTransfer to a plate. Cook the remaining batter until all used up.\r\nServe warm, with the filling of your choice.	Similar to French crepes, Polskie Naleśniki are thin, delicate pancakes made from a batter of flour, eggs, and milk, and typically served with sweet or savory fillings.	25	https://ftp.goit.study/img/so-yummy/preview/Polskie%20Nale_niki%20_Polish%20Pancakes_.jpg	2025-07-09 17:36:40.335+00	2025-07-09 17:36:40.335+00
223	Mushroom soup with buckwheat	13	21	3	Chop the onion and garlic, slice the mushrooms and wash the buckwheat. Heat the oil and lightly sauté the onion. Add the mushrooms and the garlic and continue to sauté. Add the salt, vegetable seasoning, buckwheat and the bay leaf and cover with water. Simmer gently and just before it is completely cooked, add pepper, sour cream mixed with flour, the chopped parsley and vinegar to taste.	Mushroom soup with buckwheat is a nourishing and delicious soup made with earthy mushrooms, buckwheat, and vegetables. It's hearty, comforting, and perfect for chilly days.	30	https://ftp.goit.study/img/so-yummy/preview/Mushroom%20soup%20with%20buckwheat.jpg	2025-07-09 17:36:40.341+00	2025-07-09 17:36:40.341+00
224	Piri-piri chicken and slaw	4	20	3	STEP 1\r\n\r\nWhizz together all of the marinade ingredients in a small food processor. Rub the marinade onto the chicken and leave for 1 hour at room temperature.\r\n\r\nSTEP 2\r\n\r\nHeat the oven to 190C/fan 170C/gas 5. Put the chicken in a roasting tray and cook for 1 hour 20 minutes. Rest under loose foil for 20 minutes. While the chicken is resting, mix together the slaw ingredients and season. Serve the chicken with slaw, fries and condiments.	Piri-piri chicken and slaw is a spicy and flavorful Portuguese dish of grilled chicken marinated in a spicy piri-piri sauce, served with a fresh slaw of cabbage, carrots, and onions.	80	https://ftp.goit.study/img/so-yummy/preview/Piri-piri%20chicken%20and%20slaw.jpg	2025-07-09 17:36:40.35+00	2025-07-09 17:36:40.35+00
225	Skillet Apple Pork Chops with Roasted Sweet Potatoes & Zucchini	8	11	3	\r\nServes 2\r\n\r\n\r\n1. \r\n\r\nAdjust racks to top and middle positions and preheat oven to 450 degrees. Wash and dry all produce. Dice sweet potatoes into 1/2-inch pieces. Toss on a baking sheet with a drizzle of oil, salt, and pepper. Roast on top rack for 12 minutes (we'll roast the zucchini then). \r\n\r\n\r\n2. \r\n\r\nMeanwhile, halve and core apple; thinly slice into half-moons. Peel and finely chop garlic. Quarter lemon. Trim and halve zucchini lengthwise; cut crosswise into 1/2-inch-thick half-moons. Toss on a second baking sheet with a drizzle of oil and a pinch of salt and pepper. Set aside. \r\n\r\n\r\n3. \r\n\r\nPat pork dry with paper towels and season all over with salt and pepper. Heat a drizzle of oil in a large pan over medium-high heat. Add pork and cook until browned and cooked through, 4-5 minutes per side. Turn off heat; transfer to a plate. \r\n\r\n\r\n4. \r\n\r\nOnce sweet potatoes have roasted 12 minutes, transfer baking sheet with zucchini to middle rack and continue roasting until both veggies are browned and softened, 12-15 minutes more. \r\n\r\n\r\n5. \r\n\r\nMeanwhile, melt 1 TBSP butter (2 TBSP for 4 servings) in pan used for pork over medium-high heat. Add apple and season with salt and pepper. Cook, scraping up any browned bits from bottom of pan, until apple is slightly softened, 2-3 minutes. Add garlic; cook until fragrant, 30 seconds. Add 1/z cup water (3/4 cup for 4), stock concentrate, and 11/2 tsp sugar (3 tsp for 4). Cook, stirring, until sauce has thickened and apple is very tender, 3-5 minutes. Season with salt and pepper. \r\n\r\n\r\n6. \r\n\r\nRemove pan with apple from heat; stir in 1 TBSP butter (2 TBSP for 4 servings) and a squeeze of lemon juice. Divide pork, zucchini, and sweet potatoes between plates. Top pork with glazed apple sauce. Top zucchini with a squeeze of lemon juice. 	Tender pork chops are cooked in a skillet with apples and served with a side of roasted sweet potatoes and zucchini.	45	https://ftp.goit.study/img/so-yummy/preview/Skillet%20Apple%20Pork%20Chops%20with%20Roasted%20Sweet%20Potatoes%20_%20Zucchini.jpg	2025-07-09 17:36:40.364+00	2025-07-09 17:36:40.364+00
226	Roti john	5	13	3	Mix all the ingredients in a bowl.\r\nHeat a pan or griddle with a little vegetable oil.\r\nPour the mixture onto the pan and place a piece of open-faced baguette on top.\r\nPress on the bread with a spatula and grill for 2 minutes.\r\nTurn the bread over to make it a little crispy.\r\nRemove from pan and cut the bread into small portions.\r\nAdd mayonnaise and/or Sambal before cutting the sandwich (optional).	A popular Malaysian street food, consisting of a long loaf of bread filled with a mixture of eggs, onions, and meat like beef or chicken. Served hot and crispy, often with a side of chili sauce or mayonnaise.	4	https://ftp.goit.study/img/so-yummy/preview/Roti%20john.jpg	2025-07-09 17:36:40.373+00	2025-07-09 17:36:40.373+00
227	Smoked Haddock Kedgeree	12	10	3	Melt 50g butter in a large saucepan (about 20cm across), add 1 finely chopped medium onion and cook gently over a medium heat for 5 minutes, until softened but not browned.\r\n\r\nStir in 3 split cardamom pods, ¼ tsp turmeric, 1 small cinnamon stick and 2 bay leaves, then cook for 1 minute.\r\n\r\nTip in 450g basmati rice and stir until it is all well coated in the spicy butter.\r\n\r\nPour in 1 litre chicken or fish stock, add ½ teaspoon salt and bring to the boil, stir once to release any rice from the bottom of the pan. Cover with a close-fitting lid, reduce the heat to low and leave to cook very gently for 12 minutes.\r\n\r\nMeanwhile, bring some water to the boil in a large shallow pan. Add 750g un-dyed smoked haddock fillet and simmer for 4 minutes, until the fish is just cooked. Lift it out onto a plate and leave until cool enough to handle.\r\n\r\nHard-boil 3 eggs for 8 minutes.\r\n\r\nFlake the fish, discarding any skin and bones. Drain the eggs, cool slightly, then peel and chop.\r\n\r\nUncover the rice and remove the bay leaves, cinnamon stick and cardamom pods if you wish to. Gently fork in the fish and the chopped eggs, cover again and return to the heat for 2-3 minutes, or until the fish has heated through.\r\n\r\nGently stir in almost all the 3 tbsp chopped fresh parsley, and season with a little salt and black pepper to taste. Serve scattered with the remaining parsley and garnished with 1 lemon, cut into wedges.	A traditional Anglo-Indian dish with smoked haddock, rice, hard-boiled eggs, and fragrant spices. A flavorful and satisfying meal that's easy to make.	25	https://ftp.goit.study/img/so-yummy/preview/Smoked%20Haddock%20Kedgeree.jpg	2025-07-09 17:36:40.379+00	2025-07-09 17:36:40.379+00
228	Beef Lo Mein	5	22	3	STEP 1 - MARINATING THE BEEF\r\nIn a bowl, add the beef, salt, 1 pinch white pepper, 1 Teaspoon sesame seed oil, 1/2 egg, corn starch,1 Tablespoon of oil and mix together.\r\nSTEP 2 - BOILING THE THE NOODLES\r\nIn a 6 qt pot add your noodles to boiling water until the noodles are submerged and boil on high heat for 10 seconds. After your noodles is done boiling strain and cool with cold water.\r\nSTEP 3 - STIR FRY\r\nAdd 2 Tablespoons of oil, beef and cook on high heat untill beef is medium cooked.\r\nSet the cooked beef aside\r\nIn a wok add 2 Tablespoon of oil, onions, minced garlic, minced ginger, bean sprouts, mushrooms, peapods and 1.5 cups of water or until the vegetables are submerged in water.\r\nAdd the noodles to wok\r\nTo make the sauce, add oyster sauce, 1 pinch white pepper, 1 teaspoon sesame seed oil, sugar, and 1 Teaspoon of soy sauce.\r\nNext add the beef to wok and stir-fry	A Chinese dish made with stir-fried beef and vegetables, served with soft egg noodles in a savory sauce.	30	https://ftp.goit.study/img/so-yummy/preview/Beef%20Lo%20Mein.jpg	2025-07-09 17:36:40.391+00	2025-07-09 17:36:40.391+00
230	Portuguese prego with green piri-piri	5	20	3	STEP 1\r\n\r\nRub the garlic over the steaks then put in a sandwich bag and tip in the olive oil, sherry vinegar and parsley stalks. Smoosh everything together, then use a rolling pin to bash the steaks a few times. Leave for 1-2 hours.\r\n\r\nSTEP 2\r\n\r\nTo make the sauce, put all the ingredients into a blender with 1 tbsp water and whizz until as smooth as possible. This will make more than you’ll need for the recipe but will keep for a week in an airtight jar.\r\n\r\nSTEP 3\r\n\r\nHeat a griddle or frying pan to high. Brush away the garlic and parsley stalks from the steaks and season well. Sear the steaks for 2 minutes on each side then rest on a plate. Put the ciabatta halves onto the plate, toasted-side down, to soak up any juices.\r\n\r\nSTEP 4\r\n\r\nSlice the steaks then stuff into the rolls with the green sauce and rocket.	Portuguese prego with green piri-piri is a traditional sandwich of steak marinated in garlic and olive oil, served on a roll with spicy piri-piri sauce and sautéed onions.	150	https://ftp.goit.study/img/so-yummy/preview/Portuguese%20prego%20with%20green%20piri-piri.jpg	2025-07-09 17:36:40.415+00	2025-07-09 17:36:40.415+00
231	Chickpea Fajitas	9	12	3	Heat oven to 200C/180C fan/gas 6 and line a baking tray with foil. Drain the chickpeas, pat dry and tip onto the prepared baking tray. Add the oil and paprika, toss to coat, then roast for 20-25 mins until browned and crisp, shaking halfway through cooking.\r\n\r\nMeanwhile, put the tomatoes and onion in a small bowl with the vinegar and set aside to pickle. Put the avocado in another bowl and mash with a fork, leaving some larger chunks. Stir in the lime juice and season well. Mix the soured cream with the harissa and set aside until ready to serve.\r\n\r\nHeat a griddle pan until nearly smoking. Add the tortillas , one at a time, charring each side until hot with griddle lines. \r\n\r\nPut everything on the table and build the fajitas : spread a little of the harissa cream over the tortilla, top with roasted chickpeas, guacamole, pickled salsa and coriander, if you like. Serve with the lime wedges for squeezing over.	A vegetarian twist on a classic Mexican dish, made with chickpeas and a variety of vegetables.	35	https://ftp.goit.study/img/so-yummy/preview/Chickpea%20Fajitas.jpg	2025-07-09 17:36:40.429+00	2025-07-09 17:36:40.429+00
232	Pad See Ew	4	5	3	Mix Sauce in small bowl.\r\nMince garlic into wok with oil. Place over high heat, when hot, add chicken and Chinese broccoli stems, cook until chicken is light golden.\r\nPush to the side of the wok, crack egg in and scramble. Don't worry if it sticks to the bottom of the wok - it will char and which adds authentic flavour.\r\nAdd noodles, Chinese broccoli leaves and sauce. Gently mix together until the noodles are stained dark and leaves are wilted. Serve immediately!	A Thai stir-fry dish made with wide rice noodles, soy sauce, oyster sauce, Chinese broccoli, and meat (such as chicken or beef).	20	https://ftp.goit.study/img/so-yummy/preview/Pad%20See%20Ew.jpg	2025-07-09 17:36:40.439+00	2025-07-09 17:36:40.439+00
233	Stuffed Lamb Tomatoes	2	19	3	Heat oven to 180C/160C fan/gas 4. Slice the tops off the tomatoes and reserve. Scoop out most of the pulp with a teaspoon, being careful not to break the skin. Finely chop the pulp, and keep any juices. Sprinkle the insides of the tomatoes with a little sugar to take away the acidity, then place them on a baking tray.\r\n\r\nHeat 2 tbsp olive oil in a large frying pan, add the onion and garlic, then gently cook for about 10 mins until soft but not coloured. Add the lamb, cinnamon and tomato purée, turn up the heat, then fry until the meat is browned. Add the tomato pulp and juice, the rice and the stock. Season generously. Bring to the boil, then simmer for 15 mins or until the rice is tender and the liquid has been absorbed. Set aside to cool a little, then stir in the herbs.\r\n\r\nStuff the tomatoes up to the brim, top tomatoes with their lids, drizzle with 2 tbsp more olive oil, sprinkle 3 tbsp water into the tray, then bake for 35 mins. Serve with salad and crusty bread, hot or cold.	Fresh tomatoes stuffed with seasoned ground lamb and baked until tender, served hot and juicy with a side of your favorite vegetables.	35	https://ftp.goit.study/img/so-yummy/preview/Stuffed%20Lamb%20Tomatoes.jpg	2025-07-09 17:36:40.448+00	2025-07-09 17:36:40.448+00
234	Chicken & mushroom Hotpot	4	7	3	Heat oven to 200C/180C fan/gas 6. Put the butter in a medium-size saucepan and place over a medium heat. Add the onion and leave to cook for 5 mins, stirring occasionally. Add the mushrooms to the saucepan with the onions.\r\n\r\nOnce the onion and mushrooms are almost cooked, stir in the flour – this will make a thick paste called a roux. If you are using a stock cube, crumble the cube into the roux now and stir well. Put the roux over a low heat and stir continuously for 2 mins – this will cook the flour and stop the sauce from having a floury taste.\r\n\r\nTake the roux off the heat. Slowly add the fresh stock, if using, or pour in 500ml water if you’ve used a stock cube, stirring all the time. Once all the liquid has been added, season with pepper, a pinch of nutmeg and mustard powder. Put the saucepan back onto a medium heat and slowly bring it to the boil, stirring all the time. Once the sauce has thickened, place on a very low heat. Add the cooked chicken and vegetables to the sauce and stir well. Grease a medium-size ovenproof pie dish with a little butter and pour in the chicken and mushroom filling.\r\n\r\nCarefully lay the potatoes on top of the hot-pot filling, overlapping them slightly, almost like a pie top.\r\n\r\nBrush the potatoes with a little melted butter and cook in the oven for about 35 mins. The hot-pot is ready once the potatoes are cooked and golden brown.	A savory casserole made with chicken, mushrooms, and other vegetables. Great for a chilly evening.	50	https://ftp.goit.study/img/so-yummy/preview/Chicken%20_%20mushroom%20Hotpot.jpg	2025-07-09 17:36:40.464+00	2025-07-09 17:36:40.464+00
235	Pork Cassoulet	8	9	3	Heat oven to 140C/120C fan/gas 1. Put a large ovenproof pan (with a tight-fitting lid) on a high heat. Add your fat and diced meat, cook for a few mins to seal the edges, giving it a quick stir to cook evenly. Reduce the heat to low, add the sliced onion, whole garlic cloves, carrot and fennel seeds, and cook gently to soften the veg for a few mins.\r\nPour over the red wine vinegar, scraping any meaty bits off the bottom of the pan. Add the stock, tomato purée, and half the rosemary and parsley. Bring to the boil and simmer for 10 mins, then season, cover with a lid and put into the oven for 2 hrs, removing the lid for the final hour of cooking. Stir occasionally and add the beans with 30 mins to go.\r\nRemove the pan from the oven and heat the grill. Scatter the top with the remaining herbs and breadcrumbs, drizzle a little oil over the top, and return to the oven for 5-10 mins, until the breadcrumbs are golden. Serve with crusty bread and green veg.	A French-inspired stew made with pork, beans, and other ingredients. Delicious with crusty bread.	210	https://ftp.goit.study/img/so-yummy/preview/Pork%20Cassoulet.jpg	2025-07-09 17:36:40.471+00	2025-07-09 17:36:40.471+00
236	Prawn & Fennel Bisque	13	9	3	Shell the prawns, then fry the shells in the oil in a large pan for about 5 mins. Add the onion, fennel and carrots and cook for about 10 mins until the veg start to soften. Pour in the wine and brandy, bubble hard for about 1 min to drive off the alcohol, then add the tomatoes, stock and paprika. Cover and simmer for 30 mins. Meanwhile, chop the prawns.\r\nBlitz the soup as finely as you can with a stick blender or food processor, then press through a sieve into a bowl. Spend a bit of time really working the mixture through the sieve as this will give the soup its velvety texture.\r\nTip back into a clean pan, add the prawns and cook for 10 mins, then blitz again until smooth. You can make and chill this a day ahead or freeze it for 1 month. Thaw ovenight in the fridge. To serve, gently reheat in a pan with the cream. If garnishing, cook the 8 prawns in a little butter. Spoon into small bowls and top with the prawns and snipped fennel fronds.	A French seafood soup made with prawns and fennel, simmered in a creamy broth.	55	https://ftp.goit.study/img/so-yummy/preview/Prawn%20_%20Fennel%20Bisque.jpg	2025-07-09 17:36:40.487+00	2025-07-09 17:36:40.487+00
237	Portuguese custard tarts	6	20	3	STEP 1\r\nRoll the pastry\r\nMix the flour and icing sugar, and use this to dust the work surface. Roll the pastry out to make a 45 x 30cm rectangle. Roll up lengthways to create a long sausage shape.\r\n\r\nSTEP 2\r\nCutting pastry into rounds\r\nCut the pastry into 24 wheels, about 1-2cm thick.\r\n\r\nSTEP 3\r\nRoll out each pastry portion\r\nRoll each wheel lightly with the rolling pin to fit 2 x 12-hole non-stick fairy cake tins.\r\n\r\nSTEP 4\r\nPress pastry into the tin\r\nPress the pastry circles into the tins and mould into the tins to make thin cases. Chill until needed.\r\n\r\nSTEP 5\r\nMake the infused syrup\r\nHeat the oven to 220C/fan 200C/gas 7. Make a sugar syrup by bringing the sugar, 200ml water, lemon zest and cinnamon stick to the boil. Reduce until syrupy, allow to cool, then remove the cinnamon and lemon. Whisk the eggs, egg yolks and cornflour until smooth in another large pan.\r\n\r\nSTEP 6\r\nMaking custard\r\nHeat the milk and vanilla pod seeds in a separate pan until just below the boil. Gradually pour the hot milk over the eggs and cornflour, then cook on a low heat, continually whisking.\r\n\r\nSTEP 7\r\nAdd syrup to custard\r\nAdd the cooled sugar syrup to the custard and whisk until thickened slightly.\r\n\r\nSTEP 8\r\nPour custard into the tins\r\nPour the custard through a sieve. Pour into the pastry cases and bake for 15 minutes until the pastry is golden and the custard has darkened.\r\n\r\nSTEP 9\r\ncool and dust with icing sugar\r\nCool completely in the tins then sift over icing sugar and ground cinnamon to serve.\r\n\r\n\r\n\r\n 	Portuguese custard tarts, also known as Pastéis de nata, are a classic Portuguese dessert of crisp	50	https://ftp.goit.study/img/so-yummy/preview/Portuguese%20custard%20tarts.jpg	2025-07-09 17:36:40.497+00	2025-07-09 17:36:40.497+00
238	Brie wrapped in prosciutto & brioche	13	9	3	Mix the flour, 1 tsp salt, caster sugar, yeast, milk and eggs together in a mixer using the dough attachment for 5 mins until the dough is smooth. Add the butter and mix for a further 4 mins on medium speed. Scrape the dough bowl and mix again for 1 min. Place the dough in a container, cover with cling film and leave in the fridge for at least 6 hrs before using.\r\nWrap the Brie in the prosciutto and set aside. Turn out the dough onto a lightly floured surface. Roll into a 25cm circle. Place the wrapped Brie in the middle of the circle and fold the edges in neatly. Put the parcel onto a baking tray lined with baking parchment and brush with beaten egg. Chill in the fridge for 30 mins, then brush again with beaten egg and chill for a further 30 mins. Leave to rise for 1 hr at room temperature. Heat oven to 200C/180C fan/gas 6, then bake for 22 mins. Serve warm.	A decadent French appetizer made with brie cheese wrapped in prosciutto and baked in a buttery brioche dough.	35	https://ftp.goit.study/img/so-yummy/preview/Brie%20wrapped%20in%20prosciutto%20_%20brioche.jpg	2025-07-09 17:36:40.506+00	2025-07-09 17:36:40.506+00
239	Tonkatsu pork	8	8	3	STEP 1\r\nRemove the large piece of fat on the edge of each pork loin, then bash each of the loins between two pieces of baking parchment until around 1cm in thickness – you can do this using a meat tenderiser or a rolling pin. Once bashed, use your hands to reshape the meat to its original shape and thickness – this step will ensure the meat is as succulent as possible.\r\n\r\nSTEP 2\r\nPut the flour, eggs and panko breadcrumbs into three separate wide-rimmed bowls. Season the meat, then dip first in the flour, followed by the eggs, then the breadcrumbs.\r\n\r\nSTEP 3\r\nIn a large frying or sauté pan, add enough oil to come 2cm up the side of the pan. Heat the oil to 180C – if you don’t have a thermometer, drop a bit of panko into the oil and if it sinks a little then starts to fry, the oil is ready. Add two pork chops and cook for 1 min 30 secs on each side, then remove and leave to rest on a wire rack for 5 mins. Repeat with the remaining pork chops.\r\n\r\nSTEP 4\r\nWhile the pork is resting, make the sauce by whisking the ingredients together, adding a splash of water if it’s particularly thick. Slice the tonkatsu and serve drizzled with the sauce.	A Japanese dish, Tonkatsu pork is a breaded and deep-fried pork cutlet that is crispy on the outside and tender on the inside, and typically served with rice, cabbage, and tonkatsu sauce.	35	https://ftp.goit.study/img/so-yummy/preview/Tonkatsu%20pork.jpg	2025-07-09 17:36:40.513+00	2025-07-09 17:36:40.513+00
240	Ayam Percik	4	13	3	In a blender, add the ingredients for the spice paste and blend until smooth.\r\nOver medium heat, pour the spice paste in a skillet or pan and fry for 10 minutes until fragrant. Add water or oil 1 tablespoon at a time if the paste becomes too dry. Don't burn the paste. Lower the fire slightly if needed.\r\nAdd the cloves, cardamom, tamarind pulp, coconut milk, water, sugar and salt. Turn the heat up and bring the mixture to boil. Turn the heat to medium low and simmer for 10 minutes. Stir occasionally. It will reduce slightly. This is the marinade/sauce, so taste and adjust seasoning if necessary. Don't worry if it's slightly bitter. It will go away when roasting.\r\nWhen the marinade/sauce has cooled, pour everything over the chicken and marinate overnight to two days.\r\nPreheat the oven to 425 F.\r\nRemove the chicken from the marinade. Spoon the marinade onto a greased (or aluminum lined) baking sheet. Lay the chicken on top of the sauce (make sure the chicken covers the sauce and the sauce isn't exposed or it'll burn) and spread the remaining marinade on the chicken. Roast for 35-45 minutes or until internal temp of the thickest part of chicken is at least 175 F.\r\nLet chicken rest for 5 minutes. Brush the chicken with some of the oil. Serve chicken with the sauce over steamed rice (or coconut rice).	A traditional Malaysian grilled chicken dish, marinated with a flavorful blend of spices and coconut milk, then grilled over an open flame. Served with a side of tangy and spicy peanut sauce for dipping.	60	https://ftp.goit.study/img/so-yummy/preview/Ayam%20Percik.jpg	2025-07-09 17:36:40.524+00	2025-07-09 17:36:40.524+00
241	Three-cheese souffles	10	9	3	Heat oven to 200C/180C fan/ gas 6 and butter 4 small (about 200ml) ramekins. Sprinkle the Parmesan into the ramekins, turning until all sides are covered. Place the milk and bay leaves in a large saucepan over a gentle heat and bring to the boil. Turn off the heat and leave to infuse for 15 mins.\r\nDiscard the bay leaves, add the butter and flour, and return to a low heat. Very gently simmer, stirring continuously with a balloon whisk, for about 6 mins until you get a smooth, thick white sauce. Make sure that you get right into the corners of the pan to stop the sauce from catching or becoming lumpy.\r\nOnce thickened, transfer the sauce to a large bowl and stir in the mustard powder, cayenne pepper, Gruyère and egg yolks until fully combined.\r\nIn a spotlessly clean bowl and with a clean whisk, beat the egg whites just until peaks begin to form.\r\nCarefully fold the egg whites into the cheese sauce in three stages making sure you fold, rather than stir, to keep the egg whites light and airy. Fill the prepared ramekins with the soufflé mix.\r\nTop each soufflé with a slice of goat’s cheese, then place on a baking tray. Bake for 20-25 mins or until springy and well risen but cooked through.\r\nLeave to cool, then run a knife around the edge of each dish and remove the soufflés. If preparing in advance, place soufflés upside down (for neat presentation), on a tray. Cover tray in cling film. Chill for a few days or freeze for up to 1 month.\r\nWhen ready to re-bake, heat oven to 200C/180C fan/gas 6. Place the upside-down soufflés in a shallow baking dish, top with the remaining goat’s cheese slices and pour over the cream (this stops them from drying out when baked for the second time). Cook for 8-10 mins until golden. Serve immediately alongside some simply dressed salad.	A classic French dish made with a light and fluffy soufflé filled with three types of cheese.	70	https://ftp.goit.study/img/so-yummy/preview/Three-cheese%20souffles.jpg	2025-07-09 17:36:40.535+00	2025-07-09 17:36:40.535+00
242	Seri muka kuih	6	13	3	Soak glutinous rice with water for at least 1 ½ hours prior to using. Drain.\r\nPrepare a 9-inch round or square cake pan and spray with cooking spray or line with plastic wrap.\r\nMix coconut milk, water, salt and the rice. Pour it into cake pan, topped with the pandan knots.\r\nSteam for 30 minutes.\r\nAfter 30 minutes, fluff up the rice and remove pandan knots. Then, using a greased spatula, flatten the steamed rice. Make sure there are no holes/air bubbles and gaps in the rice, especially the sides.\r\nSteam for another 10 minutes.\r\n\r\nCombine pandan juice, coconut milk, all purpose flour, cornflour, and sugar. Mix well.\r\nAdd eggs and whisk well then strain into a medium sized metal bowl or pot.\r\nPlace pandan mixture over simmering water (double boiler or bain-marie)\r\nStir continuously and cook till custard starts to thicken. (15 minutes)\r\nPour pandan custard into glutinous rice layer, give it a little tap (for air bubbles) and continue to steam for 30 minutes.\r\nRemove kuih seri muka from the steamer and allow to cool completely before cutting into rectangles or diamond shapes.	A traditional Malaysian kuih or dessert, made with glutinous rice, coconut milk, and pandan leaves. The bottom layer is a sweet green custard, while the top layer is made with sticky rice and often sprinkled with toasted coconut.	135	https://ftp.goit.study/img/so-yummy/preview/Seri%20muka%20kuih.jpg	2025-07-09 17:36:40.545+00	2025-07-09 17:36:40.545+00
243	Summer Pudding	6	7	3	Bring out the juices: Wash fruit and gently dry on kitchen paper – keep strawberries separate. Put sugar and 3 tbsp water into a large pan. Gently heat until sugar dissolves – stir a few times. Bring to a boil for 1 min, then tip in the fruit (not strawberries). Cook for 3 mins over a low heat, stirring 2-3 times. The fruit will be softened, mostly intact and surrounded by dark red juice. Put a sieve over a bowl and tip in the fruit and juice.\r\nLine the bowl with cling film and prepare the bread: Line the 1.25-litre basin with cling film as this will help you to turn out the pudding. Overlap two pieces of cling film in the middle of the bowl as it’s easier than trying to get one sheet to stick to all of the curves. Let the edges overhang by about 15cm. Cut the crusts off the bread. Cut 4 pieces of bread in half, a little on an angle, to give 2 lopsided rectangles per piece. Cut 2 slices into 4 triangles each and leave the final piece whole.\r\nBuild the pud: Dip the whole piece of bread into the juice for a few secs just to coat. Push this into the bottom of the basin. Now dip the wonky rectangular pieces one at a time and press around the basin’s sides so that they fit together neatly, alternately placing wide and narrow ends up. If you can’t quite fit the last piece of bread in it doesn’t matter, just trim into a triangle, dip in juice and slot in. Now spoon in the softened fruit, adding the strawberries here and there as you go.\r\nLet flavours mingle then serve: Dip the bread triangles in juice and place on top – trim off overhang with scissors. Keep leftover juice for later. Bring cling film up and loosely seal. Put a side plate on top and weight down with cans. Chill for 6 hrs or overnight. To serve, open out cling film then put a serving plate upside-down on top and flip over. serve with leftover juice, any extra berries and cream.	A refreshing dessert made with fresh berries and bread soaked in juice, perfect for summer.	380	https://ftp.goit.study/img/so-yummy/preview/Summer%20Pudding.jpg	2025-07-09 17:36:40.555+00	2025-07-09 17:36:40.555+00
244	Kung Po Prawns	1	22	3	Mix the cornflour and 1 tbsp soy sauce, toss in the prawns and set aside for 10 mins. Stir the vinegar, remaining soy sauce, tomato purée, sugar and 2 tbsp water together to make a sauce.\r\n\r\nWhen you’re ready to cook, heat a large frying pan or wok until very hot, then add 1 tbsp oil. Fry the prawns until they are golden in places and have opened out– then tip them out of the pan.\r\n\r\nHeat the remaining oil and add the peanuts, chillies and water chestnuts. Stir-fry for 2 mins or until the peanuts start to colour, then add the ginger and garlic and fry for 1 more min. Tip in the prawns and sauce and simmer for 2 mins until thickened slightly. Serve with rice.	A delicious Chinese dish made with stir-fried prawns, peanuts, and vegetables in a spicy sauce. Served with rice or noodles.	20	https://ftp.goit.study/img/so-yummy/preview/Kung%20Po%20Prawns.jpg	2025-07-09 17:36:40.561+00	2025-07-09 17:36:40.561+00
245	Bitterballen (Dutch meatballs)	5	14	3	Melt the butter in a skillet or pan. When melted, add the flour little by little and stir into a thick paste. Slowly stir in the stock, making sure the roux absorbs the liquid. Simmer for a couple of minutes on a low heat while you stir in the onion, parsley and the shredded meat. The mixture should thicken and turn into a heavy, thick sauce.\r\n\r\nPour the mixture into a shallow container, cover and refrigerate for several hours, or until the sauce has solidified.\r\n\r\nTake a heaping tablespoon of the cold, thick sauce and quickly roll it into a small ball. Roll lightly through the flour, then the egg and finally the breadcrumbs. Make sure that the egg covers the whole surface of the bitterbal. When done, refrigerate the snacks while the oil in your fryer heats up to 190C (375F). Fry four bitterballen at a time, until golden.\r\n\r\nServe on a plate with a nice grainy or spicy mustard. \r\n	A Dutch snack made with a mixture of beef, butter, flour, and herbs, coated in breadcrumbs and deep-fried until crispy.	40	https://ftp.goit.study/img/so-yummy/preview/Bitterballen%20_Dutch%20meatballs_.jpg	2025-07-09 17:36:40.57+00	2025-07-09 17:36:40.57+00
246	Walnut Roll Gužvara	6	21	3	Mix all the ingredients for the dough together and knead well. Cover the dough and put to rise until doubled in size which should take about 2 hours. Knock back the dough and knead lightly.\r\n\r\nDivide the dough into two equal pieces; roll each piece into an oblong about 12 inches by 8 inches. Mix the filling ingredients together and divide between the dough, spreading over each piece. Roll up the oblongs as tightly as possible to give two 12 inch sausages. Place these side by side, touching each other, on a greased baking sheet. Cover and leave to rise for about 40 minutes. Heat oven to 200ºC (425ºF). Bake for 30-35 minutes until well risen and golden brown. Bread should sound hollow when the base is tapped.\r\n\r\nRemove from oven and brush the hot bread top with milk. Sift with a generous covering of icing sugar.	Walnut Roll Gužvara is a sweet and nutty dessert made with a tender yeast dough, ground walnuts, sugar, and spices. It's a traditional pastry in Croatia and the Balkans, often served on holidays and special occasions.	175	https://ftp.goit.study/img/so-yummy/preview/Walnut%20Roll%20Gužvara.jpg	2025-07-09 17:36:40.581+00	2025-07-09 17:36:40.581+00
247	Steak and Kidney Pie	5	7	3	Preheat the oven to 220C/425F/Gas 7\r\nHeat the vegetable oil in a large frying pan, and brown the beef all over. (You may need to do this in batches.) Set aside, then brown the kidneys on both sides in the same pan. Add the onions and cook for 3-4 minutes.\r\nReturn the beef to the pan, sprinkle flour over and coat the meat and onions\r\nAdd the stock to the pan, stir well and bring to the boil.\r\nTurn the heat down and simmer for 1½ hours without a lid. If the liquid evaporates too much, add more stock.\r\nRemove from the heat. Add salt, pepper and Worcestershire sauce and allow to cool completely. Place the cooked meat mixture into a pie dish.\r\nRoll out the pastry to 5mm/¼in thick and 5cm/2in larger than the dish you are using.\r\nUsing a rolling pin, lift the pastry and place it over the top of the pie dish. Trim and crimp the edges with your fingers and thumb.\r\nBrush the surface with the beaten egg mixture and bake for 30-40 minutes until golden-brown and puffed.\r\nServe with creamy mash and steamed vegetables to soak up the gravy.	A classic British pie with tender chunks of steak and kidney in a rich gravy.	140	https://ftp.goit.study/img/so-yummy/preview/Steak%20and%20Kidney%20Pie.jpg	2025-07-09 17:36:40.595+00	2025-07-09 17:36:40.595+00
248	Potato Gratin with Chicken	4	4	3	15 minute potato gratin with chicken and bacon greens: a gratin always seems more effort and more indulgent than ordinary boiled or roasts, but it doesn't have to take 45mins, it's nice for a change and you can control the calorie content by going with full fat to low fat creme fraiche. (It's always tastes better full fat though obviously!) to serve 4: use 800g of potatoes, finely slice and boil in a pan for about 5-8 mins till firmish, not soft. Finely slice 3 onions and place in an oven dish with 2 tblsp of olive oil and 100ml of chicken stock. Cook till the onions are soft then drain the potatoes and pour onto the onions. Season and spoon over cream or creme fraiche till all is covered but not swimming. Grate Parmesan over the top then finish under the grill till nicely golden. serve with chicken and bacon, peas and spinach.	A French-inspired dish made with sliced potatoes, chicken, cream, garlic, and cheese, baked until golden and bubbly.	20	https://ftp.goit.study/img/so-yummy/preview/Potato%20Gratin%20with%20Chicken.jpg	2025-07-09 17:36:40.605+00	2025-07-09 17:36:40.605+00
249	Vegan Lasagna	7	2	3	1) Preheat oven to 180 degrees celcius. \r\n2) Boil vegetables for 5-7 minutes, until soft. Add lentils and bring to a gentle simmer, adding a stock cube if desired. Continue cooking and stirring until the lentils are soft, which should take about 20 minutes. \r\n3) Blanch spinach leaves for a few minutes in a pan, before removing and setting aside. \r\n4) Top up the pan with water and cook the lasagne sheets. When cooked, drain and set aside.\r\n5) To make the sauce, melt the butter and add the flour, then gradually add the soya milk along with the mustard and the vinegar. Cook and stir until smooth and then assemble the lasagne as desired in a baking dish. \r\n6) Bake in the preheated oven for about 25 minutes.	A plant-based version of the classic Italian dish, made with layers of pasta, tomato sauce, vegan cheese, and vegetables (such as spinach, zucchini, and mushrooms).	50	https://ftp.goit.study/img/so-yummy/preview/Vegan%20Lasagna.jpg	2025-07-09 17:36:40.616+00	2025-07-09 17:36:40.616+00
250	Salted Caramel Cheescake	6	11	3	1) Blitz the biscuits and the pretzels in a food processor and mix the biscuits with the melted butter. Spread on the bottom of an 8″/20cm Deep Springform Tin and press down firmly. Leave to set in the fridge whilst you make the rest!\r\n\r\n2) Using an electric mixer, I use my KitchenAid with the whisk attachment, whisk together the cream cheese, vanilla, and icing sugar until smooth and then add the caramel and whisk again until smooth and lump free – this could take a couple of minutes, I whisk it at half speed so not too quick or slow!\r\n\r\n3) Pour in the double cream & Salt flakes and continue to whisk for a couple of minutes until its very thick and mousse like (I mix it on a medium speed, level 6/10) – Now this could take up to 5 minutes depending on your mixer, but you seriously have to stick at it – it will hold itself completely when finished mixing (like a meringue does!) If you don’t mix it enough it will not set well enough, but don’t get impatient and whisk it really quick because that’ll make it split! Spread over the biscuit base and leave to set in the fridge overnight.\r\n\r\n4) Remove the Cheesecake from the tin carefully and decorate the cheesecake – I drizzled over some of the spare caramel, and then some Toffee Popcorn and more Pretzels!	Cheesecake with salted caramel sauce	1440	https://ftp.goit.study/img/so-yummy/preview/Salted%20Caramel%20Cheescake.jpg	2025-07-09 17:36:40.625+00	2025-07-09 17:36:40.625+00
251	Venetian Duck Ragu	11	2	3	Heat the oil in a large pan. Add the duck legs and brown on all sides for about 10 mins. Remove to a plate and set aside. Add the onions to the pan and cook for 5 mins until softened. Add the garlic and cook for a further 1 min, then stir in the cinnamon and flour and cook for a further min. Return the duck to the pan, add the wine, tomatoes, stock, herbs, sugar and seasoning. Bring to a simmer, then lower the heat, cover with a lid and cook for 2 hrs, stirring every now and then.\r\nCarefully lift the duck legs out of the sauce and place on a plate – they will be very tender so try not to lose any of the meat. Pull off and discard the fat, then shred the meat with 2 forks and discard the bones. Add the meat back to the sauce with the milk and simmer, uncovered, for a further 10-15 mins while you cook the pasta.\r\nCook the pasta following pack instructions, then drain, reserving a cup of the pasta water, and add the pasta to the ragu. Stir to coat all the pasta in the sauce and cook for 1 min more, adding a splash of cooking liquid if it looks dry. Serve with grated Parmesan, if you like.	Slow-cooked duck ragu from Venice	150	https://ftp.goit.study/img/so-yummy/preview/Venetian%20Duck%20Ragu.jpg	2025-07-09 17:36:40.634+00	2025-07-09 17:36:40.634+00
252	Chicken Fajita Mac and Cheese	4	11	3	Fry your onion, peppers and garlic in olive oil until nicely translucent. Make a well in your veg and add your chicken. Add your seasoning and salt. Allow to colour slightly.\r\nAdd your cream, stock and macaroni.\r\nCook on low for 20 minutes. Add your cheeses, stir to combine.\r\nTop with roasted peppers and parsley.	A fusion dish that combines the flavors of chicken fajitas with creamy mac and cheese.	40	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Fajita%20Mac%20and%20Cheese.jpg	2025-07-09 17:36:40.651+00	2025-07-09 17:36:40.651+00
253	Chocolate Avocado Mousse	6	7	3	1. Blend all the mousse ingredients together in your food processor until smooth. Add the cacao powder first and, as you blend, have all the ingredients to hand in order to adjust the ratios slightly as the size of avocados and bananas varies so much. The perfect ratio in order to avoid the dish tasting too much of either is to use equal amounts of both.\r\n\r\n2. Taste and add a few drops of stevia if you feel you need more sweetness.\r\n\r\n3. Fill little cups or shot glasses with the mousse, sprinkle with the cacao powder or nibs and serve.\r\n\r\nTip If you don’t have a frozen banana to hand you can just use a normal one and then chill the mousse before serving for a cooling dessert.	A decadent dessert made with avocado, chocolate, and other ingredients. Healthy and delicious!	15	https://ftp.goit.study/img/so-yummy/preview/Chocolate%20Avocado%20Mousse.jpg	2025-07-09 17:36:40.661+00	2025-07-09 17:36:40.661+00
254	Dundee cake	6	7	3	Put the almonds into a small bowl and pour over boiling water to just cover. Leave for 5 mins then drain in a sieve and leave to dry.\r\nPreheat the oven to 180C/160 C fan/Gas Mark 4. Line a deep loose-based 20cm cake tin with baking parchment.\r\nPut the butter in a large bowl and beat well until soft. Add the sugar and beat until light and fluffy. Stir in the orange zest and apricot jam.\r\nSieve together the flour and baking powder. Add the eggs to the creamed butter and sugar, a little at a time, beating well between each addition. If the mixture starts to curdle, stir in a little flour.\r\nAdd the remaining flour and ground almonds and mix well. Mix in the milk and then add the dried fruit and cherries and mix gently together.\r\nSpoon the mixture into the prepared tin and spread level using the back of a spoon. Arrange the whole almonds close together in neat circles on the top of the cake. Bake in the oven for 45 mins.\r\nLower the oven temperature to 160C/140 C fan/Gas Mark 3 and cook for a further 60–80 minutes. Check the cake after 50 minutes by inserting a wooden or metal skewer into the cake. When it’s done it should have just a few crumbs attached. Check every 10 minutes - it’s important not to overcook this cake so the centre will be a little soft.\r\nWhen cooked, remove the cake briefly from the oven, put the milk and sugar into a small pan and heat gently until the sugar has dissolved. Brush over the top of the cake and return the cake to the oven for 2-3 mins. Remove and allow the cake to cool in the tin. When quite cold remove from the tin and wrap in foil and keep for at least 2 days before cutting.	A Scottish fruit cake made with almonds and topped with blanched almonds. It is a dense and rich cake with a slightly nutty flavor.	125	https://ftp.goit.study/img/so-yummy/preview/Dundee%20cake.jpg	2025-07-09 17:36:40.668+00	2025-07-09 17:36:40.668+00
255	Chicken Ham and Leek Pie	4	7	3	Heat the chicken stock in a lidded saucepan. Add the chicken breast and bring to a low simmer. Cover with a lid and cook for 10 minutes. Remove the chicken breasts from the water with tongs and place on a plate. Pour the cooking liquor into a large jug.\r\nMelt 25g/1oz of the butter in a large heavy-based saucepan over a low heat. Stir in the leeks and fry gently for two minutes, stirring occasionally until just softened. Add the garlic and cook for a further minute. Add the remaining butter and stir in the flour as soon as the butter has melted. Cook for 30 seconds, stirring constantly.\r\nSlowly pour the milk into the pan, just a little at a time, stirring well between each adding. Gradually add 250ml/10fl oz of the reserved stock and the wine, if using, stirring until the sauce is smooth and thickened slightly. Bring to a gentle simmer and cook for 3 minutes.\r\nSeason the mixture, to taste, with salt and freshly ground black pepper. Remove from the heat and stir in the cream. Pour into a large bowl and cover the surface of the sauce with cling ilm to prevent a skin forming. Set aside to cool.\r\nPreheat the oven to 200C/400F/Gas 6. Put a baking tray in the oven to heat.\r\nFor the pastry, put the flour and butter in a food processor and blend on the pulse setting until the mixture resembles fine breadcrumbs. With the motor running, add the beaten egg and water and blend until the mixture forms a ball. Portion off 250g/10oz of pastry for the lid.\r\nRoll the remaining pastry out on a lightly floured surface, turning the pastry frequently until around 5mm/¼in thick and 4cm/1½in larger than the pie dish. Lift the pastry over the rolling pin and place it gently into the pie dish. Press the pastry firmly up the sides, making sure there are no air bubbles. Leave the excess pastry overhanging the sides.\r\nCut the chicken breasts into 3cm/1¼in pieces. Stir the chicken, ham and leeks into the cooled sauce. Pour the chicken filling into the pie dish. Brush the rim of the dish with beaten egg. Roll out the reserved pastry for the lid.\r\nCover the pie with the pastry lid and press the edges together firmly to seal. Trim any excess pastry.\r\nMake a small hole in the centre of the pie with the tip of a knife. Glaze the top of the pie with beaten egg. Bake on the preheated tray in the centre of the oven for 35-40 minutes or until the pie is golden-brown all over and the filling is piping hot.	A creamy chicken pie with ham and leeks, a classic British comfort food.	90	https://ftp.goit.study/img/so-yummy/preview/Chicken%20Ham%20and%20Leek%20Pie.jpg	2025-07-09 17:36:40.683+00	2025-07-09 17:36:40.683+00
256	Lasagne	11	2	3	Heat the oil in a large saucepan. Use kitchen scissors to snip the bacon into small pieces, or use a sharp knife to chop it on a chopping board. Add the bacon to the pan and cook for just a few mins until starting to turn golden. Add the onion, celery and carrot, and cook over a medium heat for 5 mins, stirring occasionally, until softened.\r\nAdd the garlic and cook for 1 min, then tip in the mince and cook, stirring and breaking it up with a wooden spoon, for about 6 mins until browned all over.\r\nStir in the tomato purée and cook for 1 min, mixing in well with the beef and vegetables. Tip in the chopped tomatoes. Fill each can half full with water to rinse out any tomatoes left in the can, and add to the pan. Add the honey and season to taste. Simmer for 20 mins.\r\nHeat oven to 200C/180C fan/gas 6. To assemble the lasagne, ladle a little of the ragu sauce into the bottom of the roasting tin or casserole dish, spreading the sauce all over the base. Place 2 sheets of lasagne on top of the sauce overlapping to make it fit, then repeat with more sauce and another layer of pasta. Repeat with a further 2 layers of sauce and pasta, finishing with a layer of pasta.\r\nPut the crème fraîche in a bowl and mix with 2 tbsp water to loosen it and make a smooth pourable sauce. Pour this over the top of the pasta, then top with the mozzarella. Sprinkle Parmesan over the top and bake for 25–30 mins until golden and bubbling. Serve scattered with basil, if you like.	Layers of pasta, meat sauce, and cheese baked to perfection. A crowd-pleaser for sure.	75	https://ftp.goit.study/img/so-yummy/preview/Lasagne.jpg	2025-07-09 17:36:40.698+00	2025-07-09 17:36:40.698+00
257	General Tso's Chicken	4	22	3	DIRECTIONS:\r\nSTEP 1 - SAUCE\r\nIn a bowl, add 2 Cups of water, 2 Tablespoon soy sauce, 2 Tablespoon white vinegar, sherry cooking wine, 1/4 Teaspoon white pepper, minced ginger, minced garlic, hot pepper, ketchup, hoisin sauce, and sugar.\r\nMix together well and set aside.\r\nSTEP 2 - MARINATING THE CHICKEN\r\nIn a bowl, add the chicken, 1 pinch of salt, 1 pinch of white pepper, 2 egg whites, and 3 Tablespoon of corn starch\r\nSTEP 3 - DEEP FRY THE CHICKEN\r\nDeep fry the chicken at 350 degrees for 3-4 minutes or until it is golden brown and loosen up the chicken so that they don't stick together.\r\nSet the chicken aside.\r\nSTEP 4 - STIR FRY\r\nAdd the sauce to the wok and then the broccoli and wait until it is boiling.\r\nTo thicken the sauce, whisk together 2 Tablespoon of cornstarch and 4 Tablespoon of water in a bowl and slowly add to your stir-fry until it's the right thickness.\r\nNext add in the chicken and stir-fry for a minute and serve on a plate	A popular Chinese-American dish made with crispy fried chicken in a sweet and spicy sauce. Served with rice.	29	https://ftp.goit.study/img/so-yummy/preview/General%20Tso_s%20Chicken.jpg	2025-07-09 17:36:40.719+00	2025-07-09 17:36:40.719+00
270	Spotted Cake	6	7	3	Put the flour and salt in a bowl. Add the suet, currants, sugar, lemon and orange zest.\r\nPour in 150ml milk and mix to a firm but moist dough, adding the extra milk if necessary.\r\nShape into a fat roll about 20cm long. Place on a large rectangle of baking parchment. Wrap loosely to allow for the pudding to rise and tie the ends with string like a Christmas cracker.\r\nPlace a steamer over a large pan of boiling water, add the pudding to the steamer, cover and steam for 1 1/2 hours. Top up the pan with water from time to time.\r\nRemove from the steamer and allow to cool slightly before unwrapping. Serve sliced with custard.	A classic British pudding made with suet and dried fruit, often served with custard.	90	https://ftp.goit.study/img/so-yummy/preview/Spotted%20Dick.jpg	2025-07-09 17:36:40.872+00	2025-07-09 17:36:40.872+00
258	Ratatouille	9	9	3	Cut the aubergines in half lengthways. Place them on the board, cut side down, slice in half lengthways again and then across into 1.5cm chunks. Cut off the courgettes ends, then across into 1.5cm slices. Peel the peppers from stalk to bottom. Hold upright, cut around the stalk, then cut into 3 pieces. Cut away any membrane, then chop into bite-size chunks.\r\nScore a small cross on the base of each tomato, then put them into a heatproof bowl. Pour boiling water over the tomatoes, leave for 20 secs, then remove. Pour the water away, replace the tomatoes and cover with cold water. Leave to cool, then peel the skin away. Quarter the tomatoes, scrape away the seeds with a spoon, then roughly chop the flesh.\r\nSet a sauté pan over medium heat and when hot, pour in 2 tbsp olive oil. Brown the aubergines for 5 mins on each side until the pieces are soft. Set them aside and fry the courgettes in another tbsp oil for 5 mins, until golden on both sides. Repeat with the peppers. Don’t overcook the vegetables at this stage, as they have some more cooking left in the next step.\r\nTear up the basil leaves and set aside. Cook the onion in the pan for 5 mins. Add the garlic and fry for a further min. Stir in the vinegar and sugar, then tip in the tomatoes and half the basil. Return the vegetables to the pan with some salt and pepper and cook for 5 mins. Serve with basil.	A classic French stewed vegetable dish with tomatoes, eggplants, bell peppers, and zucchini.	40	https://ftp.goit.study/img/so-yummy/preview/Ratatouille.jpg	2025-07-09 17:36:40.742+00	2025-07-09 17:36:40.742+00
259	Stamppot	8	14	3	\r\nWash and peel the potatoes and cut into similarly sized pieces for even cooking.\r\n\r\nIn a large soup pot, boil the potatoes and the bay leaves in salted water for 20 minutes. Discard the bay leaves.\r\n\r\nIf you're not using a bag of ready-cut curly kale, wash the bunches thoroughly under cool running water to get rid of all soil—you wouldn't want that gritty texture in your finished dish. Trim any coarse stems and discard any brown leaves. With a sharp knife, cut the curly kale into thin strips.\r\n\r\nPeel and chop the shallots.\r\n\r\nIn a frying pan or skillet, melt 1 tbsp. of butter and saute the shallots for a few minutes before adding the curly kale and 2 tbsp. of water. Season and cook for about 10 minutes, or until tender.\r\n\r\nWarm the milk on the stove or in the microwave.\r\n\r\nDrain, shake and dry the potatoes with kitchen towels before mashing with a potato masher or ricer. Working quickly, add the warm milk and the remaining butter. Season to taste with nutmeg, salt, and pepper. \r\n\r\nMix the cooked curly kale through the cooked mashed potato mixture.\r\n\r\nTop with slices of the smoked sausage and serve hot with your favorite mustard or gravy.\r\n\r\nServe and enjoy!	A traditional Dutch dish made with mashed potatoes and vegetables, often served with smoked sausage or bacon.	40	https://ftp.goit.study/img/so-yummy/preview/Stamppot.jpg	2025-07-09 17:36:40.752+00	2025-07-09 17:36:40.752+00
260	Fettuccine Alfredo	11	2	3	Cook pasta according to package instructions in a large pot of boiling water and salt. Add heavy cream and butter to a large skillet over medium heat until the cream bubbles and the butter melts. Whisk in parmesan and add seasoning (salt and black pepper). Let the sauce thicken slightly and then add the pasta and toss until coated in sauce. Garnish with parsley, and it's ready.	Fettuccine Alfredo is a classic Italian pasta dish made with fettuccine pasta, butter, cream, and Parmesan cheese. It's a simple yet decadent dish that's perfect for a special occasion or a cozy dinner at home.	20	https://ftp.goit.study/img/so-yummy/preview/Fettuccine%20Alfredo.jpg	2025-07-09 17:36:40.76+00	2025-07-09 17:36:40.76+00
261	Pate Chinois	5	16	3	In a large pot of salted water, cook the potatoes until they are very tender. Drain.\r\nWith a masher, coarsely crush the potatoes with at least 30 ml (2 tablespoons) of butter. With an electric mixer, purée with the milk. Season with salt and pepper. Set aside.\r\nWith the rack in the middle position, preheat the oven to 190 °C (375 °F).\r\nIn a large skillet, brown the onion in the remaining butter. Add the meat and cook until golden brown. Season with salt and pepper. Remove from the heat.\r\nLightly press the meat at the bottom of a 20-cm (8-inch) square baking dish. Cover with the corn and the mashed potatoes. Sprinkle with paprika and parsley.\r\nBake for about 30 minutes. Finish cooking under the broiler. Let cool for 10 minutes.	A French-Canadian dish made with layers of ground beef, corn, and mashed potatoes, baked in a casserole dish until golden brown.	45	https://ftp.goit.study/img/so-yummy/preview/Pate%20Chinois.jpg	2025-07-09 17:36:40.766+00	2025-07-09 17:36:40.766+00
262	Rappie Pie	4	16	3	Preheat oven to 400 degrees F (200 degrees C). Grease a 10x14x2-inch baking pan.\r\nHeat margarine in a skillet over medium heat; stir in onion. Cook and stir until onion has softened and turned translucent, about 5 minutes. Reduce heat to low and continue to cook and stir until onion is very tender and dark brown, about 40 minutes more.\r\nBring chicken broth to a boil in a large pot; stir in chicken breasts, reduce heat, and simmer until chicken is no longer pink at the center, about 20 minutes. Remove from heat. Remove chicken breasts to a plate using a slotted spoon; reserve broth.\r\nJuice potatoes with an electric juicer; place dry potato flesh into a bowl and discard juice. Stir salt and pepper into potatoes; stir in enough reserved broth to make the mixture the consistency of oatmeal. Set remaining broth aside.\r\nSpread half of potato mixture evenly into the prepared pan. Lay cooked chicken breast evenly over potatoes; scatter caramelized onion evenly over chicken. Spread remaining potato mixture over onions and chicken to cover.\r\nBake in the preheated oven until golden brown, about 1 hour. Reheat chicken broth; pour over individual servings as desired.	A traditional Acadian dish made with grated potatoes and meat, such as chicken or pork, and baked until golden brown. Popular in Eastern Canada.	85	https://ftp.goit.study/img/so-yummy/preview/Rappie%20Pie.jpg	2025-07-09 17:36:40.778+00	2025-07-09 17:36:40.778+00
263	Bigos (Hunters Stew)	8	25	3	Preheat the oven to 350 degrees F (175 degrees C).\r\n\r\nHeat a large pot over medium heat. Add the bacon and kielbasa; cook and stir until the bacon has rendered its fat and sausage is lightly browned. Use a slotted spoon to remove the meat and transfer to a large casserole or Dutch oven.\r\n\r\nCoat the cubes of pork lightly with flour and fry them in the bacon drippings over medium-high heat until golden brown. Use a slotted spoon to transfer the pork to the casserole. Add the garlic, onion, carrots, fresh mushrooms, cabbage and sauerkraut. Reduce heat to medium; cook and stir until the carrots are soft, about 10 minutes. Do not let the vegetables brown.\r\n\r\nDeglaze the pan by pouring in the red wine and stirring to loosen all of the bits of food and flour that are stuck to the bottom. Season with the bay leaf, basil, marjoram, paprika, salt, pepper, caraway seeds and cayenne pepper; cook for 1 minute.\r\n\r\nMix in the dried mushrooms, hot pepper sauce, Worcestershire sauce, beef stock, tomato paste and tomatoes. Heat through just until boiling. Pour the vegetables and all of the liquid into the casserole dish with the meat. Cover with a lid.\r\n\r\nBake in the preheated oven for 2 1/2 to 3 hours, until meat is very tender.		200	https://ftp.goit.study/img/so-yummy/preview/Bigos%20_Hunters%20Stew_.jpg	2025-07-09 17:36:40.783+00	2025-07-09 17:36:40.783+00
264	Mee goreng mamak	1	13	3	Heat oil in a pan at medium heat. Then, add peanuts, dried chilies, dried shrimps and dhal. Fry the aromatics until fragrant. Remove from pan and leave aside.\r\n\r\nBlend fried ingredients with tamarind paste and water until fine. Then, sauté the blended ingredients in oil heated over low heat. Continue cooking until the oil separates from the paste and turns a darker shade.\r\n\r\nSkin and cut potatoes into small chunks and boil them in a pot of water until knife-tender. Once ready, remove them from the pot and leave aside. Discard water.\r\n\r\nSlice onion and fried tofu, mince garlic, cut some cabbage and Chinese flowering cabbage (choi sam). Prepare prawn fritters and cut them. Boil noodles to soften them if bought dried. Also mix black soy sauce with water.\r\n\r\nTo fry one portion of mee goreng mamak, heat oil and add 1/4 of the following ingredients in this order: garlic, onion, paste. Sauté until fragrant. Optionally, add prawns.\r\n\r\nAdd in 1/4 amount of tofu, boiled potatoes, cabbage, Chinese flowering cabbage and prawn fritters. Sauté for another 30 seconds.\r\n\r\nAdd noodles to the wok. Add 3 tablespoons of dark soy sauce mixture. Mix evenly for the next 1 minute. Then, move the noodles to the side of the wok. Stir in an egg. Garnish with a slice of lime and slices of green chilies. To cook another plate of noodles, repeat from step 5 onwards.	A spicy and savory Malaysian dish of stir-fried noodles, vegetables, and meat or seafood. Flavored with a blend of spices, soy sauce, and chili paste, it is often served with a side of lime wedges and crispy fried shallots.	56	https://ftp.goit.study/img/so-yummy/preview/Mee%20goreng%20mamak.jpg	2025-07-09 17:36:40.797+00	2025-07-09 17:36:40.797+00
265	Chick-Fil-A Sandwich	4	11	3	Wrap the chicken loosely between plastic wrap and pound gently with the flat side of a meat tenderizer until about 1/2 inch thick all around.\r\nCut into two pieces, as even as possible.\r\nMarinate in the pickle juice for 30 minutes to one hour (add a teaspoon of Tabasco sauce now for a spicy sandwich).\r\nBeat the egg with the milk in a bowl.\r\nCombine the flour, sugar, and spices in another bowl.\r\nDip the chicken pieces each into the egg on both sides, then coat in flour on both sides.\r\nHeat the oil in a skillet (1/2 inch deep) to about 345-350.\r\nFry each cutlet for 2 minutes on each side, or until golden and cooked through.\r\nBlot on paper and serve on toasted buns with pickle slices.	A classic chicken sandwich made with tender, crispy chicken fillets, served on a soft, buttery bun with pickles, lettuce, and your choice of sauce.	32	https://ftp.goit.study/img/so-yummy/preview/Chick-Fil-A%20Sandwich.jpg	2025-07-09 17:36:40.811+00	2025-07-09 17:36:40.811+00
266	Christmas cake	6	7	3	Heat oven to 160C/fan 140C/gas 3. Line the base and sides of a 20 cm round, 7.5 cm deep cake tin. Beat the butter and sugar with an electric hand mixer for 1-2 mins until very creamy and pale in colour, scraping down the sides of the bowl half way through. Stir in a spoonful of the flour, then stir in the beaten egg and the rest of the flour alternately, a quarter at a time, beating well each time with a wooden spoon. Stir in the almonds.\r\n\r\nMix in the sherry (the mix will look curdled), then add the peel, cherries, raisins, cherries, nuts, lemon zest, spice, rosewater and vanilla. Beat together to mix, then stir in the baking powder.\r\n\r\nSpoon mixture into the tin and smooth the top, making a slight dip in the centre. Bake for 30 mins, then lower temperature to 150C/fan 130C/gas 2 and bake a further 2-2¼ hrs, until a skewer insterted in the middle comes out clean. Leave to cool in the tin, then take out of the tin and peel off the lining paper. When completely cold, wrap well in cling film and foil to store until ready to decorate. The cake will keep for several months.	A rich and fruity cake typically served during the Christmas season in the UK and other parts of the world.	175	https://ftp.goit.study/img/so-yummy/preview/Christmas%20cake.jpg	2025-07-09 17:36:40.822+00	2025-07-09 17:36:40.822+00
267	Nasi lemak	1	13	3	In a medium saucepan over medium heat, stir together coconut milk, water, ground ginger, ginger root, salt, bay leaf, and rice. Cover, and bring to a boil. Reduce heat, and simmer for 20 to 30 minutes, or until done.\r\n\r\n Step 2\r\nPlace eggs in a saucepan, and cover with cold water. Bring water to a boil, and immediately remove from heat. Cover, and let eggs stand in hot water for 10 to 12 minutes. Remove eggs from hot water, cool, peel and slice in half. Slice cucumber.\r\n\r\n Step 3\r\nMeanwhile, in a large skillet or wok, heat 1 cup vegetable oil over medium-high heat. Stir in peanuts and cook briefly, until lightly browned. Remove peanuts with a slotted spoon and place on paper towels to soak up excess grease. Return skillet to stove. Stir in the contents of one package anchovies; cook briefly, turning, until crisp. Remove with a slotted spoon and place on paper towels. Discard oil. Wipe out skillet.\r\n\r\n Step 4\r\nHeat 2 tablespoons oil in the skillet. Stir in the onion, garlic, and shallots; cook until fragrant, about 1 or 2 minutes. Mix in the chile paste, and cook for 10 minutes, stirring occasionally. If the chile paste is too dry, add a small amount of water. Stir in remaining anchovies; cook for 5 minutes. Stir in salt, sugar, and tamarind juice; simmer until sauce is thick, about 5 minutes.\r\n\r\n Step 5\r\nServe the onion and garlic sauce over the warm rice, and top with peanuts, fried anchovies, cucumbers, and eggs.	A fragrant Malaysian rice dish cooked in coconut milk, served with a variety of toppings like crispy anchovies, roasted peanuts, cucumber, and spicy sambal sauce. Often served as a popular breakfast dish.	40	https://ftp.goit.study/img/so-yummy/preview/Nasi%20lemak.jpg	2025-07-09 17:36:40.838+00	2025-07-09 17:36:40.838+00
268	Croatian Bean Stew	5	21	3	Heat the oil in a pan. Add the chopped vegetables and sauté until tender. Take a pot, empty the beans together with the vegetables into it, put the sausages inside and cook for further 20 minutes on a low heat. Or, put it in an oven and bake it at a temperature of 180ºC/350ºF for 30 minutes. This dish is even better reheated the next day.	Croatian Bean Stew is a hearty and flavorful dish made with beans, smoked meat, and vegetables, slow-cooked until tender and served with crusty bread. It's a perfect comfort food for cold days.	30	https://ftp.goit.study/img/so-yummy/preview/Croatian%20Bean%20Stew.jpg	2025-07-09 17:36:40.853+00	2025-07-09 17:36:40.853+00
269	Laksa King Prawn Noodles	7	13	3	Heat the oil in a medium saucepan and add the chilli. Cook for 1 min, then add the curry paste, stir and cook for 1 min more. Dissolve the stock cube in a large jug in 700ml boiling water, then pour into the pan and stir to combine. Tip in the coconut milk and bring to the boil.\r\nAdd the fish sauce and a little seasoning. Toss in the noodles and cook for a further 3-4 mins until softening. Squeeze in the lime juice, add the prawns and cook through until warm, about 2-3 mins. Scatter over some of the coriander.\r\nServe in bowls with the remaining coriander and lime wedges on top for squeezing over.	Spicy noodle soup with king prawns	20	https://ftp.goit.study/img/so-yummy/preview/Laksa%20King%20Prawn%20Noodles.jpg	2025-07-09 17:36:40.86+00	2025-07-09 17:36:40.86+00
271	Crock Pot Chicken Baked Tacos	4	12	3	Put the uncooked chicken breasts in the crock pot. Pour the full bottle of salad dressing over the chicken. Sprinkle the rest of the ingredients over the top and mix them in a bit with a spoon.\r\nCover your crock pot with the lid and cook on high for 4 hours.\r\nRemove all the chicken breasts from the crock pot and let cool.\r\nShred the chicken breasts and move to a glass bowl.\r\nPour most of the liquid over the shredded chicken.\r\nFOR THE TACOS:\r\nMake the guacamole sauce by mixing the avocado and green salsa together. Pour the guacamole mixture through a strainer until smooth and transfer to a squeeze bottle. Cut the tip off the lid of the squeeze bottle to make the opening more wide if needed.\r\nMake the sour cream sauce by mixing the sour cream and milk together until you get a more liquid sour cream sauce. Transfer to a squeeze bottle.\r\nIn a 9x 13 glass baking dish, fill all 12+ tacos with a layer of refried beans, cooked chicken and shredded cheese.\r\nBake at 450 for 10-15 minutes just until the cheese is melted and bubbling.\r\nOut of the oven top all the tacos with the sliced grape tomaotes, jalapeno and cilantro.\r\nFinish with a drizzle of guacamole and sour cream.\r\nEnjoy!	Tacos made with slow-cooked chicken	270	https://ftp.goit.study/img/so-yummy/preview/Crock%20Pot%20Chicken%20Baked%20Tacos.jpg	2025-07-09 17:36:40.881+00	2025-07-09 17:36:40.881+00
272	Lamb and Lemon Souvlaki	2	19	3	Pound the garlic with sea salt in a pestle and mortar (or use a small food processor), until the garlic forms a paste. Whisk together the oil, lemon juice, zest, dill and garlic. Mix in the lamb and combine well. Cover and marinate for at least 2 hrs or overnight in the fridge. If you’re going to use bamboo skewers, soak them in cold water.\r\n\r\nIf you’ve prepared the lamb the previous day, take it out of the fridge 30 mins before cooking. Thread the meat onto the soaked or metal skewers. Heat the grill to high or have a hot griddle pan or barbecue ready. Cook the skewers for 2-3 mins on each side, basting with the remaining marinade. Heat the pitta or flatbreads briefly, then stuff with the souvlaki. Add Greek salad (see 'Goes well with', right) and Tzatziki (below), if you like.	Lamb and Lemon Souvlaki is a popular Greek dish made with marinated lamb, skewered and grilled until tender and juicy, and served with lemon wedges and pita bread. It's a delicious and flavorful dish that's perfect for a summer barbecue or a casual dinner.	135	https://ftp.goit.study/img/so-yummy/preview/Lamb%20and%20Lemon%20Souvlaki.jpg	2025-07-09 17:36:40.895+00	2025-07-09 17:36:40.895+00
273	Shawarma	4	23	3	Combine the marinade ingredients in a large ziplock bag (or bowl).\r\nAdd the chicken and use your hands to make sure each piece is coated. If using a ziplock bag, I find it convenient to close the bag then massage the bag to disperse the rub all over each chicken piece.\r\nMarinate overnight or up to 24 hours.\r\nCombine the Yoghurt Sauce ingredients in a bowl and mix. Cover and put in the fridge until required (it will last for 3 days in the fridge).\r\nHeat grill/BBQ (or large heavy based pan on stove) on medium high. You should not need to oil it because the marinade has oil in it and also thigh fillets have fat. But if you are worried then oil your hotplate/grill. (See notes for baking)\r\nPlace chicken on the grill and cook the first side for 4 to 5 minutes until nicely charred, then turn and cook the other side for 3 to 4 minutes (the 2nd side takes less time).\r\nRemove chicken from the grill and cover loosely with foil. Set aside to rest for 5 minutes.\r\nTO SERVE\r\nSlice chicken and pile onto platter alongside flatbreads, Salad and the Yoghurt Sauce.\r\nTo make a wrap, get a piece of flatbread and smear with Yoghurt Sauce. Top with a bit of lettuce and tomato and Chicken Shawarma. Roll up and enjoy!	A Middle Eastern wrap filled with tender strips of marinated meat	24	https://ftp.goit.study/img/so-yummy/preview/Shawarma.jpg	2025-07-09 17:36:40.905+00	2025-07-09 17:36:40.905+00
274	Moussaka	5	19	3	Heat the grill to high. Brown the beef in a deep ovenproof frying pan over a high heat for 5 mins. Meanwhile, prick the aubergine with a fork, then microwave on High for 3-5 mins until soft. Mix the yogurt, egg and parmesan together, then add a little seasoning.\r\n\r\nStir the tomatoes, purée and potatoes in with the beef with some seasoning and heat through. Smooth the surface of the beef mixture with the back of a spoon, then slice the cooked aubergine and arrange on top. Pour the yogurt mixture over the aubergines, smooth out evenly, then grill until the topping has set and turned golden.	This Greek dish is made with layers of sliced eggplant, ground beef, and béchamel sauce, baked to perfection and served with a side of Greek salad.	15	https://ftp.goit.study/img/so-yummy/preview/Moussaka.jpg	2025-07-09 17:36:40.915+00	2025-07-09 17:36:40.915+00
275	Egyptian Fatteh	5	23	3	To prepare bread for bottom of dish: Take pita bread and rip into bite size pieces. In a frying pan, add about a 1/4 stick of butter, add bread pieces and fry until golden brown and crisp. Put these pieces in a glass baking dish, preferably a square sized dish. Set aside.\r\nThen add to same pan, a little more butter, salt, approximately 2 cloves of crushed fresh garlic, and a teaspoon or so of cumin stir around a bit until you can smell aroma, then add fried bread pieces to this mixture, stir to coat bread and put back into glass baking dish. Set aside.\r\nTo prepare meat: put some butter in a pot, stir fry meat until brown, add 1 onion quartered, salt & pepper, 1 cube of chicken bouillon and water to cover meat. Bring to a boil, turn down to simmer, cover and cook until tender, approximately 2 hours. After meat has cooled, take out chunks of meat and put in a bowl, set aside. Reserve soup from the meat separately.\r\nTo prepare the rice: Put some butter into a pot, add shareya (fideo noodles) like a handful or so, keep stirring until golden brown, not too dark, but very golden. Then add two cups of rice, stir a little bit until some of the rice turns an opaque white. Add 2-1/4 cups of water and salt to taste. Bring to a boil, cover and turn down to simmer, cook until tender. Test the rice tenderness after about 35 minutes.\r\nNow take some of the soup from meat and add to the top of the bread pieces in baking dish to saturate.Add cooked rice on top of bread pieces. Slowly spoon remainder of soup onto rice, looking at glass dish sides to see level of soup, should reach just to top of rice, don’t worry, this doesn’t have to be exact. Now you’re ready to make the sauce and fry the meat to put on top.\r\nTo prepare red sauce: In a pan, add a little oil or butter, crushed tomato, a half teaspoon of tomato paste, salt & pepper, 2 cloves of fresh crushed garlic and cumin. Add also approximately 3 tablespoons of vinegar, stir this until you smell aroma and it is a bit smooth. It should be a bit thick, not watery, but if too thick you can add a bit of water. Spread with a wooden spoon atop the rice to cover.\r\nTo fry meat: In a pan add a bit of butter or oil, the meat, just a touch of tomato paste, about a tablespoon of fresh crushed garlic, salt & pepper, a teaspoon of cumin. Cook until meat is golden fried.\r\nSpoon this atop the rice and serve. Enjoy!	A popular Egyptian dish, Fatteh is a layered dish made from bread, rice, chickpeas, and a yogurt or tahini sauce, and typically served with meat or chicken and nuts.	205	https://ftp.goit.study/img/so-yummy/preview/Egyptian%20Fatteh.jpg	2025-07-09 17:36:40.922+00	2025-07-09 17:36:40.922+00
276	Corned Beef and Cabbage	5	6	3	1\r\n\r\nPlace corned beef in large pot or Dutch oven and cover with water. Add the spice packet that came with the corned beef. Cover pot and bring to a boil, then reduce to a simmer. Simmer approximately 50 minutes per pound or until tender.\r\n\r\n2\r\n\r\nAdd whole potatoes and peeled and cut carrots, and cook until the vegetables are almost tender. Add cabbage and cook for 15 more minutes. Remove meat and let rest 15 minutes.\r\n\r\n3\r\n\r\nPlace vegetables in a bowl and cover. Add as much broth (cooking liquid reserved in the Dutch oven or large pot) as you want. Slice meat across the grain.	A classic Irish dish, this recipe features tender corned beef served with boiled cabbage, potatoes, and carrots.	80	https://ftp.goit.study/img/so-yummy/preview/Corned%20Beef%20and%20Cabbage.jpg	2025-07-09 17:36:40.937+00	2025-07-09 17:36:40.937+00
277	Rosół (Polish Chicken Soup)	4	25	3	Add chicken to a large Dutch oven or stock pot \r\nCover with water\r\nBring to a boil and simmer for 2 to 2 1/2 hours, skimming any impurities off the top to insure a clear broth\r\nIf your pot is big enough, add the vegetables and spices for the last hour of the cooking time\r\nMy Dutch oven wasn’t big enough to hold everything, just the chicken and other bones filled the pot, so I cooked the meat/bones for the full cooking time, then removed them, and cooked the vegetables and spices separately\r\nStrain everything out of the broth\r\nBone the chicken, pulling the meat into large chunks\r\nSlice the carrots\r\nReturn the chicken and carrots to the broth\r\nCook noodles according to package instructions if you’re using them\r\nAdd noodles to bowl and then top with hot soup	A comforting Polish soup, Rosół is a clear broth made from chicken, vegetables, and herbs, and typically served with noodles or dumplings.	150	https://ftp.goit.study/img/so-yummy/preview/Rosół%20(Polish%20Chicken%20Soup).jpg	2025-07-09 17:36:40.943+00	2025-07-09 17:36:40.943+00
278	Madeira Cake	6	7	3	Pre-heat the oven to 180C/350F/Gas 4. Grease an 18cm/7in round cake tin, line the base with greaseproof paper and grease the paper.\r\nCream the butter and sugar together in a bowl until pale and fluffy. Beat in the eggs, one at a time, beating the mixture well between each one and adding a tablespoon of the flour with the last egg to prevent the mixture curdling.\r\nSift the flour and gently fold in, with enough milk to give a mixture that falls slowly from the spoon. Fold in the lemon zest.\r\nSpoon the mixture into the prepared tin and lightly level the top. Bake on the middle shelf of the oven for 30-40 minutes, or until golden-brown on top and a skewer inserted into the centre comes out clean.\r\nRemove from the oven and set aside to cool in the tin for 10 minutes, then turn it out on to a wire rack and leave to cool completely.\r\nTo serve, decorate the cake with the candied peel.	A light and moist sponge cake that is typically flavored with lemon. It is a popular cake in the United Kingdom and is often served with tea.	40	https://ftp.goit.study/img/so-yummy/preview/Madeira%20Cake.jpg	2025-07-09 17:36:40.953+00	2025-07-09 17:36:40.953+00
279	Strawberry Rhubarb Pie	6	7	3	Pie Crust:  In a food processor, place the flour, salt, and sugar and process until combined. Add the butter and process until the mixture resembles coarse\r\n\r\nmeal (about 15 seconds). Pour 1/4 cup (60 ml) water in a slow, steady stream, through the feed tube until the dough just holds together when pinched. If necessary, add more water. Do not process more than 30 seconds.\r\nTurn the dough onto your work surface and gather into a ball. Divide the dough in half, flattening each half into a disk, cover with plastic wrap, and refrigerate for about one hour before using. This will chill the butter and relax the gluten in the flour. \r\n\r\nAfter the dough has chilled sufficiently, remove one portion of the dough from the fridge and place it on a lightly floured surface.  Roll the pastry into a 12 inch (30 cm) circle. (To prevent the pastry from sticking to the counter and to ensure uniform thickness, keep lifting up and turning the pastry a quarter turn as you roll (always roll from the center of the pastry outwards).)  Fold the dough in half and gently transfer to a 9 inch (23 cm) pie pan. Brush off any excess flour and trim any overhanging pastry to an edge of 1/2 inch (1.5 cm). Refrigerate the pastry, covered with plastic wrap, while you make the filling. \r\n\r\nRemove the second round of pastry and roll it into a 13 inch (30 cm) circle. Using a pastry wheel or pizza cutter, cut the pastry into about 3/4 inch (2 cm) strips. Place the strips of pastry on a parchment paper-lined baking sheet, cover with plastic wrap, and place in the refrigerator for about 10 minutes. \r\n\r\nMake the Strawberry Rhubarb Filling: Place the cut strawberries and rhubarb in a large bowl. In a small bowl mix together the cornstarch, sugar, and ground cinnamon. \r\n\r\nRemove the chilled pie crust from the fridge. Sprinkle about 2 tablespoons of the sugar mixture over the bottom of the pastry crust. Add the remaining sugar mixture to the strawberries and rhubarb and gently toss to combine. Pour the fruit mixture into the prepared pie shell. Sprinkle the fruit with about 1 teaspoon of lemon juice and dot with 2 tablespoons of butter.\r\n\r\nRemove the lattice pastry from the refrigerator and, starting at the center with the longest strips and working outwards, place half the strips, spacing about 1 inch (2.5 cm) apart, on top of the filling. (Use the shortest pastry strips at the outer edges.) Then, gently fold back, about halfway, every other strip of pastry. Take another strip of pastry and place it perpendicular on top of the first strips of pastry. Unfold the bottom strips of pastry and then fold back the strips that weren't folded back the first time. Lay another strip of pastry perpendicular on top of the filling and then continue with the remaining strips. Trim the edges of the pastry strips, leaving a 1 inch (2.5 cm) overhang. Seal the edges of the pastry strips by folding them under the bottom pastry crust and flute the edges of the pastry. Brush the lattice pastry with milk and sprinkle with a little sugar. Cover and place in the refrigerator while you preheat the oven to 400 degrees F (205 degrees C) and place the oven rack in the lower third of the oven. Put a baking sheet, lined with aluminum foil, on the oven rack (to catch any spills.)\r\n\r\nPlace the pie plate on the hot baking sheet and bake the pie for about 35 minutes and then, if the edges of the pie are browning too much, cover with a foil ring. Continue to bake the pie for about another 10 minutes or until the crust is a golden brown color and the fruit juices begin to bubble.\r\n\r\nRemove the pie from the oven and place on a wire rack to cool for several hours. Serve at room temperature with softly whipped cream or vanilla ice cream. Leftovers can be stored in the refrigerator for about 3 days. Reheat before serving. This pie can be frozen.\r\n\r\nMakes one 9 inch (23 cm) pie.	This sweet and tangy pie is made with a filling of fresh strawberries and rhubarb, baked inside a flaky pastry crust.	170	https://ftp.goit.study/img/so-yummy/preview/Strawberry%20Rhubarb%20Pie.jpg	2025-07-09 17:36:40.959+00	2025-07-09 17:36:40.959+00
280	Ful Medames	9	23	3	As the cooking time varies depending on the quality and age of the beans, it is good to cook them in advance and to reheat them when you are ready to serve. Cook the drained beans in a fresh portion of unsalted water in a large saucepan with the lid on until tender, adding water to keep them covered, and salt when the beans have softened. They take 2–2 1/2 hours of gentle simmering. When the beans are soft, let the liquid reduce. It is usual to take out a ladle or two of the beans and to mash them with some of the cooking liquid, then stir this back into the beans. This is to thicken the sauce.\r\nServe the beans in soup bowls sprinkled with chopped parsley and accompanied by Arab bread.\r\nPass round the dressing ingredients for everyone to help themselves: a bottle of extra-virgin olive oil, the quartered lemons, salt and pepper, a little saucer with the crushed garlic, one with chili-pepper flakes, and one with ground cumin.\r\nThe beans are eaten gently crushed with the fork, so that they absorb the dressing.\r\nOptional Garnishes\r\nPeel hard-boiled eggs—1 per person—to cut up in the bowl with the beans.\r\nTop the beans with a chopped cucumber-and-tomato salad and thinly sliced mild onions or scallions. Otherwise, pass round a good bunch of scallions and quartered tomatoes and cucumbers cut into sticks.\r\nServe with tahina cream sauce (page 65) or salad (page 67), with pickles and sliced onions soaked in vinegar for 30 minutes.\r\nAnother way of serving ful medames is smothered in a garlicky tomato sauce (see page 464).\r\nIn Syria and Lebanon, they eat ful medames with yogurt or feta cheese, olives, and small cucumbers.\r\nVariations\r\nA traditional way of thickening the sauce is to throw a handful of red lentils (1/4 cup) into the water at the start of the cooking.\r\nIn Iraq, large brown beans are used instead of the small Egyptian ones, in a dish called badkila, which is also sold for breakfast in the street.	A popular Middle Eastern breakfast dish made with cooked fava beans, drizzled with olive oil, lemon juice, and a sprinkle of cumin, served with warm pita bread.	150	https://ftp.goit.study/img/so-yummy/preview/Ful%20Medames.jpg	2025-07-09 17:36:40.971+00	2025-07-09 17:36:40.971+00
281	Provençal Omelette Cake	9	9	3	Break the eggs into two bowls, five in each. Whisk lightly and season with salt and pepper. Heat the oil in a pan, add the courgettes and spring onions, then fry gently for about 10 mins until softened. Cool, then stir into one bowl of eggs with a little salt and pepper. Add the roasted peppers to the other bowl of eggs with the garlic, chilli, salt and pepper.\r\nHeat a little oil in a 20-23cm frying pan, preferably non-stick. Pour the eggs with courgette into a measuring jug, then pourabout one-third of the mixture into the pan, swirling it to cover the base of the pan. Cook until the egg is set and lightly browned underneath, then cover the pan with a plate and invert the omelette onto it. Slide it back into the pan to cook the other side. Repeat with the remaining mix to make two more omelettes, adding a little oil to the pan each time. Stack the omelettes onto a plate. Make three omelettes in the same way with the red pepper mixture, then stack them on a separate plate.\r\nNow make the filling. Beat the cheese to soften it, then beat in the milk to make a spreadable consistency. Stir in the herbs, salt and pepper. Line a deep, 20-23cm round cake tin with cling film (use a tin the same size as the frying pan). Select the best red pepper omelette and place in the tin, prettiest side down. Spread with a thin layer of cheese filling, then cover with a courgette omelette. Repeat, alternating the layers, until all the omelettes and filling are in the tin, finishing with an omelette. Flip the cling film over the omelette, then chill for up to 24 hrs.\r\nTo serve, invert the omelette cake onto a serving plate and peel off the cling film. Pile rocket on the top and scatter over the cheese, a drizzle of olive oil and a little freshly ground black pepper. Serve cut into wedges.	A savory omelette cake made with eggs, tomatoes, onions, and herbs, commonly served in Provence, France.	60	https://ftp.goit.study/img/so-yummy/preview/Provençal%20Omelette%20Cake.jpg	2025-07-09 17:36:40.976+00	2025-07-09 17:36:40.976+00
282	Summer Pistou	9	9	3	Heat the oil in a large pan and fry the leeks and courgette for 5 mins to soften. Pour in the stock, add three-quarters of the haricot beans with the green beans, half the tomatoes, and simmer for 5-8 mins until the vegetables are tender.\r\nMeanwhile, blitz the remaining beans and tomatoes, the garlic and basil in a food processor (or in a bowl with a stick blender) until smooth, then stir in the Parmesan. Stir the sauce into the soup, cook for 1 min, then ladle half into bowls or pour into a flask for a packed lunch. Chill the remainder. Will keep for a couple of days.	A hearty French vegetable soup made with beans, potatoes, and vegetables, topped with a pesto-like sauce.	20	https://ftp.goit.study/img/so-yummy/preview/Summer%20Pistou.jpg	2025-07-09 17:36:40.986+00	2025-07-09 17:36:40.986+00
283	Tunisian Orange Cake	6	18	3	Preheat oven to 190 C / Gas 5. Grease a 23cm round springform tin.\r\nCut off the hard bits from the top and bottom of the orange. Slice the orange and remove all seeds. Puree the orange with its peel in a food processor. Add one third of the sugar and the olive oil and continue to mix until well combined.\r\nSieve together flour and baking powder.\r\nBeat the eggs and the remaining sugar with an electric hand mixer for at least five minutes until very fluffy. Fold in half of the flour mixture, then the orange and the vanilla, then fold in the remaining flour. Mix well but not for too long.\r\nPour cake mixture into prepared tin and smooth out. Bake in preheated oven for 20 minutes. Reduce the oven temperature to 160 C / Gas 2 and bake again for 30 minutes Bake until the cake is golden brown and a skewer comes out clean. Cool on a wire cake rack.	A deliciously moist cake made with fresh orange juice and zest, almond flour, and a touch of rosewater.	50	https://ftp.goit.study/img/so-yummy/preview/Tunisian%20Orange%20Cake.jpg	2025-07-09 17:36:41+00	2025-07-09 17:36:41+00
284	Cevapi Sausages	5	21	3	Place the ground meat in a bowl. Chop the onion very finely and grate the garlic cloves. Add to the bowl. Add the chopped parsley, all sorts of paprika, baking soda, dried breadcrumbs, water, Vegeta, salt, and pepper.\r\nMix well with the hand mixer fitted with the dough hooks. Cover the bowl with cling film/ plastic foil and leave to rest for 1 or 2 hours in the refrigerator.\r\nTake portions of the meat mixture, about 50-55 g/ 1.7-1.9 oz/ ¼ cup portions, and form the cevapi. The rolls should be about as thick as your thumb and about 7-10 cm/ 3-4 inches long. I had 18 sausages. The recipe can be easily doubled.\r\nGrill the cevapcici on the hot grill pan or on the barbecue for about 12-14 minutes, turning them several times in between, or until brown and cooked through. I checked by cutting one in the middle and then grilling the following batches for the same period of time.\r\nServe hot as suggested above. The cevapcici can be reheated in the oven at 180 degrees Celsius/ 350 degrees Fahrenheit for about 10 minutes or until heated through. Check one, if it is not hot enough, give the sausages a few more minutes.	A popular Bosnian grilled meat dish made with small, skinless sausages, typically made with a mixture of beef and lamb. Served hot in a traditional Bosnian flatbread called somun, with a side of raw onions and ajvar sauce.	70	https://ftp.goit.study/img/so-yummy/preview/Cevapi%20Sausages.jpg	2025-07-09 17:36:41.006+00	2025-07-09 17:36:41.006+00
285	Fennel Dauphinoise	13	9	3	Heat oven to 180C/160C fan/gas 4. Put potatoes, fennel, and garlic in a medium non-stick pan. Pour in milk and double cream, season well and simmer gently, covered, for 10 mins, stirring halfway through, until potatoes are just tender.\r\nDivide the mixture between 2 small (about 150ml) buttered ramekins and scatter with Parmesan. Bake for 40 mins until the potatoes are golden and tender when pierced with a knife. Snip the reserved fennel fronds over before serving.	A French potato gratin dish made with layers of thinly sliced potatoes, cream, and fennel.	50	https://ftp.goit.study/img/so-yummy/preview/Fennel%20Dauphinoise.jpg	2025-07-09 17:36:41.016+00	2025-07-09 17:36:41.016+00
\.


--
-- Data for Name: recipes_ingredients; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.recipes_ingredients (recipe_id, ingredient_id, measure) FROM stdin;
1	340	175g
1	521	175g
1	365	140g
1	362	50g
1	3	½ tsp
1	332	3 Medium
1	556	½ tsp
1	8	¼ teaspoon
1	525	½ tsp
1	73	200g
1	59	1kg
1	455	Dusting
2	281	300g soaked overnight in water
2	158	2kg cut into 3cm cubes
2	27	120ml
2	164	24 Skinned
2	292	4 large
2	94	2
2	159	1
2	91	350g
2	322	150ml
2	521	1 tsp
2	123	4 sprigs
2	284	4 sprigs
2	384	450ml
3	340	100g 
3	490	900g
3	428	3
3	106	2 medium
3	292	4 sliced
3	327	25g
3	120	2 tsp
3	384	500ml
3	382	2
3	179	900g
4	440	3/4 cup
4	177	1/2 cup
4	389	1/4 cup
4	412	1/2 teaspoon
4	297	1/2 teaspoon
4	506	4 Tablespoons
4	155	2
4	535	1 (12 oz.)
4	443	3 cups
5	285	1 lb
5	27	1 tablespoon
5	440	2 tablespoons
5	15	2 tablespoons
5	544	4 tablespoons
6	55	Dash
6	339	1 Can
6	179	5 thin cut
6	321	2 cups
7	327	175g/6oz
7	88	75g/2½oz
7	36	2-3 tbsp
7	458	1 tbsp
7	340	125g/4½oz
7	521	125g/4½oz
7	334	125g/4½oz
7	230	1
7	8	½ tsp
7	157	50g/1¾oz
8	229	1  bunch
8	539	2 strips
8	267	3 cloves Chopped
8	181	1 medium
8	26	1/2 tsp
8	40	1 Sprig
8	298	1
8	569	1
8	119	4
8	55	Splash
9	396	4-5 pound
9	178	Dash
9	181	3
9	267	5 cloves
9	40	1 Sprig
9	420	1 sprig 
9	382	4
9	452	2 cups
9	292	3 Large
9	345	1 Tbsp
9	179	4 Mashed
10	340	1 cup 
10	473	3
10	248	8 oz 
10	3	1 tsp 
10	531	3 cups 
10	400	1 Jar
11	179	225g new
11	344	100g 
11	363	1 tbsp
11	267	1 clove
11	25	4 tsp 
11	152	400ml
11	347	2 tsp
11	511	1 tsp
11	309	450g boneless
11	182	2 fresh kaffir leaves
11	160	handfull
11	357	Boiled
12	71	500g
12	106	2 chopped
12	292	2 chopped
12	267	2 cloves
12	512	2
12	105	200ml
12	177	2 Litres
12	345	3 tbs
12	178	1tbsp
12	249	1/2 tsp
12	26	1/2 tsp
12	55	2 tbs
13	179	1.5kg
13	340	30g
13	264	5 tblsp 
13	473	2
13	164	7
13	292	3 chopped
13	121	2 sticks
13	279	1 finely chopped 
13	322	4 tbsp
13	491	1 tbls
13	9	400g
13	384	350ml
13	309	600g
13	516	16
13	213	2 tbs
14	349	320g
14	280	4 tbs
14	484	3
14	53	4 tbs
14	282	100ml
14	455	1 tbs
14	136	3
15	340	100g 
15	462	175g
15	332	2 large
15	365	225g
15	3	1 tsp 
15	425	1 tsp 
15	113	3 tbs
15	447	275ml
15	264	to serve
15	556	1 tsp 
16	55	450ml
16	327	400g
16	425	2 tsp
16	511	550ml
16	332	5
16	178	½ tsp
16	411	2 tsp
16	292	500g grated
16	260	150g
16	248	200g
16	521	150g
16	340	100g 
17	542	2
17	539	3
17	171	2
17	24	2
17	290	1 Slice
17	332	2
17	296	1 Slice
18	27	2 tbs
18	6	8
18	496	200g
18	162	4
18	87	1 can 
18	332	2
18	529	Dash
18	24	4 Chopped
18	208	1/4 
18	289	1 tbs
18	103	4 tbs
19	179	2
19	464	1
19	267	2 cloves
19	182	1
19	296	2
19	14	1 lb
19	18	 
19	529	 
19	366	 
19	511	 
19	55	 
19	178	 
19	249	 
20	257	400g
20	524	8
20	215	2 pinches
20	27	5 tblsp 
20	106	1 large
20	267	3 cloves
20	26	2 tbs
20	271	1 tail
20	75	4
20	504	650ml
20	24	2 large
20	202	Juice of 1
20	213	Topping
21	292	6 chopped
21	181	1 sliced
21	279	4
21	247	1 tsp 
21	294	1/2 tsp
21	27	1 tbs
21	537	1/4 tsp
21	289	1 tsp 
22	162	1 Packet
22	10	150g
22	181	150g
22	335	40g
22	178	Dash
22	249	Dash
23	489	Handful
23	512	4
23	267	4 cloves
23	40	Handful
23	416	4
23	322	100ml
24	340	250g
24	327	350g
24	202	Juice of 1/2
24	467	200g
24	318	50g
24	462	100g 
24	411	1 tsp 
24	283	1 tsp 
24	480	1 tsp 
24	332	1 beaten
24	511	spinkling
25	14	200g
25	417	1
25	177	Dash
25	178	1/2 tsp
25	511	1 tsp 
25	440	10g
25	381	10g
25	491	30g
25	501	10g
25	294	Dash
26	229	1  bunch
26	252	8
26	2	1 Head chopped
26	279	8
26	181	Sliced
26	415	Sliced
26	384	1 cup 
26	178	 
26	249	 
27	263	2 tbs
27	313	4
27	452	1 1/2 cup 
27	340	2 tbs
27	267	2 cloves minced
27	209	1 medium finely diced
27	171	4 oz 
27	79	¼ cup
27	426	¼ cup
27	456	1 tbs
27	120	1 tbs
27	572	Dash
27	213	1 tbs minced
27	560	1 tbs minced
27	178	to taste
27	249	to taste
28	447	200ml
28	335	60ml
28	332	2
28	531	1600g
28	3	3 tsp
28	178	1/2 tsp
28	62	25g
28	511	45g
28	238	3 tbs
29	2	1
29	340	2 tbs
29	181	1 chopped
29	393	1 lb
29	401	1/2 lb
29	357	1 1/2 cups 
29	267	1 tsp 
29	178	1 tsp 
29	175	1/4 tsp
29	491	3 cans
30	10	400g
30	27	2 tbs
30	50	2
30	181	Chopped
30	203	1/4 
30	137	2 sliced
30	90	2 large
30	300	1 cup 
30	148	2 tsp
30	249	Pinch
30	345	2 tsp
30	311	1 1/2 tsp 
30	550	1 1/2 tsp 
30	26	1/2 tsp
31	315	6 small
31	353	4 small
31	569	1 thinly sliced
31	434	1 medium
31	181	1 finely chopped 
31	286	300g
31	26	1 tsp 
31	215	pinch
31	322	200ml
31	329	700ml
31	395	100g 
31	202	1 chopped
31	213	Handful
31	178	pinch
31	175	pinch
32	353	2 medium
32	213	2 tbs chopped
32	202	Juice of 1
32	536	175g
32	27	1 tbs
32	285	350g
32	516	to serve
33	106	2 finely chopped
33	40	sprigs of fresh
33	27	2 tbs
33	179	1.5kg
33	329	425g
34	41	25g
34	319	500g
34	247	1 tsp 
34	294	1 tsp 
34	26	1 tsp 
34	267	1 clove finely chopped
34	27	For frying
34	117	4
34	208	Grated
34	83	200g
34	355	2 tbs
35	6	1  bunch
35	27	Dash
35	390	1 finely sliced
35	267	1 clove
35	524	350g
35	414	75g
35	340	15g
35	327	250g
35	417	1 Seperated
35	148	1/2 tsp
36	55	1 tbs
36	181	1 large
36	14	1 chopped
36	329	150ml
36	440	1 tbs
36	221	1 tsp 
36	511	1 tsp 
36	332	2 Beaten 
36	468	200g
36	560	Chopped
37	27	4 tbs
37	490	750g
37	215	1 1/2 tsp 
37	181	1 Large Chopped
37	177	25 ml
37	213	30g
37	340	1 tbs
37	202	1
38	156	1kg
38	528	200g (soaked overnight)
38	106	2 chopped
38	292	2 chopped
38	382	2
38	121	1 chopped
38	395	300g
38	296	to serve
39	58	450g
39	35	400g
39	181	1 chopped
39	26	1 tsp 
39	564	2 tsp
39	570	2 tsp
39	529	1 tsp 
39	569	1 sliced
39	32	1 sliced
39	24	200g
39	178	to taste
39	249	to taste
39	365	250g
39	350	30g
39	27	for frying
40	471	175g/6oz
40	340	75g/3oz
40	172	200g/7oz
40	521	75g/3oz
40	70	2
40	334	75g/3oz
40	8	1 tsp
40	157	50g/1¾oz
41	309	1.2 kg
41	181	5 thinly sliced
41	24	2 finely chopped
41	267	8 cloves chopped
41	397	1 tbsp
41	55	¼ cup
41	42	2 tsp
41	69	3 tsp
41	146	1 tsp
41	448	1 tsp
41	530	2
41	212	1 cup
41	330	¾ cup
41	98	3 tsp Dried
41	537	1 tsp
41	178	To taste
42	340	50g
42	413	175g
42	269	5
42	291	500g
42	238	175g
42	278	175g
42	447	150ml
42	264	275ml
42	567	2 tblsp 
42	407	Crushed
43	71	1kg
43	106	3
43	267	4 cloves
43	27	Dash
43	555	300g
43	247	2 tsp
43	163	1 tsp
43	255	1 large
43	382	3
43	284	2 tsp dried
43	109	2 ancho
43	510	3 tbsp
43	472	2 x 400g
43	366	2 tbsp
43	127	2 tbsp
43	522	2 x 400g tins
44	327	250g
44	340	135g
44	278	400g
44	379	150g
44	133	Zest of 2
44	332	1 beaten
45	483	500g
45	178	1 tsp 
45	543	7g
45	447	300ml 
45	340	40g
45	332	1
45	55	Dash
45	389	75g
45	411	2 tsp
45	92	150g
45	521	2 tbs
46	216	85g
46	67	400ml can
46	104	4 tbsp
46	71	600g stewing cut into strips
46	179	450g waxy
46	181	1 cut thin wedges
46	182	4 leaves
46	255	1
46	132	1 tbsp
46	389	1 tbsp palm or soft light
46	224	1 tbsp
46	465	1 red deseeded and finely sliced, to serve
46	61	to serve
47	110	2 tblsp 
47	181	1 finely chopped 
47	121	1
47	442	1 sliced
47	179	1 medium
47	340	1 knob
47	329	1 litre hot
47	134	1 Head chopped
47	13	140g
48	444	2 cups
48	46	3 cups
48	238	½ cup
48	556	1 tsp
48	216	1 ¼ cups
49	542	8 large
49	324	1 Jar
49	364	1200g
49	113	1 tbls
49	191	1 tsp 
50	475	250g
50	455	100g 
50	473	2
50	378	2 tbs
50	362	100g 
51	124	800g
51	340	50g
51	279	3 chopped
51	2	1 chopped
51	6	8
51	264	100ml
51	345	2 tbs
51	156	180g
51	332	4
52	520	1 1/2 cups 
52	357	1 1/2 cups 
52	294	1/2 tsp
52	176	2 cups 
52	574	Can
52	181	1 large
52	178	Sprinking
52	55	1/2 cup 
53	27	2 tbs
53	181	1 medium finely diced
53	574	250g
53	329	1.5L
53	247	1 tsp 
53	267	5 cloves
53	178	1/2 tsp
53	38	1 tsp 
53	249	Pinch
53	182	1/2 
54	291	500g
54	332	4 large
54	531	3 tbs
54	511	250g
54	411	1 tsp 
54	133	Grated Zest of 2
54	498	5 tbs
54	455	sprinking
55	543	1/4 ounce
55	177	1/4 cup
55	511	1/2 cup 
55	178	1 tsp 
55	332	2
55	573	1/3 cup
55	531	5 drops
55	263	Sprinking
55	447	1/2 cup
55	533	1 1/2 cups 
55	424	6 tablespoons
55	340	 1/3 cup
56	27	1 tbs
56	464	2 chopped
56	390	1 finely chopped 
56	267	1 clove
56	294	Chopped
56	536	800g
56	521	1 tbs
56	332	4
56	414	Spinkling
57	285	400g
57	206	3
57	208	1
57	496	400g
57	355	4 tbs
57	182	zest and juice of 1
57	519	2 tsp
57	27	3 tbs
58	27	5 tablespoons
58	181	1 chopped
58	121	1 stalk chopped
58	267	1 tablespoon minced
58	107	2 cups
58	502	1
58	177	4 cups
58	420	1 fresh sprig
58	40	1 fresh sprig
58	229	1 pound chopped
58	375	4 thick slices
58	565	½ cup freshly grated
59	81	1 cup
59	177	2-1/2 cups
59	178	1 tsp
59	243	1/4 tsp
59	96	3 tbs
59	441	1 cup
59	42	1/2 tsp
59	170	1/2 tsp
59	512	2
59	283	2 tsp shredded
59	532	2 tbs 
59	569	1/2 tsp
59	511	1 tsp
59	537	1/4 tsp
60	273	1/2 cup
60	301	1/3 cup raw
60	3	1 tsp
60	80	2
60	477	1/2 cup
60	533	1 tsp
60	177	1/2 cup boiling
61	340	75g
61	442	1kg
61	178	½ tsp
61	282	300ml 
61	417	1
61	473	3
61	233	¼ teaspoon
61	327	225g
61	222	60g
61	351	50g
61	177	2 tbs
62	171	400g
62	191	1-2tbsp
62	27	Dash
62	313	750g piece
62	342	6-8 slices
62	349	500g
62	531	Dusting
62	473	2 Beaten 
63	179	450g
63	27	2 tblsp 
63	332	4
63	139	1 tbls
63	356	2 tblsp 
63	363	50g
63	464	½
63	496	100g 
63	87	400g
64	363	1 tbls
64	276	225g
64	283	2
64	247	1 tsp 
64	243	1 tsp 
64	294	1 tsp 
64	530	1
64	298	4 large
64	528	150g
64	537	1 tsp 
64	493	to serve
65	55	2 tbs
65	10	500g
65	181	1 chopped
65	491	1 tbls
65	327	1 ½ tbsp
65	171	75g
65	452	250ml
65	120	Dash
65	559	400g
65	473	1
66	365	750g
66	511	6 tablespoons
66	332	2
66	447	1 cup 
67	309	1 whole
67	298	1 chopped
67	106	2 chopped
67	279	2 chopped
67	569	1 chopped
67	292	1 chopped
67	182	1
67	40	2 tsp
67	480	1 tsp 
67	440	2 tbs
67	506	2 tsp
67	152	2 cups 
67	55	1 tbs
68	179	3 Lbs
68	346	3 Lbs
68	63	1/2 cup 
68	171	1 oz 
68	520	3/4 cup 
68	267	6 cloves
68	479	1 tsp 
68	181	3 cups 
68	491	2 tbsp
68	382	 
68	27	 
68	437	2 cups 
68	329	8 cups 
68	506	2 tbsp
68	440	2 tsp
68	420	2 sprigs
68	213	 
68	561	 
68	560	 
69	468	300g
69	221	1 tbs
69	507	Garnish
69	6	Garnish
70	176	8 ounces (230 grams)
70	327	1/3 cup
70	495	3/4 teaspoon
70	550	1/2 teaspoon
70	479	1/2 teaspoon
70	175	1/2 teaspoon
70	16	1/8 teaspoon
70	340	6 tablespoons (85 grams)
70	194	1 1/2 cups (360 milliliters)
70	426	1 cup (240 milliliters)
70	338	1 pound (455 grams) 
70	296	16 slices square
70	351	8 slices mild
70	410	8 slices
71	190	500g
71	531	1 tbls
71	55	Dash
71	181	1 sliced
71	292	2 sliced
71	329	350ml/12fl
71	179	500g
71	559	450g
71	332	To Glaze
72	340	85g
72	547	140g
72	511	1tbsp
72	248	900g
72	521	250g
72	327	3 tbs
72	289	1 ½ teaspoons
72	332	3 Large
73	63	250g
73	68	225g
73	278	150g
73	217	Zest of 1
73	51	500g
73	166	250g
74	340	200g
74	417	1 large
74	447	4 tbs
74	278	200g
74	113	85g
74	389	85g
74	128	100g 
74	365	250g
74	412	1 tbs
75	27	4 tablespoons
75	268	6 small
75	574	1 can
75	536	2 cups halved
75	83	1 1/2 cups
75	218	1 tablespoon
75	213	½ cup 
76	27	3 tablespoons
76	181	1
76	267	2 cloves
76	225	2 1/4 cups
76	40	1 teaspoon
76	512	3
76	178	1 tablespoon
76	121	2 sticks
77	340	50g/2oz
77	181	1 finely chopped 
77	357	150g
77	322	125ml 
77	329	1 litre hot
77	202	The juice and zest of one
77	192	240g large
77	285	150g
77	343	100g tips blanched briefly in boiling water
77	175	ground
77	565	50g shavings
78	505	250g
78	538	2 tbs
78	181	1 sliced
78	2	0.25
78	415	10
78	6	4
78	221	4 tbsp
78	440	2 tbs
78	521	1 tblsp 
78	120	1 tblsp 
79	365	225g
79	521	75g
79	3	1 tsp 
79	340	125g
79	92	150g
79	332	1
79	447	1 tbs
79	556	2 tsp
80	266	225g
80	340	25g
80	390	1 chopped
80	267	1 clove finely chopped
80	161	400g
80	27	2 tbs
80	516	Handful
80	464	1 chopped
80	414	100g 
80	355	Chopped
80	202	Juice of 1/2
81	179	1 medium
81	363	1 tsp 
81	259	500g
81	181	1 finely chopped 
81	279	1 finely chopped 
81	411	¼ tsp
81	480	¼ tsp
81	233	¼ tsp
81	329	100ml
81	559	400g
81	417	To Glaze
82	20	600g
82	179	300g
82	530	1 chopped
82	294	3 tbs
82	42	1 tsp 
82	249	1/2 tsp
82	267	3 cloves
82	283	2 pieces 
82	531	2 tbs
82	332	3
82	379	75g
82	55	For frying
83	264	568ml
83	277	100g 
83	533	Pod of
83	473	6
83	521	2 tbs
84	423	500g
84	55	Dash
84	531	To Glaze
84	178	Dash
85	319	500g
85	267	2 cloves minced
85	181	1
85	496	300g
85	491	3 tbs
85	247	1 tbs
85	384	1 Litre
85	38	3 tsp
85	574	400g
85	289	1/2 
85	176	150g
85	178	Pinch
85	249	Pinch
86	340	225g
86	327	350g
86	521	100g 
86	392	280g
86	417	1 small
86	455	Topping
87	106	2 finely chopped
87	569	1 Diced
87	294	Small bunch
87	390	1 small
87	267	3 cloves
87	437	400ml
87	215	Pinch
87	512	1
87	179	300g
87	472	400g
87	317	600g
87	1	300g
87	154	8
87	101	500g
87	257	500g
87	112	1 sliced
88	27	3 tbsp
88	267	8 cloves chopped
88	521	3 tbsp
88	139	2 tblsp 
88	441	3 400g Cans
88	295	Bunch
88	497	2 tubs
88	447	3 tbsp
88	565	85g
88	118	2 sliced
88	496	1kg
88	291	3 tubs
88	233	pinch
88	107	400g
89	110	1
89	181	1
89	267	3 cloves
89	26	1 tsp 
89	247	½ tsp
89	40	1 tblsp 
89	292	3 Medium
89	121	2 small stalks
89	569	1
89	32	1
89	298	2 x 400g tins
89	320	250ml
89	434	2 sliced
89	406	250g
90	14	2
90	322	200ml
90	26	1/2 tsp
90	202	2
90	289	1/2 
90	27	Dash
90	300	To serve
90	179	1 kg
90	55	For frying
91	31	142ml
91	521	25g
91	391	100g 
91	340	25g
91	264	2 tbs
91	473	4
91	180	5
91	455	to serve
92	340	½ cup 
92	511	1 cup 
92	332	2
92	556	1 tsp 
92	531	2 cups 
92	3	1 tsp 
92	447	1 1/4 cup
92	168	1 1/2 cup 
92	389	1 1/2 cup 
92	31	1 1/2 cup 
93	179	5
93	134	1
93	267	2 cloves
93	161	2
93	510	 
93	519	 
93	384	 
93	340	1 tbsp
93	55	1 tbsp
93	27	1 tbsp
94	340	50g
94	27	1 tbs
94	181	1 kg
94	511	1 tsp 
94	279	4 sliced
94	327	2 tbs
94	437	250ml
94	452	1L
94	296	4 sliced
94	11	140g
95	71	1lb
95	55	5 tbs
95	255	1
95	163	3
95	43	3
95	136	3
95	67	1 cup 
95	177	1 cup 
95	132	2 tbs
95	182	6
95	511	1 tbs
95	209	5
96	364	400g
96	27	3 tbs
96	181	1 chopped
96	279	2 chopped
96	491	2 tbs
96	24	800g
96	511	1 tbs
96	302	1 tbs
96	411	Pinch
96	211	2 tbs
97	220	450g
97	181	1 chopped
97	6	1
97	267	2 cloves minced
97	283	1 tsp 
97	19	1 chopped
97	440	2 tbs
97	123	1 chopped
97	55	2 tbs
97	177	350ml
97	527	200g
97	173	1 tbs
98	55	1 tbls
98	181	1 finely chopped 
98	267	2 cloves chopped
98	283	1 part 
98	294	1 Packet
98	247	1 tsp 
98	26	1 tsp 
98	537	2 tsp
98	441	400g
98	253	400g
98	419	to serve
99	125	1 large
99	181	½ cup 
99	24	1 cup
99	267	6 cloves
99	335	1.5 tablespoon
99	499	1 tablespoon chopped
99	178	as required
100	76	280g
100	436	200g
100	27	2 tblsp 
100	279	2 cloves chopped
100	390	1 large
100	192	24 Skinned
100	536	12
100	295	Handful
100	312	Leaves
100	296	to serve
100	44	2 tbsp
100	182	Grated Zest of 2
100	521	2 tsp
101	71	1kg
101	327	2 tbs
101	110	2 tbs
101	105	200ml
101	452	400ml
101	181	1 finely sliced
101	292	2 chopped
101	40	3 sprigs
101	345	2 tbs
101	473	2 free-range
101	349	400g
101	344	300g
101	340	25g
101	178	pinch
101	249	pinch
102	179	1kg
102	340	Knob
102	447	Dash
102	11	50g
102	442	2 sliced
102	327	75g
102	322	150ml
102	213	2 tbs chopped
102	285	250g
102	20	250g
102	4	250g
102	332	6
103	471	300g
103	340	150g
103	557	400g
103	473	3
103	182	4
103	264	300ml 
103	455	1 tbls
104	309	8 oz 
104	178	pinch
104	249	pinch
104	7	1 tsp 
104	283	1 tsp 
104	6	1 tbs
104	357	1/2 cup 
104	177	8 cups 
104	294	2 oz 
105	332	3
105	340	2 knobs
105	565	1 tsp 
105	213	1 tbs chopped
105	560	1 tbs chopped
105	11	4 tbs
106	288	3 tsp
106	116	600g
106	539	100g 
106	209	350g
106	568	250g
106	279	2 sliced
106	188	1
106	491	1 tbs
106	105	750 ml 
106	159	600g
106	27	2 tbs
106	40	sprigs of fresh
106	420	sprigs of fresh
106	512	2
106	136	4
107	15	2 tbs
107	440	2 tbs
107	538	2 tbs
107	173	2 tbs
107	177	2 tbs
107	309	500g
107	448	1 tbs
107	115	1 tsp 
107	389	1 tbs
107	6	4 Chopped
107	279	6 cloves
107	189	220g
107	216	100g 
108	177	150ml
108	511	1 tsp 
108	543	15g
108	327	225g
108	178	1 1/2 tsp 
108	27	Drizzle
108	204	80g
108	118	70g
108	284	Peeled and Sliced
108	160	Leaves
108	175	Pinch
109	309	1.5kg
109	340	25g
109	27	6 tblsp
109	464	2 sliced
109	569	3 Large
109	555	130g
109	463	8
109	267	6 cloves sliced
109	419	300g
109	491	drizzle
109	26	½ tsp
109	382	4
109	40	Handful
109	384	350ml
109	437	180g
109	133	2
109	516	100g 
109	178	to serve
109	249	to serve
110	374	1 kg
110	173	1 kg
110	24	2
110	178	Pinch
110	181	1
110	530	1
110	499	1  bunch
111	253	2 cups 
111	292	1 large
111	6	2 chopped
111	40	4 sprigs
111	181	1 Diced
111	175	1/2 tsp
111	569	2 chopped
111	279	4 Mashed
111	480	1 tbs
111	71	2 Lbs
111	177	2L
111	179	4
111	327	1 cup 
111	152	1 cup 
112	327	120g
112	521	60g
112	340	60g
112	484	300g
112	478	30g
112	411	¼ teaspoon
112	135	to serve
113	217	3
113	478	1 tbs
113	250	2 tbs
113	166	300g
113	326	500g
113	497	250g
113	264	284ml
113	157	Handful
113	391	Grated
114	313	400-500 g
114	439	2
114	24	2
114	121	1/4
114	2	1/4 head
114	179	3-4
114	292	1-2
114	541	1
114	5	1-2 smoked dried
114	382	2
114	480	3 cloves
114	279	1 head
114	32	1
114	491	200 ml
114	62	30 g
114	204	2 tbsp
114	178	
115	332	4
115	148	2 tbs
115	460	2
115	340	To serve
115	60	8 slices
115	289	2 tsp
115	417	3 Yolkes
115	62	125g
116	177	1/2 cup 
116	543	2 parts 
116	511	1/2 cup 
116	447	1/2 cup 
116	340	6 tblsp
116	332	2
116	178	1 ½ tsp
116	531	2-1/2 cups
116	335	for frying
116	202	garnish
116	411	garnish
117	27	1 tbs
117	171	300g
117	398	4
117	204	500g
117	494	1
117	516	100g 
117	213	Chopped
118	433	8
118	181	1 sliced
118	27	1/2 cup 
118	480	1 tsp 
118	249	1 tsp 
118	512	1
119	453	250g
119	340	175g
119	447	2 tablespoons
119	332	5
119	304	175g
119	531	125g
120	27	2 tbsp
120	283	4cm piece finely chopped
120	267	2 cloves peeled and chopped
120	24	800g peeled and chopped 
120	289	2 tbsp
120	521	1 tsp
120	469	50
120	126	1 large
120	319	400g
120	181	1 medium
120	419	2 tbsp
120	211	2 tbsp
120	294	2 tbsp chopped
120	411	½ tsp ground 
121	124	900g
121	27	2 tbsp
121	72	600ml
121	476	800g
121	327	1 tbsp
121	233	Grating
121	264	3 tbsp
121	570	200g
121	442	1 finely sliced
121	524	200g peeled raw
121	213	Large handful
121	39	Handful
121	202	Grated zest of 1
121	11	25g grated
122	27	1 tbsp
122	181	1 chopped
122	161	200g
122	283	pinch
122	38	2 tblsp 
122	287	10
122	574	220g
122	240	200g
122	384	200ml
122	294	Handful
123	27	1 tbls
123	181	1
123	442	1 chopped
123	267	3 cloves
123	247	4 tsp ground 
123	294	2 tsp ground
123	108	1 tsp
123	411	1/2 tsp
123	376	1 tsp
123	430	1 tsp
123	302	1/2 tsp
123	184	1 can
123	177	3 cups
123	292	3 chopped
123	520	1 1/2 cups
123	489	1 tsp
123	370	1 Small
123	310	1 Cup
123	274	1 tsp
124	71	8 slices
124	134	12 florets
124	179	1 Packet
124	292	1 Packet
124	327	140g
124	332	4
124	447	200ml
124	363	drizzle (for cooking)
125	523	1 pound
125	27	1/4 cup
125	267	3 cloves
125	441	1 tin 
125	131	1/2 teaspoon
125	306	1/2 teaspoon
125	160	6 leaves
125	77	spinkling
126	326	125g
126	521	50g
126	430	5 tbs
126	417	1 beaten
126	471	200g shredded
126	551	100g 
126	362	50g
126	340	100g 
126	264	4 tbs
126	383	3 tbs
126	455	250g
126	391	150g
127	531	4 cups 
127	177	1 1/2 cups 
127	178	1/4 tsp
127	62	1 cup 
127	27	1/4 cup
128	5	8
128	521	100g 
128	340	100g 
128	43	2
128	136	3 Pods
128	411	1 large
128	79	2 tbs
128	349	500g
129	527	3 cups 
129	6	6
129	279	4
129	213	1/4 cup
129	247	2 tsp
129	3	1 tsp 
129	16	1/2 tsp
129	531	Spinkling
129	55	As required
130	325	12
130	182	1/2 
130	6	1  bunch
130	283	1 tbs chopped
130	267	3 cloves
130	181	1/2 
130	390	3 chopped
130	40	1/2 teaspoon
130	440	2 tbs
130	55	2 tbs
130	389	3 tbs
130	480	1 tbs
130	419	200g
130	152	400g
130	253	800g
131	340	2 tbs
131	541	1/3 cup
131	49	1 1/2 cups 
131	179	2 cups 
131	332	3
131	547	1 pot
131	531	3 cups 
131	178	1/4 tsp
131	3	1 tbs
132	177	2L
132	528	300g
132	14	100g 
132	320	1
132	121	2
132	292	2
132	179	1 large
132	181	1 small
132	442	1 small
132	159	1 cup 
132	542	1 pound
133	114	4
133	283	1 inch
133	267	8 cloves
133	249	1.5 tsp
133	247	1 tsp
133	243	½ tsp
133	255	To your taste
133	136	2
133	511	1 tbsp
133	548	2 marble sized
133	501	2.5 tbsp
133	335	for frying
134	327	300g
134	340	75g
134	248	100g 
134	455	1 tbls
134	168	200ml
134	567	250g
134	280	100g 
134	332	4
134	556	1 tsp 
134	486	400g
134	449	200g
135	340	1 tbs
135	539	4
135	181	1 finely sliced
135	279	1 chopped
135	100	20
135	179	400g
136	27	2½ tbsp
136	252	6 cut into 1.5cm-thick slices
136	181	1 large peeled and chopped
136	126	1 trimmed and roughly chopped; reserve any fronds to garnish
136	399	½ tsp
136	267	1 clove, peeled and sliced
136	422	2 tsp lightly toasted and then gently crushed
136	105	100ml
136	441	400g tinned
136	521	½ tsp
136	199	50g cut in half lengthways
136	451	500g
136	169	30g roughly crumbled into 0.5cm pieces
136	482	1  rinsed and patted dry
136	295	50g torn
137	244	50g
137	202	zest and juice of 1
137	27	2 tblsp 
137	464	1 chopped
137	267	1 clove peeled crushed
137	32	1 thinly sliced
137	344	200g
137	434	1 sliced
137	229	100g shredded
137	406	250g pack
138	531	250g
138	340	125g
138	417	1
138	178	Pinch
138	137	300g
138	447	100ml milk
138	332	3
138	303	100g
138	472	350g
138	262	3tbsp
138	519	1 tbsp
138	160	Topping
139	405	227g
139	340	25g
139	173	1 tsp 
139	303	100g 
139	233	Grated
139	427	250g
139	213	Chopped
140	394	750g
140	559	350g
140	327	Dusting
140	521	140g
140	178	½ tsp
140	233	½ tsp
140	411	1 tsp 
140	332	2 Beaten 
140	340	25g
140	447	175g
140	455	1 tblsp 
141	179	5 Large
141	27	2 tbs
141	459	1
141	106	5
141	540	1 tbs
141	394	500g
141	332	24 Skinned
141	178	Pinch
141	249	Pinch
142	340	50g
142	365	250g
142	533	1 small
142	350	50g
142	447	150ml
142	458	100g 
142	326	to serve
143	454	250 Grams
143	111	500 Grams
143	228	Topping
143	529	Topping
143	312	1 Bulb
143	298	1
143	208	3rd
143	515	100 Grams
144	101	1½ kg
144	340	50g
144	539	150g
144	181	1 finely chopped 
144	40	sprigs of fresh
144	512	1
144	327	1 tbls
144	447	150ml
144	264	150ml
144	179	2 medium
144	213	Chopped
145	524	6 large
145	27	3 tbs
145	437	150ml
145	504	200ml
145	353	1 small finely diced
145	181	1 small finely diced
145	267	3 cloves Chopped
145	179	1 large
145	217	1
145	43	1
145	512	1
145	38	1 1/2 tsp 
145	491	2 tbs
145	441	400g
145	257	Handful
145	86	200g
145	40	2
145	296	to serve
146	389	2 cups 
146	340	¼ cup
146	332	2
146	556	1 tsp 
146	178	1 tsp 
146	327	½ cup 
146	447	1 1/2 cups 
147	71	1/2 lb
147	178	1/2 tsp
147	538	1 tsp 
147	249	1 pinch
147	180	1
147	381	3 tbs
147	335	4 tbs
147	283	1 tsp 
147	267	1 tsp 
147	181	3/4 cup 
147	292	1/2 cup 
147	459	3/4 cup 
147	121	1 cup 
147	171	1 cup 
147	492	1 tbs
147	177	1 cup 
147	562	1 tbs
147	529	1/2 tsp
147	511	1 tsp 
147	440	1 tbs
148	140	6 chopped
148	340	150g
148	85	120g
148	337	150g
149	349	300g
149	327	Dusting
149	484	6
149	521	100g 
149	340	85g
149	282	to serve
150	438	225g
150	177	175ml Boiling
150	556	1 tsp
150	365	175g
150	425	1 tsp
150	332	2
150	340	85g
150	478	140g
150	113	2 tbsp
150	447	100ml
150	135	1 scoop
150	462	175g
150	264	225ml
151	181	2 quartered
151	363	4 tbsp
151	267	4 cloves
151	283	Thumb sized peeled and very finely grated
151	21	2 tbsp
151	26	2 tsp
151	255	1
151	136	6 bashed to break shells
151	512	2
151	490	1kg cubed
151	83	150ml
151	294	Garnish chopped 
152	475	12
152	432	½ tbsp
152	42	½ tbsp
152	106	3 sliced thinly
152	514	2 tsp
152	267	4 whole
152	355	Leaves
152	532	Leaves
152	215	½ tsp dissolved in ½ cup warm milk
152	96	2 tbsp
152	419	2 Cups
152	466	½ cup
152	512	½
152	411	1 thin piece
152	163	3
152	136	2
152	490	1 lb
152	245	1 tsp
152	258	1 tbsp
153	27	1½ tbsp
153	539	3 rashers (100g) chopped dry-cured
153	164	12 small
153	398	2 (460g)
153	325	4 (650g)
153	155	2 (280g)
153	267	3 finely chopped
153	79	3 tbsp
153	105	600ml
153	384	150ml
153	491	2 tsp
153	40	3 sprigs
153	420	2 sprigs
153	382	2
153	213	garnish
153	568	250g
153	327	2 tbsp
153	340	1 tsp
154	487	350g
154	267	3 parts 
154	27	3 tbs
154	76	350g
154	561	Small bunch
155	247	2 tsp
155	110	1 tbs
155	464	2 finely chopped
155	279	6
155	530	3 finely chopped
155	569	1 finely chopped 
155	233	1 tsp 
155	294	2 tsp
155	319	1kg
155	249	1 tsp 
155	327	340g
155	178	½ tsp
155	447	90 ml 
155	222	150g
155	473	Beaten
156	46	2 cups
156	426	2 tbs
156	557	1 – 14-ounce can
156	556	1 tsp
156	277	1-⅓ cups
156	444	1-½ cups
157	119	1 large
157	332	2 medium
157	3	pinch
157	556	spinkling
157	335	1 tsp 
157	486	25g
157	373	125g
158	106	2
158	27	1tbsp
158	267	1 clove
158	358	500g
158	171	90g
158	302	1tsp
158	24	400g can
158	316	300ml
158	491	1tbsp
158	120	1tbsp
158	261	350g
158	565	Topping
159	14	1.5 pounds sliced
159	408	1 package thin
159	435	4-6
159	209	3 tablespoons minced
159	267	1.5 tablespoons minced garlic
159	511	¼ cup
159	224	1 tablespoon
159	440	½ tablespoon thick
159	249	½ tablespoon
159	27	3 tablespoons
159	208	Sliced
159	355	Leaves
159	216	Crushed
160	33	500g
160	264	400ml
160	545	3 x 7.5cm
160	7	1 tbsp
160	355	sprigs of fresh
161	27	2 tblsp 
161	181	1 finely sliced
161	292	2 chopped
161	241	500g
161	267	2 cloves minced
161	247	½ tsp
161	283	½ tsp
161	215	¼ tsp
161	411	1 tsp 
161	519	1 tblsp 
161	73	100g 
161	320	1
161	487	1 medium chopped
161	240	Steamed
161	213	Chopped
162	171	30g
162	246	240g
162	209	3
162	267	3 cloves
162	420	3 sprigs
162	47	500g
162	440	2 tblsp 
162	322	125ml 
162	84	350g
162	379	4 tbsp
162	561	1/2 handful 
162	553	to serve
163	559	375g
163	332	2 large
163	462	175g
163	186	100g 
163	556	1 tsp 
163	340	50g
163	31	4 tsp
163	260	50g
164	179	600g
164	434	1 chopped
164	292	1 chopped
164	459	1 chopped
164	125	1 small
164	181	1 Large Chopped
164	190	800g
164	228	1 tbs
164	491	1 tbs
164	27	80 ml 
164	40	Sprinking
164	322	250ml
164	249	Pinch
165	542	8
165	55	3 tbsp
165	327	100g
165	332	2 medium
165	153	1 tbsp grated
165	447	225ml
165	536	200g
166	362	50g
166	172	2 large
166	341	200g
166	233	1 whole
166	186	1kg
166	327	140g
166	379	100g 
166	462	100g 
166	332	3 Large
166	79	2 tbs
166	340	250g
167	254	400g
167	253	1 can 
167	441	1 can 
167	57	1 Packet
168	27	3 tbsp
168	106	2 chopped
168	121	2 sticks
168	292	300g
168	179	500g
168	512	4
168	491	5 tblsp 
168	511	2 tblsp 
168	262	2 tblsp 
168	441	1½ kg
168	204	500g
168	320	3
168	194	400ml
169	179	3 Medium
169	27	1 tbs
169	539	2 strips
169	279	Minced
169	168	1 tbs
169	213	Garnish
169	178	Pinch
169	249	Pinch
169	480	To taste
170	161	4 pounded to 1cm thickness
170	327	2 tablespoons
170	417	1 beaten
170	379	100g fine
170	55	230ml frying
170	363	2 tablespoons
170	106	2 sliced
170	267	5 chopped cloves
170	564	4 teaspoons
170	384	600ml
170	519	2 teaspoons
170	440	4 teaspoons
170	512	1
170	537	1 teaspoon
171	346	650g/1lb 8 oz
171	38	1 tsp
171	27	2 tsp
171	202	juice of half
171	6	4
171	431	150g/6oz
171	414	80g/3oz
171	355	20 chopped
171	99	2 tablespoons
171	178	Pinch
171	249	Pinch
172	29	800g
172	181	1 chopped
172	71	300g
172	178	1 tsp 
172	177	1 Litre
172	279	1
172	27	1/2 cup 
173	14	1lb
173	279	3 chopped
173	283	1 tsp 
173	440	1 tbs
173	538	1 tsp 
173	292	3 finely chopped
173	121	3 finely chopped
173	6	6 chopped
173	122	1 Packet
173	335	Fry
173	177	Bottle
174	27	2 tbs
174	340	25g
174	71	750g
174	327	2 tblsp 
174	267	2 cloves minced
174	106	175g
174	121	150g
174	292	150g
174	442	2 chopped
174	293	200g
174	105	150ml
174	452	500g
174	512	2
174	40	3 tbs
174	213	3 tblsp chopped
174	3	1 tsp 
174	350	60g
174	177	Splash
175	24	4
175	27	2 tbs
175	181	1 Diced
175	569	1 sliced
175	459	1 sliced
175	267	3 Cloves Crushed
175	247	1 tsp 
175	26	1 tsp 
175	178	3/4 teaspoon
175	376	1/2 teaspoon
175	332	4
176	340	25g/1oz
176	296	8 thin slices
176	500	50g/2oz
176	411	2 tsp
176	447	350ml/12fl
176	264	50ml/2fl oz
176	332	2 free-range
176	511	25g/1oz
176	233	grated, to taste
177	340	2 tablespoons
177	27	3 tablespoons
177	309	5 boneless
177	178	1 teaspoon
177	370	1 cut into 1/2-inch cubes
177	134	1 Head chopped
177	171	8-ounce sliced
177	249	1 red
177	181	1 chopped
177	267	3 cloves
177	193	1/2 teaspoon
177	322	1/2 cup
177	447	1/2 cup
177	426	1/2 cup
177	303	1 cup grated
177	142	16 ounces
177	213	chopped
178	406	1 cup 
178	181	1 large
178	292	1 large
178	491	1 tbs
178	247	2 tsp
178	26	1 tsp 
178	355	1/2 tsp
178	40	1/2 tsp
178	175	1/4 tsp
178	193	1/4 tsp
178	329	4 cups 
178	177	1 cup 
178	489	Pinch
179	547	1/4 cup
179	541	2 tbs
179	302	1/2 tbs
179	178	1/4 tsp
179	296	8 slices
179	539	8 slices
179	298	8 slices
179	118	4 slices
179	340	2 1/2 Tbs
180	238	1 cup 
180	511	1/2 cup 
180	417	1
181	391	200g
181	337	100g 
181	63	250g
181	567	400g
181	332	4 large
181	327	140g
181	430	50g
181	373	200g
182	179	2 large
182	340	2 tbs
182	137	150g
182	181	1 large
182	569	1 large
182	131	Pinch
183	128	100 g
183	531	170 g
183	216	100 g
183	332	2
183	62	200 g
183	425	1 tbs
183	289	1 tbs
183	511	150 g
183	178	1 tsp
184	471	100g 
184	362	85g
184	340	85g
184	83	250ml
184	497	750g
184	332	2
184	202	Zest of 1
184	217	Zest of 1
184	519	250ml
184	52	To serve
185	308	1/2 bag
185	524	8 oz 
185	417	1/2 
185	249	pinch
185	538	2 tsp
185	506	2 tbs
185	335	4 tbs
185	297	1 tsp 
185	283	1 tsp 
185	181	1/2 cup 
185	256	1 cup 
185	6	1/2 cup 
185	492	1 tbs
185	562	1 tbs
185	511	1/2 tbs
185	501	1/2 tbs
185	440	1 tbs
186	423	8
186	27	2 tbs
186	267	3 cloves
186	26	1 tbs
186	202	1/2 
186	420	4 sprigs
186	390	1
187	368	450g
187	10	100g 
187	538	1/2 tbs
187	314	1 1/2 tsp 
187	197	1/2 tsp
187	249	1 tbs
187	178	1/2 tsp
187	461	1/2 tsp
187	440	1 tbs
187	177	400ml
187	27	2 tbs
187	509	2 chopped
187	6	4
187	267	2 cloves chopped
187	283	4 sliced
187	506	1 tbs
188	179	5
188	292	12 ounces
188	509	1
188	267	2 cloves
188	296	1 Slice
188	550	1
188	440	2
188	393	1
188	55	1 tsp 
188	511	2 tsp
188	340	2 tbsp
189	531	1 cup 
189	178	1/4 tsp
189	417	1 Yolk
189	340	5 tbs
189	181	1/3 cup
189	293	1/2 cup 
189	396	1/2 lb
189	332	2 Beaten 
189	249	1/4 tsp
190	327	4 cups 
190	178	1 tsp 
190	564	1 tsp 
190	340	250g
190	177	1 cup 
190	10	900g
190	480	1 tsp 
190	175	1/2 tsp
190	55	2 tbs
190	106	1 cup 
190	569	Ground
190	267	2 tsp ground
190	40	1 tbs
190	366	2 tbs
190	417	1 beaten
191	396	1
191	178	3 tbs
191	175	3 tbs
191	294	1 tbs
191	511	1 tbs
191	512	1 tsp 
191	163	1 tsp 
191	26	1 tbs
191	267	1 tbs
191	181	1 tbs
191	39	1 tbs
191	191	1 tsp 
191	223	1 tbs
191	193	1 tsp 
192	450	2 Pounds
192	55	1/2 cup 
192	267	1 clove peeled crushed
192	283	1/2 tsp
192	40	2 sprigs
192	512	1
192	569	0.5
192	32	0.5
192	181	1 sliced
192	292	1 chopped
192	511	1 tbs
192	480	1/2 tsp
192	120	1 tsp 
192	19	1
192	182	1
192	210	3/4 cup 
192	249	pinch
193	357	White
193	181	1
193	182	1
193	279	3
193	208	1
193	292	3 oz 
193	393	1 lb
193	440	2 oz 
194	27	2 tablespoons
194	292	2 small cut into chunks
194	121	2 small stalks
194	181	1 medium finely diced
194	267	6 medium cloves sliced
194	520	12 ounces (340g)
194	382	2
194	177	4 cups
194	178	Pinch
194	274	2 teaspoons (10ml)
194	249	Pinch
194	268	2 large
194	420	4 sprigs
194	99	1/4 cup 
194	213	2 tablespoons
195	542	4
195	539	4
195	171	4
195	24	3
195	290	2 sliced
195	332	2
195	296	1 Slice
195	82	100g 
196	133	2 Juice
196	26	4 tsp
196	464	2 finely chopped
196	325	16 skinnless
196	55	For brushing
196	83	300ml 
196	283	large piece
196	279	4
196	537	¾ tsp
196	218	¾ tsp
196	448	½ tsp
196	243	¼ tsp
197	23	200 g
197	348	250 g
197	386	1  bunch
197	183	350 g
197	95	3  tablespoons
197	149	40 g
197	87	200 g
197	178	to taste
197	249	to taste
198	45	50g
198	340	125g
198	521	150g
198	202	Grated
198	327	150g
198	3	½ tsp
198	511	75g
198	289	1 tbs
198	264	300ml 
198	212	100ml
198	355	Garnish with
199	526	4 meaty shanks
199	531	½ cup
199	27	2 tablespoons 
199	340	3 tablespoons
199	181	1 medium chopped into ½-inch pieces
199	121	1 chopped into ½-inch pieces
199	353	1 bulb chopped into ½-inch pieces
199	267	3 cloves
199	207	2 strips
199	404	1 ½ teaspoons
199	512	1
199	437	1 cup
199	384	½ cup 
199	24	1 cup chopped with juice
199	213	2 tablespoons chopped
199	418	1 teaspoon grated 
200	71	900g
200	27	3 tbs
200	164	3
200	267	2 cloves minced
200	539	125g
200	40	1 tbs chopped
200	512	2
200	174	330ml
200	452	400ml
200	173	2 tbs
200	147	8
200	327	400g
200	178	pinch
200	340	250g
200	332	To Glaze
201	309	1 whole
201	335	2 quarts neutral frying
201	180	1
201	531	1 1/2 cups 
201	389	1 tablespoon
201	178	1 tablespoon
201	26	1 tablespoon
201	311	2 teaspoons
201	376	1 teaspoon
201	175	1 teaspoon
201	223	1/2 teaspoon
201	561	1/2 teaspoon
201	550	1/2 teaspoon
201	480	1/2 teaspoon
201	284	1/2 teaspoon
201	160	1/2 teaspoon
201	404	1/2 teaspoon
202	283	1 tablespoon
202	267	1 clove
202	440	2 tablespoons
202	15	1 tablespoon
202	304	2 teaspoon
202	446	1/3 cup
202	55	1/3 cup
202	202	1/3 cup
203	181	1 sliced
203	27	4 tbsp
203	340	25g
203	179	400g
203	267	6 cloves
203	332	8
203	213	Handful
203	112	1
203	388	4
204	513	14 oz jar
204	328	3 Cups
204	546	6
204	155	2
205	261	300g
205	27	1 tbls
205	181	1 finely chopped 
205	267	2 cloves minced
205	390	1
205	491	1 tbls
205	231	425g
205	516	70g
205	565	Shaved
206	173	1 tsp 
206	217	Juice of 2
206	521	2 tbs
206	445	6
206	145	250g
206	365	200g
206	340	50g
206	462	100g 
206	411	1 tsp 
206	447	6 tblsp
207	4	300g
207	382	2
207	447	300ml 
207	332	4
207	213	Handful
207	294	Handful
207	55	2 tbs
207	181	1 chopped
207	564	2 tsp
207	357	300g
208	93	2 tbsp
208	16	1 tsp
208	86	4 fillets
208	55	1 tsp
208	387	8
208	206	1 sliced
208	235	2 shredded
208	488	1 x 300ml
208	547	1 pot
208	202	1
208	267	1 clove finely chopped
209	27	1 tblsp 
209	181	1 large
209	267	1 clove peeled crushed
209	120	2 tblsp 
209	491	3 tsp
209	372	500g
209	332	1 large
209	379	85g
209	18	2 tblsp 
209	107	800g
209	213	2 tblsp 
210	531	100g 
210	332	2 large
210	447	300ml 
210	363	1 tbls
210	511	to serve
210	373	to serve
210	145	to serve
211	390	1 large
211	283	0.5
211	267	1 large
211	294	Bunch
211	363	1 tbsp
211	155	4
211	238	5 tblsp 
211	384	150ml
211	83	200g
212	179	1kg
212	447	200ml
212	340	50g
212	345	2 tbs
212	6	Bunch
213	261	320g
213	473	6
213	178	As required
213	539	150g
213	169	50g
213	175	As required
214	248	1 1/4 oz 
214	511	1 1/4 cup
214	556	1 teaspoon
214	531	To your taste
214	349	2
214	33	To your taste
214	373	To your taste
214	299	To your taste
215	155	2
215	292	12 ounces
215	346	5
215	181	1
215	452	1
215	118	1 1/2 cup 
215	547	2 tbsp
215	340	 
215	511	 
215	55	 
215	178	 
215	249	 
216	340	Knob
216	198	2
216	539	4
216	179	2
216	292	1
216	293	1/2 
216	2	1/2 
216	512	1
216	336	100ml
216	384	100g 
217	214	500g
217	27	3 tablespoons
217	541	1
217	552	pinch
217	322	250ml
217	441	1 (400g) tin
217	297	1/2 teaspoon
217	251	1 (200g) pack
218	179	4 large
218	6	1  bunch
218	327	100g 
218	180	1
218	447	150ml
218	425	1 tsp 
218	340	3 tbs
218	55	2 tbs
218	536	6
218	539	12
218	417	6
219	531	2 cups 
219	511	1/3 cup
219	3	3 tsp
219	178	½ tsp
219	417	1 beaten
219	447	¾ cup
219	335	3 tbs
219	455	garnish
220	396	2
220	296	2
220	312	1
220	298	1
220	156	100g 
220	118	100g 
220	539	100g 
220	417	1
220	181	1
220	249	1
221	171	1/3 cup
221	200	1/3 cup
221	368	2/3 Cup
221	14	1/2 cup 
221	384	2-1/2 cups
221	178	1/2 tsp
221	511	1/4 tsp
221	538	1 tsp 
221	249	1/4 tsp
221	529	1/2 tsp
221	501	1-½ cups
221	440	1 tsp 
221	506	1 tbs
221	177	2 tbs
221	6	1/4 cup
222	531	1 cup 
222	332	2
222	447	1 cup 
222	177	3/4 cup 
222	178	Pinch
222	511	1 tsp 
222	340	3 tbs
223	171	150g
223	377	50g
223	55	4 tbs
223	181	40g
223	267	2 cloves
223	512	1
223	320	1tbsp
223	547	50 ml 
223	148	Dash
223	213	Top
224	309	1.5kg
224	390	3 chopped
224	267	2 cloves
224	283	1 tsp 
224	302	1 tsp 
224	294	1 tsp 
224	26	1 tsp 
224	139	2 tbs
224	335	2 tbs
224	464	1 sliced
224	292	2
224	439	1
224	2	4 leaves
224	300	2 tbs
224	83	2 tbs
224	42	1 tsp 
225	179	2
225	30	1
225	267	2 cloves
225	202	1
225	14	2
225	361	1
225	384	1
225	55	1 tbsp
225	511	1 1/2 tsp 
225	340	2 tbsp
226	10	1/4 lb
226	181	1
226	332	3
226	465	1 tbs
226	112	1/2 
226	178	To taste
226	249	To taste
226	300	Top
227	340	50g
227	181	1 chopped
227	136	3 Pods
227	243	1/4 tsp
227	255	1 small
227	512	Sprigs of fresh
227	419	450g
227	384	1 Litre
227	4	750g
227	332	3
227	213	3 tblsp chopped
227	202	1 chopped
228	71	1/2 lb
228	178	pinch
228	249	pinch
228	538	2 tsp
228	417	1/2 
228	381	3 tbs
228	335	5 tbs
228	28	1/4 lb
228	181	1/2 cup 
228	297	1 tsp 
228	283	1 tsp 
228	256	1 cup 
228	171	1 cup 
228	177	1 cup 
228	562	1 tbs
228	511	1 tsp 
228	440	1 tsp 
229	384	3 cups 
229	178	1/4 tsp
229	511	1/4 tsp
229	249	pinch
229	538	1 tsp 
229	528	1/3 cup
229	171	1/3 cup
229	506	1 tbs
229	177	2 tbs
229	6	1/4 cup
230	267	1 clove
230	313	2 small
230	27	2 tbs
230	501	1 tbs
230	213	Leaves
230	307	2
230	431	2 handfulls
230	295	Small bunch
230	17	1
230	6	2 chopped
230	521	1/2 tsp
231	574	400g
231	27	1 tblsp 
231	26	pinch
231	24	2 small cut chunks
231	464	1 finely sliced
231	139	2 tsp
231	206	1
231	182	Juice of 1
231	547	100g 
231	38	2 tsp
231	546	4
231	294	to serve
232	308	6oz/180g
232	227	2 tbsp
232	562	2 tbsp
232	440	2 tsp
232	262	2 tsp
232	511	2 tsp
232	177	2 tbsp
232	380	2 tbsp
232	267	2 cloves
232	309	1 cup
232	417	1
232	360	4 cups
233	24	4 large
233	511	Pinch
233	27	4 tbs
233	181	1 chopped
233	279	2 finely chopped
233	490	200g
233	411	1 tbs
233	491	2 tbs chopped
233	357	50g
233	384	100ml
233	39	4 tbs
233	211	2 tbs
233	355	1 tbs
234	340	50g
234	181	1 chopped
234	171	100g 
234	327	40g
234	494	1
234	233	pinch
234	495	pinch
234	309	250g
234	566	2 Handfuls
234	179	2 large
235	288	4 tbsp
235	14	350g
235	181	1 large
235	267	10
235	292	1 thinly sliced
235	422	1 tsp 
235	139	2 tblsp 
235	329	600ml
235	491	1 tblsp 
235	420	2 sticks
235	213	Handful
235	167	400g
235	379	2 tblsp 
235	335	drizzle
235	296	to serve
235	134	to serve
236	154	450g
236	27	4 tbs
236	181	1 large
236	353	1 large
236	292	2 chopped
236	437	150ml
236	79	1 tbs
236	441	400g
236	504	1L
236	26	2 pinches
236	264	150ml
236	524	8
237	327	2 tbs
237	455	2 tbs
237	349	375g
237	521	250g
237	418	2 strips
237	411	1 Stick
237	332	2
237	473	4
237	173	50g
237	194	500ml
237	533	Pod of
238	327	375g
238	521	50g
238	543	7g
238	447	75g
238	332	3 Large
238	340	180g
238	232	250g
238	333	8 slices
239	198	4
239	531	100g 
239	332	2 Beaten 
239	379	100g 
239	55	Fry
239	366	2 tbs
239	120	2 tbs
239	562	1 tbs
239	521	2 tblsp 
240	325	6
240	209	16
240	283	1 1/2 
240	279	6
240	16	8
240	243	2 tbs
240	247	1 1/2 
240	294	1 1/2 
240	353	1 1/2 
240	132	2 tbs
240	152	1 can 
240	511	1 tsp 
240	177	1 cup 
241	340	50g
241	565	25g
241	447	300ml 
241	382	2
241	327	5 tbs
241	191	½ tsp
241	16	Pod of
241	11	140g
241	332	3
241	371	8 slices
241	264	150ml
241	496	to serve
242	357	400g
242	152	150ml
242	177	100ml
242	178	1 tsp 
242	173	5 tbs
242	531	3 tbs
242	332	3
242	67	200ml
242	511	140g
243	33	300g
243	299	250g
243	270	100g 
243	373	500g
243	521	175g
243	296	7 Slices
244	524	400g
244	440	2 tbs
244	491	1 tsp 
244	173	1 tsp 
244	521	1 tsp 
244	363	1 tsp 
244	216	85g
244	465	3 Large
244	389	1 tbs
244	279	6 cloves
244	189	450g
244	283	to taste
245	340	100g 
245	531	150g
245	452	700ml
245	181	30g
245	213	1 tbs
245	71	400g
245	178	Pinch
245	249	Pinch
245	233	Pinch
245	332	2 Beaten 
245	379	50g
246	531	450g
246	521	55g
246	543	2 parts 
246	178	1/2 tsp
246	447	6 oz 
246	332	2 Beaten 
246	340	30g
246	260	140g
246	389	85g
246	411	1 tsp 
246	455	To Glaze
247	349	300g
247	180	Beaten
247	473	Beaten
247	55	2 tbs
247	71	70 ml 
247	428	200g
247	106	2 chopped
247	327	30g
247	452	85 ml 
247	178	pinch
247	249	pinch
247	120	Dash
248	179	800g
248	106	3
248	27	2 tblsp
248	384	100ml
248	282	1 pot
248	565	Topping
248	155	4
248	539	4
248	496	Topping
248	528	Topping
249	470	1 cups
249	181	1
249	361	1 small
249	294	sprinking
249	496	150g
249	84	10
249	485	35g
249	531	4 tablespoons
249	421	300ml
249	345	1.5 teaspoons
249	501	1 teaspoon
250	471	250g
250	403	75g
250	340	135g
250	248	450g
250	556	1tsp
250	455	100g 
250	242	150g
250	489	1tsp
250	264	300ml 
250	234	drizzle
250	457	Top
251	27	1 tbls
251	416	4
251	106	2 finely chopped
251	267	2 cloves minced
251	411	2 tsp ground
251	327	2 tsp
251	105	250ml
251	441	800g
251	494	1
251	420	3 sprigs
251	382	2
251	511	1 tsp 
251	447	2 tbs
251	151	600g
251	303	Grated
252	176	500g
252	384	2 cups
252	426	1/2 cup
252	89	1 packet
252	178	1 tsp
252	161	3 diced
252	27	2 tbsp
252	181	1 small finely diced
252	569	2 finely diced
252	267	2 cloves minced
252	351	1 cup
252	213	garnish chopped
253	119	1
253	301	3 tbsp
253	206	1
253	519	2 tblsp 
253	289	1 tsp 
253	533	1 tsp 
253	177	2 tbsp
253	489	pinch
254	362	100g 
254	340	180g
254	462	180g
254	217	Zest of 1
254	103	3 tbs
254	327	225g
254	3	1 tsp 
254	332	3 Large
254	334	100g 
254	447	2 tbs
254	92	500g
254	65	100g 
254	521	2 tsp
255	384	450ml
255	161	3
255	340	75g
255	442	2 sliced
255	267	2 cloves minced
255	327	50g
255	447	200ml
255	322	3 tbs
255	264	150ml
255	156	150g
255	489	spinkling
255	249	pinch
255	230	1
255	36	1 tbls
256	27	1 tblsp 
256	539	2
256	181	1 finely chopped 
256	121	1 Stick
256	292	1 medium
256	267	2 cloves chopped
256	10	500g
256	491	1 tbls
256	441	800g
256	519	1 tblsp 
256	84	500g
256	282	400ml
256	23	125g
256	303	50g
256	295	Topping
257	161	1 1/2 
257	327	3/4 cup 
257	417	1
257	381	2 tbs
257	3	1 tbs
257	178	1 tsp 
257	311	1/2 tsp
257	550	1/4 tsp
257	177	3/4 cup 
257	384	1/2 cup 
257	354	1/4 cup
257	440	3 tbs
257	519	2 tbs
257	115	1 tbs
257	538	2 tbs
257	323	1/2 tbs
257	267	1 clove
257	6	2 chopped
257	283	1 tsp 
258	125	2 large
258	434	4
258	32	2
258	298	4 large
258	27	5 tbs
258	160	Bunch
258	181	1 medium
258	279	3 finely chopped
258	139	1 tsp 
258	511	1 tsp 
259	179	1.5kg
259	512	2 leaves
259	164	2
259	340	3 tbs
259	229	750g
259	542	2
259	447	500ml
259	233	Grated
259	178	Pinch
259	249	Pinch
260	427	1 lb
260	426	1/2 cup 
260	340	1/2 cup 
260	565	1/2 cup 
260	213	2 tbsp
260	175	 
261	179	4 cups 
261	340	60ml
261	447	½ cup 
261	10	450g
261	181	1 finely chopped 
261	385	500ml
261	26	to taste
261	213	to taste
261	178	Dash
261	249	Dash
262	340	2 tbs
262	106	2 chopped
262	384	4 qt 
262	161	1.5kg
262	179	4kg
262	178	2 tbs
262	175	1tbsp
263	539	2 sliced
263	369	1 lb
263	14	1 lb
263	531	1/4 cup
263	267	3 chopped
263	181	1 Diced
263	171	1 1/2 cup 
263	2	4 cups 
263	49	1 Jar
263	105	1/4 cup
263	512	1
263	160	1 tsp 
263	404	1 tsp 
263	26	1 tbs
263	78	1/8 teaspoon
263	529	1 dash
263	452	5 Cups
263	491	2 tbs
263	184	1 cup 
263	120	1 dash
264	216	50g
264	465	15g
264	524	10g
264	335	5 tbs
264	177	750 ml 
264	132	1/2 tbs
264	179	250g
264	464	2
264	279	4
264	2	30g
264	360	30g
264	368	1
264	440	1 tbs
264	28	4
264	417	1
265	161	1
265	507	1/4 cup
265	417	1
265	447	1/4 cup
265	531	1/2 cup 
265	455	1 tbs
265	26	1/2 tsp
265	178	1/2 tsp
265	175	1/4 tsp
265	550	1/4 tsp
265	223	1/4 tsp
265	16	1/2 tsp
265	27	1 cup 
265	50	1
266	340	200g
266	462	200g
266	327	200g
266	332	4 Beaten
266	334	50g
266	129	100ml
266	341	85g
266	65	85g
266	186	250g
266	467	250g
266	486	100g 
266	202	Grated zest of 1
266	195	1 ½ tbsp
266	54	1 ½ tbsp
266	556	1/2 tsp
266	3	1/2 tsp
267	152	2 cups 
267	177	2 cups 
267	397	1/4 tsp
267	283	1
267	512	1
267	357	2 cups 
267	332	4
267	208	1
267	216	1 cup 
267	482	4 oz 
267	55	2 tbs
267	181	1
267	267	3 cloves
267	164	3
267	448	2 tsp
267	511	3 tbs
267	132	1/3 cup
268	107	2 cans
268	55	3 tbs
268	24	2 cups 
268	209	5
268	267	2 cloves
268	213	Pinch
268	555	1/2 kg chopped 
269	27	1 tbsp
269	402	2 ½ tbsp
269	320	1
269	152	400ml can
269	224	2 tsp
269	187	100g
269	182	2 juice of 1, the other halved
269	192	150g
269	294	½ small pack
270	365	250g
270	178	pinch
270	350	125g
270	467	175g
270	521	80g
270	202	Zest of 1
270	217	Zest of 1
270	447	150ml
270	326	to serve
271	155	4 - 6
271	74	1 bottle
271	247	1½ tablespoon
271	108	1 tablespoon
271	267	1 teaspoon
271	226	1 can
271	239	12
271	219	2 cups
271	305	Halved
271	17	Sliced and Seeded
271	206	Peeled and Sliced
271	237	2 tablespoons
271	547	3 tablespoons
271	447	1 tablespoon
272	267	2 cloves
272	489	2 tsp
272	27	4 tbs
272	202	Zest and juice of 1
272	39	1 tbs
272	241	750g
272	185	To serve
273	325	1 kg
273	294	1 tbs
273	247	1 tbs
273	136	1 tbs
273	16	1 tsp 
273	26	2 tsp
273	289	2 tbs
273	27	3 tbs
273	83	1 cup 
273	279	1
273	312	Sliced
273	298	Sliced
273	185	6
274	71	500g
274	125	1 large
274	83	150g
274	417	1 beaten
274	565	3 tbs
274	298	400g
274	491	4 tbs
274	179	350g
275	71	1lb
275	181	1
275	494	1
275	24	2
275	279	4
275	491	1 tbs
275	357	2 cups 
275	28	1/4 cup
275	340	1/4 cup
275	27	2 cups 
275	185	1
275	247	1 tbs
275	148	3 tbs
275	178	To taste
275	249	To taste
276	396	3 Lbs
276	346	10
276	292	5
276	2	1 head
277	398	4 Chopped
277	106	2 large
277	292	5 chopped
277	442	1 chopped
277	121	1 small
277	2	1/4 
277	163	1 whole
277	480	1tsp
277	512	2
277	213	4 sprigs
277	39	4 sprigs
277	249	1 tsp 
277	178	1 tbs
278	340	175g
278	521	175g
278	332	3
278	365	250g
278	447	3 tbs
278	202	Zest of 1
278	318	To Glaze
279	531	350g
279	178	1 tsp 
279	511	2 tbs
279	340	1 cup 
279	177	1/2 cup 
279	331	450g
279	33	450g
279	506	3 tbs
279	411	1/4 tsp
279	289	1 tsp 
279	62	2 tbs
279	447	2 tbs
280	527	2 cups 
280	213	1/3 cup
280	27	Dash
280	133	3
280	279	4
280	247	Sprinking
281	332	10
281	27	1 tbs
281	434	2 finely chopped
281	6	3 finely chopped
281	569	4
281	279	1 clove peeled crushed
281	390	1
281	248	300g
281	447	6 tblsp
281	560	4 tbs
281	160	2 tbs
281	431	to serve
281	565	to serve
282	110	1 tbs
282	442	2 finely chopped
282	434	1 large
282	329	1L
282	107	400g
282	344	200g
282	24	3 chopped
282	279	3 chopped
282	160	Small pack
282	565	40g
283	217	1 large
283	521	300g
283	27	75 ml 
283	531	280g
283	3	1 tbs
283	332	4 large
283	556	2 tsp
284	10	500g
284	259	250g
284	181	1
284	267	4 cloves
284	213	3 tblsp chopped
284	26	1 tbs
284	3	3/4 teaspoon
284	379	2 tbs
284	177	3 tbs
284	320	1
284	178	1 tsp 
284	249	1 tsp 
285	179	225g
285	353	1 small
285	267	1 clove finely chopped
285	447	75 ml 
285	264	100ml
285	340	For Greasing
285	303	to serve
\.


--
-- Data for Name: testimonials; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.testimonials (id, user_id, testimonial) FROM stdin;
1	1	Foodies has transformed my cooking experience! With its diverse recipe collection and user-friendly interface, I can easily find, save, and cook delicious meals for any occasion. From quick dinners to elaborate feasts, this app has become my go-to kitchen companion. Highly recommended!
2	2	Foodies is a must-have for any home cook! With its extensive recipe collection and easy-to-use interface, I've discovered new culinary delights and streamlined my meal planning. Cooking has never been this enjoyable!
3	3	Thank you for the wonderful recipe for feta pasta with tomatoes and basil. It turned out to be not only tasty, but also incredibly colorful. This has become a favorite family meal!
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.users (id, email, name, password, avatar, token, "createdAt", "updatedAt") FROM stdin;
1	goit@gmail.com	GoIT	empty	https://www.gravatar.com/avatar	\N	2025-07-09 17:36:37.624+00	2025-07-09 17:36:37.624+00
2	user@gmail.com	Foodies user	empty	https://www.gravatar.com/avatar	\N	2025-07-09 17:36:37.624+00	2025-07-09 17:36:37.624+00
3	larry@gmail.com	Larry Pageim	empty	https://www.gravatar.com/avatar	\N	2025-07-09 17:36:37.624+00	2025-07-09 17:36:37.624+00
\.


--
-- Data for Name: users_follows; Type: TABLE DATA; Schema: public; Owner: backend
--

COPY public.users_follows (follower_user_id, followee_user_id) FROM stdin;
\.


--
-- Name: areas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.areas_id_seq', 27, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.categories_id_seq', 15, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 574, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.recipes_id_seq', 285, true);


--
-- Name: testimonials_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.testimonials_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: backend
--

SELECT pg_catalog.setval('public.users_id_seq', 3, true);


--
-- Name: areas areas_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.areas
    ADD CONSTRAINT areas_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: recipes_ingredients recipes_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.recipes_ingredients
    ADD CONSTRAINT recipes_ingredients_pkey PRIMARY KEY (recipe_id, ingredient_id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: testimonials testimonials_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_email_key1; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- Name: users_follows users_follows_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_follows
    ADD CONSTRAINT users_follows_pkey PRIMARY KEY (follower_user_id, followee_user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_area_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_area_id_fkey FOREIGN KEY (area_id) REFERENCES public.areas(id);


--
-- Name: recipes recipes_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: recipes_ingredients recipes_ingredients_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.recipes_ingredients
    ADD CONSTRAINT recipes_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id);


--
-- Name: recipes_ingredients recipes_ingredients_recipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.recipes_ingredients
    ADD CONSTRAINT recipes_ingredients_recipe_id_fkey FOREIGN KEY (recipe_id) REFERENCES public.recipes(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: recipes recipes_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: testimonials testimonials_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.testimonials
    ADD CONSTRAINT testimonials_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_follows users_follows_followee_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_follows
    ADD CONSTRAINT users_follows_followee_user_id_fkey FOREIGN KEY (followee_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users_follows users_follows_follower_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: backend
--

ALTER TABLE ONLY public.users_follows
    ADD CONSTRAINT users_follows_follower_user_id_fkey FOREIGN KEY (follower_user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

