--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: booking; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.booking (
    booking_id bigint NOT NULL,
    booking_date timestamp without time zone NOT NULL,
    is_canceled boolean,
    is_confirmed boolean NOT NULL,
    total_price integer NOT NULL,
    tourist_amount integer NOT NULL,
    excursion_id bigint NOT NULL,
    tourist_id bigint NOT NULL
);


ALTER TABLE public.booking OWNER TO "tetiana.chernova";

--
-- Name: excursion; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.excursion (
    excursion_id bigint NOT NULL,
    amount integer NOT NULL,
    city character varying(255) NOT NULL,
    description character varying(2048) NOT NULL,
    duration integer NOT NULL,
    filename character varying(255),
    meeting_point character varying(255) NOT NULL,
    price_for_one integer NOT NULL,
    title character varying(255) NOT NULL,
    guide_id bigint NOT NULL
);


ALTER TABLE public.excursion OWNER TO "tetiana.chernova";

--
-- Name: guide; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.guide (
    guide_id bigint NOT NULL,
    birth_date timestamp without time zone NOT NULL,
    city character varying(255) NOT NULL,
    description character varying(2048) NOT NULL,
    email character varying(255) NOT NULL,
    experience integer NOT NULL,
    filename character varying(255),
    first_name character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    nationality character varying(255) NOT NULL,
    phone character varying(255) NOT NULL
);


ALTER TABLE public.guide OWNER TO "tetiana.chernova";

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: tetiana.chernova
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO "tetiana.chernova";

--
-- Name: tourist; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.tourist (
    tourist_id bigint NOT NULL,
    city character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    filename character varying(255),
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    nationality character varying(255) NOT NULL,
    phone character varying(255) NOT NULL
);


ALTER TABLE public.tourist OWNER TO "tetiana.chernova";

--
-- Name: usr; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.usr (
    email character varying(255) NOT NULL,
    activation_code character varying(255),
    active boolean NOT NULL,
    password character varying(255) NOT NULL,
    role character varying(255) NOT NULL
);


ALTER TABLE public.usr OWNER TO "tetiana.chernova";

--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--

COPY public.booking (booking_id, booking_date, is_canceled, is_confirmed, total_price, tourist_amount, excursion_id, tourist_id) FROM stdin;
\.


--
-- Data for Name: excursion; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--

COPY public.excursion (excursion_id, amount, city, description, duration, filename, meeting_point, price_for_one, title, guide_id) FROM stdin;
\.


--
-- Data for Name: guide; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--

COPY public.guide (guide_id, birth_date, city, description, email, experience, filename, first_name, gender, last_name, nationality, phone) FROM stdin;
\.


--
-- Data for Name: tourist; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--

COPY public.tourist (tourist_id, city, email, filename, first_name, last_name, nationality, phone) FROM stdin;
\.


--
-- Data for Name: usr; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--

COPY public.usr (email, activation_code, active, password, role) FROM stdin;
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: tetiana.chernova
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (booking_id);


--
-- Name: excursion excursion_pkey; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.excursion
    ADD CONSTRAINT excursion_pkey PRIMARY KEY (excursion_id);


--
-- Name: guide guide_pkey; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.guide
    ADD CONSTRAINT guide_pkey PRIMARY KEY (guide_id);


--
-- Name: tourist tourist_pkey; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.tourist
    ADD CONSTRAINT tourist_pkey PRIMARY KEY (tourist_id);


--
-- Name: usr usr_pkey; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.usr
    ADD CONSTRAINT usr_pkey PRIMARY KEY (email);


--
-- Name: excursion fk1hlirkaxcctftmaip581no1yu; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.excursion
    ADD CONSTRAINT fk1hlirkaxcctftmaip581no1yu FOREIGN KEY (guide_id) REFERENCES public.guide(guide_id);


--
-- Name: booking fkk85hd0l0ojpk8m3fxq7erg9p9; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT fkk85hd0l0ojpk8m3fxq7erg9p9 FOREIGN KEY (excursion_id) REFERENCES public.excursion(excursion_id);


--
-- Name: booking fkru6tbcvksnyc5iex7n9wdlo48; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT fkru6tbcvksnyc5iex7n9wdlo48 FOREIGN KEY (tourist_id) REFERENCES public.tourist(tourist_id);


--
-- PostgreSQL database dump complete
--

