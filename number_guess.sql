--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer,
    guesses integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (15, 2);
INSERT INTO public.games VALUES (16, 348);
INSERT INTO public.games VALUES (16, 506);
INSERT INTO public.games VALUES (17, 477);
INSERT INTO public.games VALUES (17, 851);
INSERT INTO public.games VALUES (16, 646);
INSERT INTO public.games VALUES (16, 55);
INSERT INTO public.games VALUES (16, 143);
INSERT INTO public.games VALUES (18, 385);
INSERT INTO public.games VALUES (18, 573);
INSERT INTO public.games VALUES (19, 574);
INSERT INTO public.games VALUES (19, 995);
INSERT INTO public.games VALUES (18, 371);
INSERT INTO public.games VALUES (18, 632);
INSERT INTO public.games VALUES (18, 118);
INSERT INTO public.games VALUES (20, 811);
INSERT INTO public.games VALUES (20, 313);
INSERT INTO public.games VALUES (21, 388);
INSERT INTO public.games VALUES (21, 631);
INSERT INTO public.games VALUES (20, 841);
INSERT INTO public.games VALUES (20, 140);
INSERT INTO public.games VALUES (20, 973);
INSERT INTO public.games VALUES (22, 498);
INSERT INTO public.games VALUES (22, 205);
INSERT INTO public.games VALUES (23, 752);
INSERT INTO public.games VALUES (23, 852);
INSERT INTO public.games VALUES (22, 934);
INSERT INTO public.games VALUES (22, 971);
INSERT INTO public.games VALUES (22, 567);
INSERT INTO public.games VALUES (24, 830);
INSERT INTO public.games VALUES (24, 384);
INSERT INTO public.games VALUES (25, 388);
INSERT INTO public.games VALUES (25, 444);
INSERT INTO public.games VALUES (24, 219);
INSERT INTO public.games VALUES (24, 738);
INSERT INTO public.games VALUES (24, 290);
INSERT INTO public.games VALUES (26, 187);
INSERT INTO public.games VALUES (26, 613);
INSERT INTO public.games VALUES (27, 198);
INSERT INTO public.games VALUES (27, 104);
INSERT INTO public.games VALUES (26, 343);
INSERT INTO public.games VALUES (26, 220);
INSERT INTO public.games VALUES (26, 570);
INSERT INTO public.games VALUES (28, 463);
INSERT INTO public.games VALUES (28, 871);
INSERT INTO public.games VALUES (29, 354);
INSERT INTO public.games VALUES (29, 271);
INSERT INTO public.games VALUES (28, 624);
INSERT INTO public.games VALUES (28, 636);
INSERT INTO public.games VALUES (28, 476);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (14, 'khalil');
INSERT INTO public.users VALUES (15, '200');
INSERT INTO public.users VALUES (16, 'user_1729463486713');
INSERT INTO public.users VALUES (17, 'user_1729463486712');
INSERT INTO public.users VALUES (18, 'user_1729463544237');
INSERT INTO public.users VALUES (19, 'user_1729463544236');
INSERT INTO public.users VALUES (20, 'user_1729463986178');
INSERT INTO public.users VALUES (21, 'user_1729463986177');
INSERT INTO public.users VALUES (22, 'user_1729464055247');
INSERT INTO public.users VALUES (23, 'user_1729464055246');
INSERT INTO public.users VALUES (24, 'user_1729464104249');
INSERT INTO public.users VALUES (25, 'user_1729464104248');
INSERT INTO public.users VALUES (26, 'user_1729464110681');
INSERT INTO public.users VALUES (27, 'user_1729464110680');
INSERT INTO public.users VALUES (28, 'user_1729464136992');
INSERT INTO public.users VALUES (29, 'user_1729464136991');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 29, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

