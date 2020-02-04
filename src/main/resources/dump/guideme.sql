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
    booking_id integer NOT NULL,
    tourist_email character varying(50) NOT NULL,
    excursion_id integer NOT NULL,
    booking_date date NOT NULL,
    start_hour timestamp without time zone NOT NULL,
    language_name character(2) NOT NULL,
    guide_rating double precision,
    total_price double precision NOT NULL
);


ALTER TABLE public.booking OWNER TO "tetiana.chernova";

--
-- Name: booking2state; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.booking2state (
    booking_id integer NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public.booking2state OWNER TO "tetiana.chernova";

--
-- Name: booking_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: tetiana.chernova
--

CREATE SEQUENCE public.booking_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_booking_id_seq OWNER TO "tetiana.chernova";

--
-- Name: booking_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tetiana.chernova
--

ALTER SEQUENCE public.booking_booking_id_seq OWNED BY public.booking.booking_id;


--
-- Name: booking_state; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.booking_state (
    state_id integer NOT NULL,
    state_name character varying(20) NOT NULL
);


ALTER TABLE public.booking_state OWNER TO "tetiana.chernova";

--
-- Name: booking_state_state_id_seq; Type: SEQUENCE; Schema: public; Owner: tetiana.chernova
--

CREATE SEQUENCE public.booking_state_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.booking_state_state_id_seq OWNER TO "tetiana.chernova";

--
-- Name: booking_state_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tetiana.chernova
--

ALTER SEQUENCE public.booking_state_state_id_seq OWNED BY public.booking_state.state_id;


--
-- Name: excursion; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.excursion (
    excursion_id integer NOT NULL,
    guide_email character varying(50) NOT NULL,
    duration smallint NOT NULL,
    price_one integer NOT NULL,
    description text NOT NULL,
    people_amount smallint NOT NULL
);


ALTER TABLE public.excursion OWNER TO "tetiana.chernova";

--
-- Name: excursion_excursion_id_seq; Type: SEQUENCE; Schema: public; Owner: tetiana.chernova
--

CREATE SEQUENCE public.excursion_excursion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.excursion_excursion_id_seq OWNER TO "tetiana.chernova";

--
-- Name: excursion_excursion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tetiana.chernova
--

ALTER SEQUENCE public.excursion_excursion_id_seq OWNED BY public.excursion.excursion_id;


--
-- Name: excursion_languages; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.excursion_languages (
    excursion_id integer NOT NULL,
    language_name character(2) NOT NULL
);


ALTER TABLE public.excursion_languages OWNER TO "tetiana.chernova";

--
-- Name: excursion_sightseeing; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.excursion_sightseeing (
    excursion_id integer NOT NULL,
    sightseeing character varying(50) NOT NULL
);


ALTER TABLE public.excursion_sightseeing OWNER TO "tetiana.chernova";

--
-- Name: graphic; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.graphic (
    graphic_id integer NOT NULL,
    excursion_id integer NOT NULL,
    excursion_day character varying(9) NOT NULL,
    start_hour timestamp without time zone NOT NULL,
    end_hour timestamp without time zone NOT NULL
);


ALTER TABLE public.graphic OWNER TO "tetiana.chernova";

--
-- Name: graphic_graphic_id_seq; Type: SEQUENCE; Schema: public; Owner: tetiana.chernova
--

CREATE SEQUENCE public.graphic_graphic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.graphic_graphic_id_seq OWNER TO "tetiana.chernova";

--
-- Name: graphic_graphic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tetiana.chernova
--

ALTER SEQUENCE public.graphic_graphic_id_seq OWNED BY public.graphic.graphic_id;


--
-- Name: guide; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.guide (
    email character varying(50) NOT NULL,
    guide_name character varying(50) NOT NULL,
    birth_date date NOT NULL,
    experience smallint,
    rating double precision NOT NULL,
    nationality character varying(50) NOT NULL,
    city character varying(20) NOT NULL
);


ALTER TABLE public.guide OWNER TO "tetiana.chernova";

--
-- Name: guide_phones; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.guide_phones (
    phone_number character varying(15) NOT NULL,
    guide_email character varying(50) NOT NULL
);


ALTER TABLE public.guide_phones OWNER TO "tetiana.chernova";

--
-- Name: tourist; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.tourist (
    tourist_email character varying(50) NOT NULL,
    tourist_name character varying(50) NOT NULL,
    nationality character varying(50) NOT NULL
);


ALTER TABLE public.tourist OWNER TO "tetiana.chernova";

--
-- Name: tourist_phone; Type: TABLE; Schema: public; Owner: tetiana.chernova
--

CREATE TABLE public.tourist_phone (
    phone_number character varying(15) NOT NULL,
    tourist_email character varying(50) NOT NULL
);


ALTER TABLE public.tourist_phone OWNER TO "tetiana.chernova";

--
-- Name: booking booking_id; Type: DEFAULT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking ALTER COLUMN booking_id SET DEFAULT nextval('public.booking_booking_id_seq'::regclass);


--
-- Name: booking_state state_id; Type: DEFAULT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking_state ALTER COLUMN state_id SET DEFAULT nextval('public.booking_state_state_id_seq'::regclass);


--
-- Name: excursion excursion_id; Type: DEFAULT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.excursion ALTER COLUMN excursion_id SET DEFAULT nextval('public.excursion_excursion_id_seq'::regclass);


--
-- Name: graphic graphic_id; Type: DEFAULT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.graphic ALTER COLUMN graphic_id SET DEFAULT nextval('public.graphic_graphic_id_seq'::regclass);


--
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: booking2state; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: booking_state; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: excursion; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: excursion_languages; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: excursion_sightseeing; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: graphic; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: guide; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: guide_phones; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: tourist; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Data for Name: tourist_phone; Type: TABLE DATA; Schema: public; Owner: tetiana.chernova
--



--
-- Name: booking_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tetiana.chernova
--

SELECT pg_catalog.setval('public.booking_booking_id_seq', 1, false);


--
-- Name: booking_state_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tetiana.chernova
--

SELECT pg_catalog.setval('public.booking_state_state_id_seq', 1, false);


--
-- Name: excursion_excursion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tetiana.chernova
--

SELECT pg_catalog.setval('public.excursion_excursion_id_seq', 1, false);


--
-- Name: graphic_graphic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tetiana.chernova
--

SELECT pg_catalog.setval('public.graphic_graphic_id_seq', 1, false);


--
-- Name: booking booking_pk; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pk PRIMARY KEY (booking_id);


--
-- Name: booking_state booking_state_pk; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking_state
    ADD CONSTRAINT booking_state_pk PRIMARY KEY (state_id);


--
-- Name: booking2state booking_state_pkey; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking2state
    ADD CONSTRAINT booking_state_pkey PRIMARY KEY (booking_id, state_id);


--
-- Name: excursion excursion_pk; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.excursion
    ADD CONSTRAINT excursion_pk PRIMARY KEY (excursion_id);


--
-- Name: excursion_sightseeing excursion_sightseeing_pkey; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.excursion_sightseeing
    ADD CONSTRAINT excursion_sightseeing_pkey PRIMARY KEY (excursion_id, sightseeing);


--
-- Name: graphic graphic_pk; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.graphic
    ADD CONSTRAINT graphic_pk PRIMARY KEY (graphic_id);


--
-- Name: guide_phones guide_phones_pk; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.guide_phones
    ADD CONSTRAINT guide_phones_pk PRIMARY KEY (phone_number);


--
-- Name: guide guide_pk; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.guide
    ADD CONSTRAINT guide_pk PRIMARY KEY (email);


--
-- Name: tourist_phone tourist_phone_pk; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.tourist_phone
    ADD CONSTRAINT tourist_phone_pk PRIMARY KEY (phone_number);


--
-- Name: tourist tourist_pk; Type: CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.tourist
    ADD CONSTRAINT tourist_pk PRIMARY KEY (tourist_email);


--
-- Name: excursion_languages_excursion_id_language_name_uindex; Type: INDEX; Schema: public; Owner: tetiana.chernova
--

CREATE UNIQUE INDEX excursion_languages_excursion_id_language_name_uindex ON public.excursion_languages USING btree (excursion_id, language_name);


--
-- Name: booking2state booking2state_booking_booking_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking2state
    ADD CONSTRAINT booking2state_booking_booking_id_fk FOREIGN KEY (booking_id) REFERENCES public.booking(booking_id) ON DELETE CASCADE;


--
-- Name: booking2state booking2state_booking_state_state_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking2state
    ADD CONSTRAINT booking2state_booking_state_state_id_fk FOREIGN KEY (state_id) REFERENCES public.booking_state(state_id) ON DELETE CASCADE;


--
-- Name: booking booking_excursion_excursion_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_excursion_excursion_id_fk FOREIGN KEY (excursion_id) REFERENCES public.excursion(excursion_id);


--
-- Name: booking booking_tourist_tourist_email_fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_tourist_tourist_email_fk FOREIGN KEY (tourist_email) REFERENCES public.tourist(tourist_email) ON UPDATE CASCADE;


--
-- Name: excursion excursion_guide_email_fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.excursion
    ADD CONSTRAINT excursion_guide_email_fk FOREIGN KEY (guide_email) REFERENCES public.guide(email) ON UPDATE CASCADE;


--
-- Name: excursion_languages excursion_languages_excursion_excursion_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.excursion_languages
    ADD CONSTRAINT excursion_languages_excursion_excursion_id_fk FOREIGN KEY (excursion_id) REFERENCES public.excursion(excursion_id) ON DELETE CASCADE;


--
-- Name: excursion_sightseeing excursion_sightseeing_excursion_excursion_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.excursion_sightseeing
    ADD CONSTRAINT excursion_sightseeing_excursion_excursion_id_fk FOREIGN KEY (excursion_id) REFERENCES public.excursion(excursion_id) ON DELETE CASCADE;


--
-- Name: graphic graphic_excursion_excursion_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.graphic
    ADD CONSTRAINT graphic_excursion_excursion_id_fk FOREIGN KEY (excursion_id) REFERENCES public.excursion(excursion_id) ON DELETE CASCADE;


--
-- Name: guide_phones guide_phones_guide_guide_email___fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.guide_phones
    ADD CONSTRAINT guide_phones_guide_guide_email___fk FOREIGN KEY (guide_email) REFERENCES public.guide(email) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: tourist_phone tourist_phone_tourist_tourist_email_fk; Type: FK CONSTRAINT; Schema: public; Owner: tetiana.chernova
--

ALTER TABLE ONLY public.tourist_phone
    ADD CONSTRAINT tourist_phone_tourist_tourist_email_fk FOREIGN KEY (tourist_email) REFERENCES public.tourist(tourist_email) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

