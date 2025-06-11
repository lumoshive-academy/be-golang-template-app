--
-- PostgreSQL database dump
--

-- Dumped from database version 16.9
-- Dumped by pg_dump version 16.9

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
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100) NOT NULL,
    phone character varying(20),
    email character varying(100),
    photo text,
    status_login boolean DEFAULT false
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100) NOT NULL,
    provice_id integer
);


ALTER TABLE public.city OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.city_id_seq OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100) NOT NULL,
    phone character varying(20),
    email character varying(100),
    photo text,
    status_login boolean DEFAULT false
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_id_seq OWNER TO postgres;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100) NOT NULL,
    phone character varying(20),
    email character varying(100),
    photo text,
    status_login boolean DEFAULT false
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- Name: drivers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drivers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drivers_id_seq OWNER TO postgres;

--
-- Name: drivers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drivers_id_seq OWNED BY public.drivers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    customer_id integer,
    driver_id integer,
    city_id integer,
    provice_id integer,
    datetime_order timestamp without time zone NOT NULL,
    status character varying(50),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    deleted_at timestamp without time zone,
    name character varying(100) NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.provinces_id_seq OWNER TO postgres;

--
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: city id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: drivers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers ALTER COLUMN id SET DEFAULT nextval('public.drivers_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, created_at, updated_at, deleted_at, name, phone, email, photo, status_login) FROM stdin;
1	2025-06-10 21:15:20.323702	\N	\N	Admin 1	0833111111	admin1@admin.com	\N	t
2	2025-06-10 21:15:20.323702	\N	\N	Admin 2	0833111112	admin2@admin.com	\N	f
\.


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (id, created_at, updated_at, deleted_at, name, provice_id) FROM stdin;
1	2025-06-10 21:15:08.242785	\N	\N	Jakarta Pusat	1
2	2025-06-10 21:15:08.242785	\N	\N	Jakarta Selatan	1
3	2025-06-10 21:15:08.242785	\N	\N	Bandung	2
4	2025-06-10 21:15:08.242785	\N	\N	Bekasi	2
5	2025-06-10 21:15:08.242785	\N	\N	Semarang	3
6	2025-06-10 21:15:08.242785	\N	\N	Solo	3
7	2025-06-10 21:15:08.242785	\N	\N	Yogyakarta	4
8	2025-06-10 21:15:08.242785	\N	\N	Sleman	4
9	2025-06-10 21:15:08.242785	\N	\N	Surabaya	5
10	2025-06-10 21:15:08.242785	\N	\N	Malang	5
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id, created_at, updated_at, deleted_at, name, phone, email, photo, status_login) FROM stdin;
1	2025-06-10 21:14:56.087969	\N	\N	Budi	0811111111	budi@mail.com	\N	t
2	2025-06-10 21:14:56.087969	\N	\N	Siti	0811111112	siti@mail.com	\N	f
3	2025-06-10 21:14:56.087969	\N	\N	Agus	0811111113	agus@mail.com	\N	t
4	2025-06-10 21:14:56.087969	\N	\N	Dewi	0811111114	dewi@mail.com	\N	f
5	2025-06-10 21:14:56.087969	\N	\N	Rudi	0811111115	rudi@mail.com	\N	t
6	2025-06-10 21:14:56.087969	\N	\N	Ayu	0811111116	ayu@mail.com	\N	t
7	2025-06-10 21:14:56.087969	\N	\N	Joko	0811111117	joko@mail.com	\N	f
8	2025-06-10 21:14:56.087969	\N	\N	Lia	0811111118	lia@mail.com	\N	t
9	2025-06-10 21:14:56.087969	\N	\N	Tono	0811111119	tono@mail.com	\N	f
10	2025-06-10 21:14:56.087969	\N	\N	Nina	0811111120	nina@mail.com	\N	t
\.


--
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drivers (id, created_at, updated_at, deleted_at, name, phone, email, photo, status_login) FROM stdin;
1	2025-06-10 21:15:15.118052	\N	\N	Driver A	0822111111	a@driver.com	\N	t
2	2025-06-10 21:15:15.118052	\N	\N	Driver B	0822111112	b@driver.com	\N	f
3	2025-06-10 21:15:15.118052	\N	\N	Driver C	0822111113	c@driver.com	\N	t
4	2025-06-10 21:15:15.118052	\N	\N	Driver D	0822111114	d@driver.com	\N	f
5	2025-06-10 21:15:15.118052	\N	\N	Driver E	0822111115	e@driver.com	\N	t
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, customer_id, driver_id, city_id, provice_id, datetime_order, status, created_at, updated_at, deleted_at) FROM stdin;
1	1	1	1	1	2025-01-05 08:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
2	2	2	2	1	2025-01-10 09:30:00	completed	2025-06-10 21:15:26.512349	\N	\N
3	3	3	3	2	2025-01-15 14:45:00	cancelled	2025-06-10 21:15:26.512349	\N	\N
4	4	4	4	2	2025-01-20 12:15:00	completed	2025-06-10 21:15:26.512349	\N	\N
5	5	5	5	3	2025-01-25 17:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
6	6	1	6	3	2025-02-03 10:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
7	7	2	7	4	2025-02-08 08:15:00	completed	2025-06-10 21:15:26.512349	\N	\N
8	8	3	8	4	2025-02-13 09:45:00	completed	2025-06-10 21:15:26.512349	\N	\N
9	9	4	9	5	2025-02-18 13:30:00	cancelled	2025-06-10 21:15:26.512349	\N	\N
10	10	5	10	5	2025-02-22 16:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
11	1	1	1	1	2025-03-01 07:30:00	completed	2025-06-10 21:15:26.512349	\N	\N
12	2	2	2	1	2025-03-06 11:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
13	3	3	3	2	2025-03-11 13:45:00	completed	2025-06-10 21:15:26.512349	\N	\N
14	4	4	4	2	2025-03-16 09:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
15	5	5	5	3	2025-03-21 17:30:00	completed	2025-06-10 21:15:26.512349	\N	\N
16	6	1	6	3	2025-04-02 07:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
17	7	2	7	4	2025-04-07 10:30:00	completed	2025-06-10 21:15:26.512349	\N	\N
18	8	3	8	4	2025-04-12 14:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
19	9	4	9	5	2025-04-17 15:15:00	completed	2025-06-10 21:15:26.512349	\N	\N
20	10	5	10	5	2025-04-22 16:45:00	completed	2025-06-10 21:15:26.512349	\N	\N
21	1	1	1	1	2025-05-03 06:30:00	completed	2025-06-10 21:15:26.512349	\N	\N
22	2	2	2	1	2025-05-08 09:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
23	3	3	3	2	2025-05-13 11:45:00	cancelled	2025-06-10 21:15:26.512349	\N	\N
24	4	4	4	2	2025-05-18 14:30:00	completed	2025-06-10 21:15:26.512349	\N	\N
25	5	5	5	3	2025-05-23 18:00:00	completed	2025-06-10 21:15:26.512349	\N	\N
\.


--
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (id, created_at, updated_at, deleted_at, name) FROM stdin;
1	2025-06-10 21:15:02.81532	\N	\N	DKI Jakarta
2	2025-06-10 21:15:02.81532	\N	\N	Jawa Barat
3	2025-06-10 21:15:02.81532	\N	\N	Jawa Tengah
4	2025-06-10 21:15:02.81532	\N	\N	DI Yogyakarta
5	2025-06-10 21:15:02.81532	\N	\N	Jawa Timur
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 2, true);


--
-- Name: city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_id_seq', 10, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_seq', 10, true);


--
-- Name: drivers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drivers_id_seq', 5, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 25, true);


--
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 5, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- Name: city city_provice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_provice_id_fkey FOREIGN KEY (provice_id) REFERENCES public.provinces(id);


--
-- Name: orders orders_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.city(id);


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: orders orders_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.drivers(id);


--
-- Name: orders orders_provice_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_provice_id_fkey FOREIGN KEY (provice_id) REFERENCES public.provinces(id);


--
-- PostgreSQL database dump complete
--

