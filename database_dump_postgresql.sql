--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.2 (Ubuntu 14.2-1.pgdg20.04+1)

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
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    album_id integer NOT NULL,
    name character varying(255),
    release_year integer,
    genre character varying(100),
    available boolean,
    artist_id integer
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: albums_album_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.albums ALTER COLUMN album_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.albums_album_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    artist_id integer NOT NULL,
    name character varying(255),
    active boolean,
    founded_year integer
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: artists_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.artists ALTER COLUMN artist_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.artists_artist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    fname character varying(100),
    sname character varying(100),
    country character varying(100)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.customers ALTER COLUMN customer_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.customers_customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: order_lines; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_lines (
    order_id integer NOT NULL,
    album_id integer NOT NULL,
    quantity integer
);


ALTER TABLE public.order_lines OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    order_time timestamp without time zone DEFAULT now(),
    status character(1) NOT NULL,
    customer_id integer,
    CONSTRAINT orders_status_check CHECK ((status = ANY (ARRAY['i'::bpchar, 'p'::bpchar, 's'::bpchar, 'd'::bpchar, 'c'::bpchar, 'h'::bpchar, 'r'::bpchar])))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.orders ALTER COLUMN order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: songs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.songs (
    song_id integer NOT NULL,
    name character varying(255),
    "position" integer,
    length_sec integer,
    album_id integer,
    artist_id integer
);


ALTER TABLE public.songs OWNER TO postgres;

--
-- Name: songs_song_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.songs ALTER COLUMN song_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.songs_song_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Revolutions Per Minute', 1978, 'R&B', true, 9);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Talk To Your Daughter', 1977, 'Metal', false, 1);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Snowflakes', 2001, 'Classic', true, 6);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Tip World Singles 2000', 2009, 'Oldies', true, 4);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (5, 'The Best Of Shelley Fabares [Digital Version]', 1980, 'Jazz', false, 1);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (6, 'Whatever Happened To Boredom?', 1989, 'Rock', false, 9);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (7, 'Cracks', 2018, 'Metal', false, 6);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (8, 'The Singles', 2013, NULL, true, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (9, 'Tip World Singles 2000', 2003, 'Rock', false, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (10, 'That Which Does Not Kill You...Can Only Make You Stronger : Three Way Split', 1988, 'Jazz', false, 5);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (11, 'The Best Of Both Worlds', 1998, 'Jazz', false, 2);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (12, '13th And Pine', 1990, NULL, true, 6);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (13, 'Etiquette', 2019, 'Jazz', false, 6);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (14, 'White Feather', 1985, 'R&B', false, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (15, 'Snowflakes', 2007, 'Metal', true, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (16, 'In this Life', 1994, 'Jazz', true, 1);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (17, 'El Fuego De Dentro', 2020, 'Rock', false, 3);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (18, 'Murskapunkkia', 1987, 'Metal', true, 6);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (19, 'Hitzone 49', 2003, 'Oldies', true, 9);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (20, 'White Feather', 1994, 'Oldies', true, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (21, 'Relax', 2015, 'Jazz', false, 6);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (22, 'Milan Milan', 2005, 'Rock', true, 5);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (23, 'The Man from Snowy River', 2000, 'Rock', true, 1);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (24, 'Germicide', 2011, NULL, false, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (25, 'Ao Vivo', 1995, NULL, true, 2);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (26, 'A Bothered Mind', 2008, NULL, true, 6);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (27, 'Da Ghetto Psychic', 2004, 'Pop', true, 4);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (28, 'The Palest Grey', 1991, 'R&B', true, 5);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (29, 'Call of the Mastodon', 2007, 'Classic', false, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (30, 'Wintertime', 1991, 'Rock', false, 4);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (31, 'Maurice Chevalier  The Essential Collection Vol 1', 1992, 'Metal', false, 2);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (32, 'Reiki - Spiritual Fitness_ Relaxation and Chakra Meditation', 1991, 'Rock', true, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (33, 'Lo Mejor con La Orq. Broadway', 1993, 'Metal', false, 9);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (34, '13th And Pine', 2010, 'Jazz', true, 2);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (35, 'Call Tyrone', 1985, 'R&B', false, 9);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (36, 'Take A Look', 2021, 'R&B', false, 6);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (37, 'Strictly Trucking', 2020, 'Jazz', true, 9);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (38, 'In London_ In Love', 2013, 'Pop', true, 4);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (39, 'Bone To Pick', 1999, 'Jazz', false, 4);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (40, 'The Very Best Of', 2013, 'Pop', false, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (41, 'One World One People', 1992, 'Classic', false, 1);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (42, 'Scarcity', 2016, 'Oldies', true, 7);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (43, 'Ao Vivo', 2013, 'Pop', true, 4);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (44, 'Who Is Mike Jones?', 1987, NULL, true, 9);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (45, 'Electropop', 2012, NULL, false, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (46, 'In this Life', 1985, 'Oldies', true, 1);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (47, 'Da Ghetto Psychic', 1996, 'R&B', false, 5);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (48, 'In Your Honor', 2005, 'Jazz', true, 8);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (49, 'Strictly Confidential', 1990, NULL, false, 5);
INSERT INTO public.albums (album_id, name, release_year, genre, available, artist_id) OVERRIDING SYSTEM VALUE VALUES (50, 'Mis Momentos', 1998, NULL, false, 2);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (1, 'Midian', false, 1972);
INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (2, '40 Kilotons', false, 1977);
INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (3, 'Full Full Full', true, 2019);
INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (4, 'Flagship', false, 1989);
INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (5, 'Clean Up Crew', false, 1987);
INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (6, 'Clean Up Crew', false, 1983);
INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (7, 'Flagship', true, 2011);
INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (8, 'The Tavern Swank', false, 1979);
INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (9, '40 Kilotons', false, 1974);
INSERT INTO public.artists (artist_id, name, active, founded_year) OVERRIDING SYSTEM VALUE VALUES (10, '40 Kilotons', true, 2022);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (1, 'Lotta', 'Van Daalen', 'India');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (2, 'Adelaide', 'McDunlevy', 'Netherlands');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (3, 'Gregor', 'Duckham', NULL);
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (4, 'Vince', 'McDunlevy', 'England');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (5, 'Vince', 'Duckham', 'China');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (6, 'Bobina', 'Mehmet', 'Netherlands');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (7, 'Patrick', 'Giraux', 'China');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (8, 'Jesselyn', 'O''Malley', 'England');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (9, 'Guillema', 'Deathridge', 'Ireland');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (10, 'Guillema', 'Isakowicz', 'India');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (11, 'Zeke', 'Osburn', 'Ireland');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (12, 'Heath', 'McMenamie', 'Finland');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (13, 'Audrey', 'Deathridge', NULL);
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (14, 'Guillema', NULL, 'England');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (15, 'Jamie', 'Keig', 'China');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (16, 'Lynn', 'Isakowicz', 'Finland');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (17, 'Anthea', 'Crayden', 'China');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (18, 'Elva Jocelyn', 'Deathridge', 'India');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (19, 'Quincey', 'Xi', 'Netherlands');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (20, 'Gregor', 'Arrighetti', 'Netherlands');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (21, 'Sigismund', 'Arrighetti', 'India');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (22, 'Jake', 'Drummond', 'England');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (23, 'Daniella', 'Isakowicz', 'China');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (24, 'Anthea', 'Deathridge', 'England');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (25, 'Jehu', 'Duckham', 'China');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (26, 'Felix', 'Deathridge', 'India');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (27, 'Vince', 'Semper', 'China');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (28, 'Rene', 'Van Daalen', 'France');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (29, 'Bobina', 'Jeandillou', 'United States');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (30, 'Bess', 'Bough', 'India');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (31, 'Suki', 'Arrighetti', 'United States');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (32, 'Bess', 'Duckham', 'India');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (33, 'Scott Francis', 'Deathridge', 'Indonesia');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (34, 'Patrick', 'McMenamie', 'India');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (35, 'Heath', 'Keig', 'France');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (36, 'Bess', 'Mehmet', 'India');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (37, 'Brenda', 'Semper', 'Indonesia');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (38, 'Adelaide', 'Isakowicz', 'Netherlands');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (39, 'Lynn', 'Osburn', 'Netherlands');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (40, 'Brenda', 'Duckham', 'Netherlands');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (41, 'Adelaide', 'Donner', 'France');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (42, 'Clemmie', 'Drummond', 'France');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (43, 'Norry', 'Van Daalen', 'Finland');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (44, NULL, 'Shea', 'Netherlands');
INSERT INTO public.customers (customer_id, fname, sname, country) OVERRIDING SYSTEM VALUE VALUES (45, 'Adelaide', 'Lammas', 'Netherlands');


--
-- Data for Name: order_lines; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (9, 28, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (307, 18, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (182, 36, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (262, 47, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (87, 8, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (327, 32, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (359, 9, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (72, 10, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (175, 30, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (58, 37, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (424, 16, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (199, 2, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (234, 29, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (68, 4, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (150, 38, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (435, 43, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (430, 24, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (195, 43, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (221, 11, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (223, 12, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (88, 18, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (26, 7, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (386, 39, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (12, 30, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (38, 6, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (219, 34, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (111, 23, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (98, 38, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (63, 26, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (103, 34, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (302, 8, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (187, 39, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (319, 27, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (391, 24, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (345, 41, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (102, 33, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (23, 22, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (283, 24, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (444, 17, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (31, 47, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (340, 14, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (6, 43, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (307, 22, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (282, 23, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (76, 14, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (187, 26, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (291, 23, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (188, 23, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (114, 12, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (85, 44, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (173, 6, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (440, 7, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (438, 13, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (175, 50, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (340, 44, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (108, 28, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (235, 28, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (65, 26, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (95, 2, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (24, 23, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (313, 3, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (354, 21, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (368, 27, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (358, 44, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (403, 41, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (342, 49, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (307, 7, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (315, 32, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (253, 39, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (194, 13, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (235, 38, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (386, 26, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (388, 19, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (65, 3, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (401, 32, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (154, 4, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (286, 14, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (334, 38, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (178, 14, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (142, 45, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (12, 6, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (433, 30, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (351, 31, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (439, 24, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (89, 3, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (130, 25, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (111, 18, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (215, 17, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (416, 12, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (346, 4, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (221, 41, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (96, 20, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (233, 7, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (53, 10, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (45, 37, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (148, 49, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (347, 28, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (124, 30, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (15, 28, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (154, 9, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (208, 32, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (58, 21, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (361, 42, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (213, 18, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (29, 40, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (348, 29, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (149, 17, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (21, 29, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (157, 5, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (224, 13, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (354, 47, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (137, 10, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (177, 49, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (168, 29, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (387, 7, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (145, 31, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (319, 19, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (291, 3, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (234, 42, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (225, 20, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (366, 18, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (38, 1, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (205, 32, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (152, 8, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (179, 5, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (63, 17, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (209, 11, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (256, 37, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (138, 17, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (281, 12, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (220, 50, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (340, 10, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (33, 27, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (306, 30, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (109, 44, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (329, 18, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (114, 31, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (4, 41, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (55, 12, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (290, 26, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (278, 47, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (326, 44, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (113, 33, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (62, 24, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (388, 3, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (343, 11, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (209, 12, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (334, 44, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (126, 14, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (28, 30, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (450, 25, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (129, 17, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (163, 1, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (387, 13, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (165, 19, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (138, 19, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (189, 30, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (351, 35, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (375, 41, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (80, 42, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (32, 44, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (335, 23, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (29, 48, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (250, 37, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (306, 28, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (351, 8, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (36, 44, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (12, 48, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (376, 50, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (394, 13, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (425, 9, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (264, 3, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (450, 1, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (182, 43, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (18, 5, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (401, 22, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (150, 30, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (397, 39, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (106, 38, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (156, 30, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (111, 36, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (408, 32, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (442, 2, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (228, 25, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (340, 48, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (59, 43, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (28, 9, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (193, 41, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (159, 18, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (348, 18, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (80, 44, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (287, 46, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (297, 7, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (187, 44, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (349, 4, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (294, 30, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (57, 46, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (112, 48, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (170, 42, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (324, 43, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (430, 12, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (195, 31, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (290, 7, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (36, 14, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (245, 24, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (428, 5, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (99, 35, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (156, 38, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (363, 22, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (34, 40, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (182, 48, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (26, 28, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (70, 16, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (146, 29, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (23, 43, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (214, 36, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (324, 7, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (5, 48, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (289, 43, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (52, 37, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (57, 13, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (190, 46, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (258, 41, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (263, 44, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (69, 26, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (304, 37, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (338, 7, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (333, 7, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (380, 42, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (150, 14, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (395, 16, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (58, 19, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (113, 16, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (174, 11, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (183, 32, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (172, 39, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (359, 26, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (243, 26, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (242, 23, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (324, 19, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (419, 9, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (254, 38, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (154, 17, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (313, 46, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (152, 10, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (82, 20, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (227, 3, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (408, 49, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (328, 31, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (293, 15, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (192, 44, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (271, 30, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (128, 21, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (136, 26, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (68, 26, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (449, 18, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (267, 13, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (417, 11, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (247, 5, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (74, 18, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (73, 23, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (105, 41, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (309, 27, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (348, 15, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (129, 3, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (209, 41, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (91, 38, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (383, 18, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (56, 7, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (95, 48, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (62, 49, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (309, 25, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (377, 9, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (293, 19, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (289, 34, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (355, 10, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (423, 7, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (350, 30, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (81, 41, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (284, 7, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (307, 47, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (362, 47, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (28, 36, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (393, 44, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (252, 34, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (162, 21, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (427, 38, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (365, 32, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (52, 3, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (84, 2, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (142, 7, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (19, 48, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (293, 13, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (215, 50, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (197, 40, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (266, 11, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (171, 42, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (309, 12, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (53, 34, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (134, 42, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (295, 24, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (92, 39, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (279, 17, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (398, 42, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (80, 49, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (176, 18, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (357, 19, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (44, 26, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (234, 5, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (97, 49, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (262, 27, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (69, 7, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (243, 37, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (211, 17, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (89, 22, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (295, 13, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (169, 10, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (255, 1, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (371, 27, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (76, 21, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (322, 5, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (152, 42, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (176, 7, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (162, 10, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (203, 25, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (194, 3, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (40, 41, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (376, 45, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (271, 17, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (159, 3, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (385, 34, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (195, 8, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (410, 37, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (119, 3, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (360, 40, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (237, 29, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (184, 45, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (149, 21, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (408, 4, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (149, 49, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (391, 26, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (182, 3, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (391, 14, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (169, 40, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (356, 28, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (256, 23, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (225, 28, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (205, 30, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (265, 39, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (326, 14, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (327, 21, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (27, 6, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (93, 31, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (385, 31, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (406, 18, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (34, 36, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (226, 24, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (8, 29, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (106, 4, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (26, 19, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (145, 34, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (375, 32, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (416, 17, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (426, 33, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (127, 22, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (220, 34, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (271, 47, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (327, 50, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (44, 47, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (58, 5, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (323, 17, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (155, 30, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (26, 34, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (303, 14, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (167, 49, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (41, 32, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (17, 19, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (158, 13, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (56, 6, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (214, 7, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (231, 10, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (217, 30, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (296, 16, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (373, 1, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (232, 21, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (51, 42, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (237, 13, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (332, 45, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (263, 41, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (128, 44, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (274, 43, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (341, 20, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (28, 10, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (52, 32, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (404, 25, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (181, 42, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (399, 48, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (273, 38, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (31, 21, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (405, 12, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (288, 26, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (336, 44, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (356, 20, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (363, 7, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (192, 12, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (11, 21, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (390, 46, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (307, 33, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (87, 41, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (205, 13, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (120, 23, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (379, 40, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (276, 47, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (226, 22, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (407, 11, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (319, 14, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (373, 18, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (261, 5, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (444, 18, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (60, 12, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (192, 27, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (34, 20, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (430, 19, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (81, 32, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (367, 17, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (347, 48, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (224, 46, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (187, 46, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (207, 19, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (336, 17, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (326, 24, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (140, 38, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (43, 3, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (393, 5, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (378, 24, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (97, 50, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (214, 26, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (430, 40, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (99, 4, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (80, 32, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (117, 22, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (235, 15, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (377, 15, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (368, 10, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (367, 49, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (341, 10, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (352, 42, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (375, 13, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (392, 6, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (440, 9, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (17, 1, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (112, 13, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (77, 44, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (40, 17, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (10, 6, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (389, 44, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (121, 22, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (269, 50, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (356, 5, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (18, 35, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (123, 44, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (217, 42, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (36, 41, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (70, 24, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (142, 43, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (29, 45, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (366, 50, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (75, 11, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (39, 28, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (280, 49, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (311, 40, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (247, 41, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (308, 8, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (115, 46, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (294, 41, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (99, 24, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (321, 28, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (422, 11, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (89, 49, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (108, 6, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (341, 41, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (30, 9, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (66, 50, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (422, 6, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (208, 43, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (94, 9, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (437, 3, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (333, 2, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (429, 42, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (21, 28, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (329, 17, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (283, 5, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (81, 20, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (426, 29, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (180, 48, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (28, 41, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (227, 1, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (106, 27, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (64, 30, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (377, 33, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (92, 25, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (371, 19, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (211, 21, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (423, 5, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (269, 36, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (305, 44, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (221, 44, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (99, 28, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (194, 34, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (318, 3, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (357, 17, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (271, 36, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (248, 1, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (140, 5, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (334, 12, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (393, 47, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (235, 41, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (50, 31, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (11, 17, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (350, 40, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (204, 10, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (135, 33, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (243, 28, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (443, 32, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (316, 18, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (78, 25, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (258, 46, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (317, 19, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (442, 49, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (222, 20, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (108, 44, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (101, 7, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (309, 16, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (352, 17, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (409, 17, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (200, 3, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (442, 43, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (394, 41, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (12, 22, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (319, 11, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (277, 10, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (411, 19, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (347, 45, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (31, 22, 8);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (425, 36, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (113, 31, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (68, 42, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (162, 4, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (263, 38, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (357, 16, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (107, 32, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (179, 50, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (239, 41, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (203, 11, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (171, 33, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (339, 43, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (235, 19, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (313, 50, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (335, 33, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (3, 46, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (207, 6, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (416, 41, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (258, 49, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (130, 16, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (250, 46, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (190, 37, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (190, 30, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (359, 49, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (390, 30, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (58, 30, 4);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (344, 47, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (211, 1, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (323, 20, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (355, 16, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (251, 9, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (438, 5, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (304, 44, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (328, 15, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (445, 28, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (245, 30, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (183, 1, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (105, 7, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (128, 40, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (25, 40, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (230, 24, 6);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (413, 29, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (413, 47, 1);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (444, 37, 7);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (427, 15, 5);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (160, 2, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (394, 8, 3);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (384, 42, 2);
INSERT INTO public.order_lines (order_id, album_id, quantity) VALUES (226, 49, 4);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (1, '2020-05-17 06:02:01.18971', 'd', 18);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (2, '2018-09-25 00:00:28.39611', 'd', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (3, '2022-07-24 00:27:45.67611', 'p', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (4, '2022-04-29 22:22:35.18331', 'c', 11);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (5, '2021-02-03 05:36:48.23931', 'd', 3);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (6, '2019-03-28 02:41:49.60251', 'p', 41);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (7, '2020-12-27 10:13:44.94651', 'c', 10);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (8, '2020-02-25 03:45:48.44091', 'r', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (9, '2019-12-25 13:22:11.07771', 's', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (10, '2018-01-04 09:05:17.49051', 's', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (11, '2018-04-16 13:54:08.72571', 'c', 29);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (12, '2022-06-03 19:37:21.56091', 'p', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (13, '2020-01-02 16:57:27.10011', 'r', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (14, '2020-01-04 17:01:37.83291', 'p', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (15, '2019-09-17 23:07:34.57851', 's', 32);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (16, '2021-11-20 17:32:52.02171', 'c', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (17, '2018-05-22 16:02:45.28251', 'c', 38);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (18, '2019-05-10 09:02:30.22011', 'h', 15);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (19, '2018-11-06 03:37:59.80731', 'i', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (20, '2020-05-24 13:54:40.60731', 'h', 16);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (21, '2019-06-22 22:19:04.71291', 'h', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (22, '2017-12-15 17:04:04.28091', 'd', 41);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (23, '2020-12-31 17:40:58.88571', 'i', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (24, '2021-01-04 09:18:36.43131', 's', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (25, '2021-01-04 17:47:57.75291', 'c', 10);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (26, '2018-08-19 16:47:24.63291', 'i', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (27, '2020-09-22 05:25:39.41691', 'h', 19);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (28, '2020-06-30 09:40:39.56091', 'c', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (29, '2020-02-19 09:16:33.05211', 'd', 3);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (30, '2022-08-24 18:55:53.58651', 'h', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (31, '2022-03-13 04:10:08.08251', 'c', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (32, '2019-07-16 06:29:18.38331', 'd', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (33, '2019-06-18 23:32:45.71451', 's', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (34, '2018-08-15 11:51:28.22331', 'i', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (35, '2018-04-07 17:31:33.22491', 's', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (36, '2022-06-08 07:20:23.50971', 's', 39);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (37, '2022-04-15 15:24:44.14971', 'd', 25);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (38, '2017-12-04 06:55:22.39611', 'i', 10);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (39, '2021-02-20 18:59:03.75291', 'r', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (40, '2021-05-27 04:33:30.26811', 'd', 16);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (41, '2022-01-15 00:16:38.32251', 'h', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (42, '2020-01-19 06:23:02.97531', 'd', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (43, '2020-07-05 22:15:48.67131', 's', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (44, '2018-11-06 06:22:55.37211', 'h', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (45, '2017-12-08 05:02:44.10171', 'h', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (46, '2022-02-02 01:24:09.10011', 'r', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (47, '2018-10-12 19:45:02.33211', 'r', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (48, '2021-09-20 18:06:17.62491', 'd', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (49, '2021-07-18 10:42:40.72251', 's', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (50, '2019-11-05 02:41:58.41531', 'i', 44);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (51, '2018-08-28 06:54:33.83931', 'h', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (52, '2021-04-09 17:31:24.67131', 'c', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (53, '2021-11-25 20:14:19.44891', 'r', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (54, '2022-04-12 23:48:31.10331', 'p', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (55, '2021-12-31 14:21:46.48251', 'd', 18);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (56, '2021-04-24 05:50:31.63131', 'r', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (57, '2019-09-01 13:03:00.40251', 'h', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (58, '2020-01-07 11:24:01.00731', 'i', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (59, '2019-03-07 17:42:57.51291', 'p', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (60, '2020-06-20 14:27:48.06651', 'p', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (61, '2019-02-02 03:40:24.78651', 'd', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (62, '2022-05-26 07:21:40.31931', 'c', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (63, '2018-03-09 15:35:38.71611', 'r', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (64, '2021-11-05 15:26:28.26171', 's', 41);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (65, '2018-09-04 02:40:49.03611', 'r', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (66, '2021-03-09 19:45:31.18971', 'c', 10);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (67, '2022-02-28 00:41:35.28891', 'r', 44);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (68, '2020-07-21 12:53:14.35131', 'd', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (69, '2021-02-18 12:57:07.45851', 's', 16);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (70, '2020-01-28 00:05:57.58011', 'h', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (71, '2018-10-14 23:03:52.18491', 'c', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (72, '2018-01-15 15:22:46.55931', 'h', 27);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (73, '2021-04-20 17:43:41.83611', 'd', 22);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (74, '2020-02-18 17:08:17.08731', 'p', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (75, '2018-09-28 00:15:14.94651', 'i', 11);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (76, '2021-04-29 05:12:30.58491', 'h', 24);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (77, '2018-06-06 04:53:04.78971', 'p', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (78, '2021-05-15 21:27:09.73371', 'p', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (79, '2020-08-13 18:55:16.43451', 'h', 25);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (80, '2018-08-29 09:49:13.20891', 's', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (81, '2019-10-03 06:07:44.11131', 'h', 19);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (82, '2020-07-31 03:58:59.08731', 'c', 37);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (83, '2019-06-20 01:29:42.86331', 'h', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (84, '2022-09-17 06:29:24.25851', 'i', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (85, '2022-06-03 17:49:10.84731', 'i', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (86, '2021-04-11 21:03:24.39291', 'd', 38);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (87, '2018-02-12 12:05:33.12891', 'c', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (88, '2022-05-22 05:31:33.48411', 'r', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (89, '2017-09-26 19:03:48.78651', 'c', 41);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (90, '2022-05-15 23:28:31.69851', 'h', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (91, '2018-10-28 17:34:08.48571', 'i', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (92, '2020-07-09 15:34:02.98491', 'r', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (93, '2019-03-12 01:14:20.54331', 'd', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (94, '2019-09-18 08:36:25.68891', 'h', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (95, '2022-03-25 03:24:25.40091', 'h', 41);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (96, '2021-06-05 21:43:59.23131', 'd', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (97, '2020-05-31 20:01:18.04731', 'p', 15);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (98, '2022-06-10 07:25:04.22331', 'c', 9);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (99, '2019-07-24 19:03:08.00571', 'r', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (100, '2020-08-06 12:11:25.03611', 'd', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (101, '2018-08-01 06:55:19.02651', 'c', 37);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (102, '2018-03-23 14:46:58.56891', 'h', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (103, '2018-12-25 23:39:41.21211', 'p', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (104, '2022-04-04 03:33:33.09051', 'r', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (105, '2022-01-16 18:01:12.54651', 'c', 21);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (106, '2019-10-30 14:53:35.83611', 'p', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (107, '2020-11-15 02:22:51.36891', 's', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (108, '2021-06-02 12:09:02.90811', 's', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (109, '2019-09-18 08:36:25.68891', 'i', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (110, '2020-11-16 03:17:32.40891', 'r', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (111, '2018-12-01 21:54:51.37851', 'h', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (112, '2022-07-06 14:55:57.96411', 's', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (113, '2019-03-19 13:02:02.42811', 'c', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (114, '2019-07-16 06:29:18.38331', 'r', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (115, '2022-03-25 03:24:25.40091', 'p', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (116, '2018-10-25 07:32:42.22971', 'd', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (117, '2020-04-06 14:21:12.09531', 'r', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (118, '2021-06-27 19:35:17.92251', 'p', 18);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (119, '2022-04-27 02:23:41.39451', 'p', 22);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (120, '2022-05-27 11:43:18.50811', 'p', 37);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (121, '2019-01-19 17:02:45.57051', 'i', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (122, '2018-06-13 17:31:26.74491', 'c', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (123, '2018-11-21 06:49:42.84411', 's', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (124, '2021-12-19 02:34:07.44891', 'i', 38);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (125, '2021-01-06 02:35:27.02331', 'p', 24);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (126, '2017-10-06 05:58:20.09211', 'd', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (127, '2022-05-02 04:38:14.69691', 'i', 3);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (128, '2019-02-19 11:25:24.55611', 'i', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (129, '2020-09-12 09:05:35.89371', 'i', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (130, '2020-11-29 06:05:33.47451', 'c', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (131, '2018-11-21 08:25:55.40091', 'r', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (132, '2018-12-01 21:54:51.37851', 'd', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (133, '2018-04-29 06:44:49.94811', 'd', 15);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (134, '2020-02-21 11:34:15.57051', 'i', 44);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (135, '2022-08-02 09:38:57.69531', 'i', 44);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (136, '2020-09-12 00:16:57.41691', 'i', 9);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (137, '2018-05-09 12:01:13.23771', 'i', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (138, '2022-03-01 08:36:38.82171', 'c', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (139, '2020-01-07 11:24:01.00731', 'i', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (140, '2018-05-13 07:53:57.49371', 'h', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (141, '2020-11-29 06:05:33.47451', 's', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (142, '2018-12-17 15:02:53.63451', 'd', 10);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (143, '2020-10-22 12:42:19.43931', 'h', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (144, '2020-11-26 07:37:50.41851', 'p', 29);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (145, '2021-06-08 07:54:41.55771', 'h', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (146, '2022-06-10 12:07:38.66811', 'd', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (147, '2020-04-17 10:32:06.11451', 'd', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (148, '2022-02-07 12:34:39.79131', 'd', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (149, '2017-11-21 08:24:09.64731', 'r', 10);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (150, '2018-01-07 21:56:39.98331', 'i', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (151, '2019-01-06 02:49:09.63771', 'p', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (152, '2021-06-17 23:55:03.10011', 'c', 9);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (153, '2018-07-09 04:50:19.59291', 's', 11);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (154, '2018-08-29 00:11:53.37531', 'h', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (155, '2019-01-08 14:11:20.77371', 's', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (156, '2020-09-27 19:57:44.63931', 'i', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (157, '2021-06-14 22:43:45.60891', 'd', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (158, '2020-04-12 15:19:35.70171', 'h', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (159, '2022-04-14 07:44:15.58971', 'd', 21);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (160, '2018-03-11 02:13:25.44891', 'r', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (161, '2019-08-01 05:02:16.54011', 'd', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (162, '2018-03-12 05:54:33.37851', 'p', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (163, '2022-04-26 20:42:59.75931', 'r', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (164, '2017-12-15 06:25:49.12251', 'r', 29);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (165, '2020-05-29 00:46:19.11291', 'p', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (166, '2018-04-14 21:51:25.22811', 'p', 16);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (167, '2022-02-24 12:42:33.26331', 'h', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (168, '2021-01-09 11:50:45.10971', 'p', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (169, '2020-03-22 03:24:05.44251', 'p', 25);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (170, '2022-05-25 11:37:13.20891', 'r', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (171, '2019-03-29 05:36:04.86651', 'i', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (172, '2018-08-15 11:51:28.22331', 'd', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (173, '2021-12-19 02:34:07.44891', 's', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (174, '2019-11-06 00:56:14.84091', 'r', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (175, '2017-11-02 18:09:55.87131', 'h', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (176, '2019-09-07 04:51:17.65371', 'r', 9);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (177, '2018-10-16 20:42:12.75771', 'p', 19);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (178, '2022-09-03 19:11:56.68731', 'c', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (179, '2020-08-10 11:31:02.81211', 'p', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (180, '2019-06-14 15:35:19.01691', 'p', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (181, '2019-10-11 12:59:45.48411', 's', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (182, '2018-07-28 01:17:28.54971', 'i', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (183, '2019-10-03 06:07:44.11131', 'c', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (184, '2017-12-25 21:53:00.87291', 'h', 11);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (185, '2018-02-22 18:10:53.32731', 'h', 22);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (186, '2021-03-10 07:58:01.05531', 's', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (187, '2020-04-09 13:25:06.72891', 'd', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (188, '2018-04-29 06:44:49.94811', 'd', 10);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (189, '2018-08-30 07:15:49.53531', 'd', 41);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (190, '2020-01-25 23:32:36.72891', 's', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (191, '2020-11-03 20:35:03.17691', 's', 19);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (192, '2017-12-07 10:45:52.35771', 'i', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (193, '2022-05-26 07:21:40.31931', 'd', 29);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (194, '2017-10-05 19:02:12.01851', 'c', 9);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (195, '2019-02-01 20:18:36.83451', 's', 18);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (196, '2021-06-27 19:35:17.92251', 'd', 41);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (197, '2022-04-01 09:09:36.08571', 'd', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (198, '2020-12-09 06:04:51.74331', 'r', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (199, '2022-07-06 14:55:57.96411', 'p', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (200, '2022-08-26 01:29:37.85211', 'h', 9);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (201, '2022-08-22 15:13:59.77851', 'p', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (202, '2019-12-07 05:20:32.35131', 'r', 19);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (203, '2019-06-23 08:27:15.14811', 'h', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (204, '2020-12-19 20:19:30.57531', 'i', 9);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (205, '2020-02-18 17:08:17.08731', 'c', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (206, '2019-11-15 21:21:50.83131', 'p', 24);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (207, '2021-12-04 10:17:28.54971', 'r', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (208, '2020-09-29 13:19:51.71451', 'p', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (209, '2022-05-04 00:41:48.42171', 'p', 22);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (210, '2021-07-01 22:56:13.31451', 'c', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (211, '2019-07-16 15:24:59.78811', 'd', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (212, '2021-11-02 13:48:18.20091', 'i', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (213, '2018-08-29 21:20:47.50011', 'r', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (214, '2018-10-30 01:18:15.03291', 's', 32);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (215, '2018-03-22 04:28:05.23131', 's', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (216, '2021-05-28 08:09:44.09211', 'r', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (217, '2018-10-02 04:37:32.96571', 's', 24);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (218, '2022-03-18 02:51:08.52411', 'd', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (219, '2021-07-24 23:31:12.40251', 's', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (220, '2020-07-17 10:22:10.38651', 'd', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (221, '2019-06-22 22:19:04.71291', 's', 24);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (222, '2018-07-22 01:04:33.71451', 'h', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (223, '2020-06-03 21:16:49.03611', 'd', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (224, '2022-06-10 20:44:33.93531', 'd', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (225, '2019-11-19 06:42:15.89691', 'h', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (226, '2020-09-29 06:11:10.17531', 'c', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (227, '2019-09-10 00:05:13.51611', 'i', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (228, '2022-02-20 01:56:41.48091', 'c', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (229, '2019-08-28 22:11:40.18491', 'p', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (230, '2019-07-16 15:24:59.78811', 's', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (231, '2022-02-21 00:53:11.41371', 'r', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (232, '2018-01-02 05:21:50.11131', 'p', 3);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (233, '2019-03-03 05:51:55.35291', 'r', 9);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (234, '2018-07-15 12:06:24.79611', 'i', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (235, '2020-03-27 03:05:11.78811', 'd', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (236, '2020-01-03 06:25:53.96091', 'c', 22);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (237, '2019-10-11 12:59:45.48411', 's', 41);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (238, '2018-04-09 13:00:23.24091', 'p', 22);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (239, '2022-01-10 21:03:08.92731', 'd', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (240, '2020-06-28 19:12:17.50971', 's', 45);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (241, '2021-04-25 08:06:53.10651', 's', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (242, '2020-12-26 09:43:31.06491', 'p', 45);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (243, '2020-01-02 16:57:27.10011', 'c', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (244, '2017-10-05 19:02:12.01851', 'c', 24);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (245, '2020-12-30 04:44:18.18171', 'd', 39);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (246, '2022-02-23 15:09:48.61371', 'r', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (247, '2020-04-05 05:59:39.66651', 'h', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (248, '2019-10-02 16:19:39.70491', 'p', 11);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (249, '2022-02-15 20:48:15.03291', 'd', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (250, '2022-04-29 22:22:35.18331', 'i', 25);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (251, '2018-09-18 15:26:14.35131', 'h', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (252, '2019-04-14 07:21:17.94171', 'd', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (253, '2020-05-24 13:13:49.78491', 'c', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (254, '2018-12-20 00:30:38.38971', 'p', 37);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (255, '2018-10-16 20:42:12.75771', 'p', 21);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (256, '2017-11-05 08:30:41.55771', 'd', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (257, '2020-01-19 16:29:49.86171', 'i', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (258, '2019-02-12 00:38:31.60251', 'p', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (259, '2018-06-06 04:53:04.78971', 'h', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (260, '2021-12-04 16:52:59.08731', 's', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (261, '2018-03-16 20:05:48.04731', 's', 3);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (262, '2019-04-20 22:54:48.72891', 'r', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (263, '2019-12-17 22:14:37.47771', 'r', 10);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (264, '2022-01-15 20:34:01.83291', 'i', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (265, '2017-12-26 08:00:47.37531', 's', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (266, '2019-12-03 08:04:45.06171', 'i', 37);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (267, '2018-04-14 21:51:25.22811', 'p', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (268, '2022-05-27 12:58:10.01211', 's', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (269, '2019-04-14 07:21:17.94171', 'r', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (270, '2018-09-04 02:40:49.03611', 'h', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (271, '2018-12-22 18:17:20.57211', 'p', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (272, '2018-06-08 07:11:43.20891', 'c', 32);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (273, '2019-07-06 00:07:33.13851', 'd', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (274, '2022-02-02 01:24:09.10011', 'r', 27);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (275, '2018-01-30 14:19:06.46971', 'r', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (276, '2019-01-08 07:30:00.14331', 's', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (277, '2021-01-04 17:47:57.75291', 's', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (278, '2021-08-29 20:32:41.65371', 'i', 45);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (279, '2018-11-27 20:16:57.38811', 'i', 21);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (280, '2019-02-10 09:35:59.19291', 'p', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (281, '2022-01-26 23:00:47.11611', 'p', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (282, '2017-10-13 09:45:35.82651', 'c', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (283, '2022-01-12 12:50:02.02491', 'c', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (284, '2020-01-31 13:51:52.99131', 'p', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (285, '2022-04-27 02:23:41.39451', 'i', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (286, '2021-02-23 18:48:32.25531', 's', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (287, '2018-05-27 13:51:32.51451', 'p', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (288, '2022-02-24 08:08:22.96251', 'h', 32);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (289, '2019-12-30 12:43:28.73211', 'r', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (290, '2018-03-27 08:29:15.84891', 'i', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (291, '2018-03-17 10:25:41.11611', 'c', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (292, '2021-11-11 03:46:28.27131', 'd', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (293, '2018-02-16 09:45:34.09851', 'p', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (294, '2018-03-28 13:49:30.34491', 'r', 25);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (295, '2017-11-22 14:19:33.08091', 'd', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (296, '2019-04-20 22:54:48.72891', 's', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (297, '2019-05-26 04:42:10.39611', 's', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (298, '2020-12-05 18:33:21.59931', 'i', 24);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (299, '2022-02-28 06:29:12.42171', 'r', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (300, '2019-06-30 17:10:00.94011', 'i', 29);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (301, '2019-10-10 10:31:17.98971', 'c', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (302, '2017-09-25 18:22:38.95611', 'h', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (303, '2022-09-03 19:11:56.68731', 'p', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (304, '2018-08-29 00:11:53.37531', 'c', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (305, '2022-08-12 00:57:39.16731', 'i', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (306, '2017-10-13 12:12:59.21211', 'h', 21);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (307, '2019-05-19 21:19:53.24091', 'c', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (308, '2022-03-25 03:24:25.40091', 'd', 10);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (309, '2017-11-09 12:17:25.06491', 'i', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (310, '2019-10-07 09:36:41.61531', 'h', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (311, '2019-06-30 17:10:00.94011', 'r', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (312, '2018-07-04 14:28:44.57211', 'c', 25);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (313, '2021-05-28 04:41:37.73691', 'p', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (314, '2018-10-02 04:37:32.96571', 'r', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (315, '2018-02-11 06:04:09.06171', 's', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (316, '2022-05-27 11:43:18.50811', 'i', 16);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (317, '2022-06-19 12:15:14.60091', 'p', 38);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (318, '2020-10-22 12:42:19.43931', 'r', 45);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (319, '2022-07-25 06:23:15.93531', 'c', 37);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (320, '2020-04-30 11:33:17.76891', 'h', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (321, '2020-11-30 00:27:12.75771', 'd', 35);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (322, '2022-01-11 02:44:04.73211', 'p', 19);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (323, '2021-02-03 11:27:47.11611', 'h', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (324, '2020-02-18 17:08:17.08731', 'i', 18);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (325, '2022-06-10 12:07:38.66811', 'c', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (326, '2022-06-26 01:47:08.56251', 'h', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (327, '2022-04-12 23:48:31.10331', 'h', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (328, '2022-02-07 15:35:21.17691', 'c', 15);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (329, '2019-12-25 02:36:37.26651', 's', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (330, '2021-05-08 00:40:19.60251', 's', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (331, '2020-03-23 14:11:19.13211', 'i', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (332, '2020-09-29 13:19:51.71451', 'i', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (333, '2021-02-20 18:59:03.75291', 'r', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (334, '2019-01-19 17:02:45.57051', 'c', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (335, '2021-01-23 04:24:19.64091', 's', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (336, '2018-01-27 16:10:27.09051', 'r', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (337, '2018-11-19 07:13:34.14651', 'c', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (338, '2022-06-15 11:16:26.54331', 'd', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (339, '2019-10-30 14:53:35.83611', 'h', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (340, '2020-05-11 05:12:24.70971', 's', 27);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (341, '2018-11-13 08:30:58.92411', 'p', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (342, '2019-06-05 21:18:39.71451', 'i', 27);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (343, '2018-08-29 09:49:13.20891', 'd', 37);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (344, '2021-10-09 05:56:49.45851', 'p', 3);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (345, '2020-01-31 13:51:52.99131', 'd', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (346, '2021-02-05 05:00:00.46011', 'c', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (347, '2018-12-25 18:05:33.12891', 'd', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (348, '2022-01-30 21:36:40.14651', 'd', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (349, '2022-08-05 01:32:46.98171', 's', 16);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (350, '2018-01-12 17:58:31.06491', 'c', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (351, '2022-03-24 04:08:31.22811', 'c', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (352, '2021-01-04 12:17:50.63931', 'p', 27);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (353, '2022-02-20 01:56:41.48091', 'd', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (354, '2017-10-01 17:29:36.41211', 'i', 24);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (355, '2018-01-04 09:05:17.49051', 'h', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (356, '2021-01-04 12:17:50.63931', 's', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (357, '2019-11-09 17:31:11.62491', 'h', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (358, '2018-01-22 02:44:22.09851', 'c', 16);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (359, '2021-05-27 18:38:06.20091', 's', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (360, '2018-05-22 16:45:14.86011', 'd', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (361, '2019-03-28 02:41:49.60251', 'r', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (362, '2019-03-12 01:14:20.54331', 'c', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (363, '2017-10-17 23:45:18.17211', 'c', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (364, '2020-01-04 17:01:37.83291', 's', 38);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (365, '2020-02-17 13:42:08.06331', 'd', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (366, '2021-05-12 22:11:07.35291', 'd', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (367, '2017-09-25 18:22:38.95611', 'i', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (368, '2022-04-01 13:33:03.48411', 'h', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (369, '2020-06-20 14:27:48.06651', 's', 33);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (370, '2021-06-03 12:51:31.79451', 's', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (371, '2022-01-19 12:36:44.89851', 'i', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (372, '2019-05-26 04:42:10.39611', 'i', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (373, '2019-09-03 18:04:49.41051', 'd', 24);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (374, '2018-11-03 06:20:01.70811', 'r', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (375, '2018-03-19 23:33:18.02811', 'r', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (376, '2022-01-13 01:51:19.29531', 'r', 4);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (377, '2021-07-29 22:16:33.94491', 'p', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (378, '2019-11-06 03:13:08.80251', 'd', 11);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (379, '2021-05-14 09:11:35.40411', 's', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (380, '2021-08-24 11:42:31.16091', 'd', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (381, '2020-06-07 16:31:21.70491', 'r', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (382, '2018-05-12 20:09:42.79611', 's', 25);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (383, '2018-02-16 21:46:35.61531', 'h', 19);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (384, '2019-04-06 01:18:24.27771', 'r', 13);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (385, '2021-07-13 06:36:10.94331', 'i', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (386, '2018-04-30 11:58:12.48891', 'r', 38);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (387, '2019-12-03 08:04:45.06171', 'h', 31);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (388, '2018-01-01 01:02:20.65851', 'i', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (389, '2018-09-28 00:15:14.94651', 'c', 15);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (390, '2019-06-22 22:19:04.71291', 'r', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (391, '2019-10-05 07:32:48.88251', 'c', 21);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (392, '2019-02-23 13:07:46.38651', 'i', 16);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (393, '2021-11-20 17:32:52.02171', 'i', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (394, '2018-01-12 17:58:31.06491', 'd', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (395, '2018-01-27 16:10:27.09051', 'h', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (396, '2019-10-05 07:32:48.88251', 'd', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (397, '2020-05-19 23:38:45.82971', 'i', 15);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (398, '2021-04-21 18:25:10.76091', 'h', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (399, '2021-07-23 11:38:11.78811', 'h', 45);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (400, '2022-07-06 14:55:57.96411', 's', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (401, '2018-10-19 19:49:29.65371', 'i', 1);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (402, '2019-08-18 15:24:37.84251', 'i', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (403, '2019-12-09 13:19:32.87931', 's', 27);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (404, '2019-06-23 08:27:15.14811', 'p', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (405, '2018-01-28 04:41:29.87451', 'h', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (406, '2017-11-21 08:24:09.64731', 'i', 18);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (407, '2021-01-31 17:40:32.62011', 'h', 12);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (408, '2021-01-26 20:05:24.71931', 'p', 3);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (409, '2021-10-10 06:39:25.60251', 'c', 22);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (410, '2021-05-07 00:24:53.04891', 'p', 39);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (411, '2021-07-13 06:36:10.94331', 'd', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (412, '2019-09-19 15:28:28.78971', 'r', 36);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (413, '2022-07-06 14:55:57.96411', 'd', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (414, '2019-01-10 13:59:48.96891', 'p', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (415, '2022-03-25 08:17:00.84411', 'd', 29);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (416, '2021-01-01 06:14:15.84891', 'p', 40);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (417, '2022-08-02 09:38:57.69531', 'p', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (418, '2022-03-06 22:05:48.19131', 'c', 3);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (419, '2018-10-06 08:53:19.42011', 's', 11);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (420, '2020-04-17 10:32:06.11451', 's', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (421, '2021-08-11 02:51:22.52091', 'c', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (422, '2021-02-28 20:51:39.28251', 'r', 16);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (423, '2018-05-08 14:56:37.10331', 'c', 42);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (424, '2022-05-27 11:43:18.50811', 'r', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (425, '2018-02-16 21:46:35.61531', 'c', 41);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (426, '2021-01-23 09:54:29.51931', 'i', 20);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (427, '2022-02-03 12:08:29.90331', 'h', 11);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (428, '2019-06-16 06:02:36.70011', 'c', 43);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (429, '2018-04-27 17:01:51.31131', 'r', 14);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (430, '2021-03-26 10:55:02.29371', 'h', 19);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (431, '2020-05-25 20:30:44.40891', 'h', 29);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (432, '2020-12-21 21:05:29.32731', 's', 6);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (433, '2018-09-05 02:26:37.65051', 'r', 28);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (434, '2022-03-18 02:51:08.52411', 'p', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (435, '2019-10-02 16:19:39.70491', 's', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (436, '2021-10-06 19:56:21.60891', 'r', 11);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (437, '2022-08-05 01:32:46.98171', 'c', 27);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (438, '2020-07-05 22:15:48.67131', 'i', 34);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (439, '2021-07-27 07:57:10.94331', 'd', 5);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (440, '2019-03-28 02:41:49.60251', 'p', 2);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (441, '2021-05-07 08:50:43.20891', 'h', 23);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (442, '2020-03-01 20:33:21.13851', 'i', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (443, '2021-12-22 14:03:05.70171', 's', 8);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (444, '2019-01-27 01:53:33.99291', 'c', 26);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (445, '2021-06-23 02:58:05.40411', 'c', 19);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (446, '2018-05-06 12:55:34.92411', 's', 30);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (447, '2019-09-03 14:47:59.13531', 'i', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (448, '2018-10-30 01:18:15.03291', 'h', 17);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (449, '2021-05-01 16:16:19.77531', 'i', 7);
INSERT INTO public.orders (order_id, order_time, status, customer_id) OVERRIDING SYSTEM VALUE VALUES (450, '2019-04-21 20:58:43.85211', 'h', 3);


--
-- Data for Name: songs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (1, 'The Truth Forever', 1, 286, 1, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Hit The Lights', 3, 858, 1, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Walk Away', 4, 975, 1, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (5, 'All Over Me', 5, 831, 1, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (6, 'Marcando El Ritmo Al Caminar', 6, 324, 1, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (7, 'Bed Crumbs', 7, 809, 1, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (8, 'Bloco Da Solidao (1996 Digital Remaster)', 1, 963, 2, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (9, 'Take A Look  (LP Version)', 2, 32, 2, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (10, 'Sun Is Shining', 3, 796, 2, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (11, 'Wild Rose (Back 2 Basics Mix)', 4, 190, 2, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (12, 'Oedipus Rex_ Atto Secondo: Divum Jocastae Caput Mortuum (Messaggero_ Coro) (Stravinsky)', 5, 527, 2, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (13, 'This Melody (Live)', 1, 685, 3, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (14, 'All Kind of People', 2, 262, 3, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (15, 'De pie', 3, 237, 3, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (16, 'Princess Black', 4, 4, 3, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (17, 'Saturday Night Is The Loneliest Night In The Week', 5, 531, 3, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (18, 'Bad Seed', 6, 154, 3, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (19, 'Got It Twisted', 7, 279, 3, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (20, 'Penny In My Pocket', 1, 961, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (21, 'Terra', 2, 561, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (22, 'Drop of Rain', 3, 99, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (23, 'Young Blood (2007 Digital Remaster)', 4, 955, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (24, 'Risen From Within', 5, 871, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (25, 'Great Is Thy Faithfulness', 6, 252, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (26, 'Sun Is Shining', 7, 435, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (27, 'Wiggle (Soul and R&B)', 8, 785, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (28, 'I See The Boys Of Summer', 9, 66, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (29, 'De Kommissar 1', 10, 54, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (30, 'Human Guinea Pig', 11, 659, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (31, 'Me And My Buddy', 12, 324, 4, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (32, 'Spaced Invader (Ian Pooley Club Mix)', 1, 214, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (33, 'U Killed It', 2, 951, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (34, 'Intro', 3, 461, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (35, 'American Journey/IV. Arts and Sports', 4, 96, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (36, 'Night Train (Album Version)', 5, 11, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (37, 'She Fell Away (2009 Digital Remaster)', 6, 906, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (38, 'Northern Downpour (Album Version)', 7, 181, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (39, 'Monster For Music', 8, 747, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (40, 'Me And My Buddy', 9, 413, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (41, 'Ass Attack (Four Tet Remix)', 10, 345, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (42, 'Time to come true', 11, 889, 5, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (43, 'And I Love You So', 1, 288, 6, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (44, 'O Hiroteros Ehthros Mou', 2, 884, 6, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (45, 'Hard Times', 3, 539, 6, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (46, 'In His Presence (LP Version)', 4, 740, 6, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (48, 'Do You Finally Need A Friend', 6, 891, 6, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (49, 'Mumbo Jumbo (jazz)', 1, 293, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (50, 'Jimi Baby', 2, 55, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (51, 'You Are The One', 3, 375, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (52, 'Use Me', 4, 232, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (53, 'Openbare Weg', 5, 369, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (54, 'Chorinho Pra Ele (Live)', 6, 992, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (55, 'Young Boy Blues', 7, 731, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (56, 'Sabotage', 8, 93, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (57, 'Money Make The World Go Around', 9, 404, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (58, 'Kite Live from Sydney', 10, 386, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (59, 'Mountains Of Mourne', 11, 153, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (60, 'The Owl and the Pussy-cat', 12, 601, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (61, 'City Slickers', 13, 797, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (62, 'Fire (Oscar G Space Vocal Mix)', 14, 443, 7, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (63, 'Witch Weed (Live)', 1, 381, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (64, 'Between Me & You Kid (Album Version)', 2, 694, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (65, 'Be Good To Me', 3, 535, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (66, 'Got My Mojo Workin', 4, 532, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (67, 'Error', 5, 324, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (69, 'The Date (Remix By Ana Rago)', 7, 652, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (70, 'As My Fire Flies', 8, 738, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (71, 'Sacrifice for the Slaughtergod', 9, 330, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (72, 'Master Of Disharmony', 10, 824, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (73, 'What Would You Do', 11, 856, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (74, 'Battle Of The Rosebud / Cries', 12, 230, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (75, 'I Will Always Love You', 13, 682, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (76, 'El Mes Alt', 14, 386, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (77, 'I Think My Wife Is Running Around On Me (Taco Hell)', 15, 740, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (78, 'Got It Twisted', 16, 684, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (79, 'Innizar', 17, 480, 8, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (80, 'Kite Live from Sydney', 1, 546, 9, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Closing Scene', 2, 847, 1, 7);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (47, 'If I...', 5, 990, 6, 5);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (68, 'OAKtown', 6, 570, 8, 6);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (81, 'Ciao Milan', 1, 830, 10, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (83, 'Beyond the Light', 3, 317, 10, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (84, 'Feelings', 4, 493, 10, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (85, 'Shadows That Move', 5, 2, 10, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (86, 'Dumb Woman Blues', 6, 624, 10, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (87, 'Taryns Deepest Fear', 7, 481, 10, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (88, 'Marcando El Ritmo Al Caminar', 8, 23, 10, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (89, 'Full Of Voices', 9, 846, 10, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (90, 'D Shuffle Jam (Part 2)', 1, 454, 11, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (91, 'Spooks In Space', 2, 589, 11, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (93, 'Saturday Night Is The Loneliest Night In The Week', 4, 44, 11, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (94, 'Adios...Borron Y Cuenta Nueva', 5, 712, 11, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (95, 'Bad Seed', 6, 855, 11, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (96, 'The Urgency (LP Version)', 7, 588, 11, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (98, 'Sacrifice for the Slaughtergod', 9, 724, 11, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (99, 'Driving Home For Christmas', 10, 641, 11, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (100, 'Same Man', 11, 766, 11, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (101, 'Kite Live from Sydney', 1, 17, 13, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (102, 'Too Much Saturn', 2, 176, 13, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (103, 'bI Love You More Than Youll Ever Know (LP Version)', 3, 536, 13, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (104, 'La Excursion', 4, 884, 13, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (105, 'From The Blind (LP Version)', 5, 800, 13, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (106, 'No Control', 6, 250, 13, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (107, 'Ponto', 1, 370, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (108, 'God Will Make A Way', 2, 628, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (109, 'The Ride (Album)', 3, 400, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (110, 'No Control', 4, 939, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (111, 'The Truth Forever', 5, 703, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (112, 'The Cube (Live)', 6, 57, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (113, 'Voices On The Corner', 7, 64, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (114, 'Bedroom Acoustics', 8, 265, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (115, 'Baby You Got What It Takes - Original', 9, 365, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (117, 'Someday (Immune Album Version)', 11, 389, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (118, 'Weight Of The World (Album Version)', 12, 453, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (119, 'Skeletons (Live Acoustic Version)', 13, 610, 14, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (120, 'I Worship You', 1, 916, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (121, 'Wave', 2, 47, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (123, 'bIm The Man (Explicit) (Feat. Jeru The Damaja And Lil Dap)', 4, 443, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (124, 'I Think My Wife Is Running Around On Me (Taco Hell)', 5, 222, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (125, 'De Tree Little Pigs', 6, 507, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (126, 'Yippiyo-Ay', 7, 79, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (127, 'Big Balls And Cow Town', 8, 530, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (128, 'The Truth Forever', 9, 751, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (129, 'Have Yourself A Merry Little Christmas', 10, 953, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (130, 'Girls Girls', 11, 211, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (131, 'Old Friends', 12, 529, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (132, '(This Is Not A) Love Song (Live)', 13, 613, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (133, 'Fall Away Into Darkness', 14, 393, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (134, '(This Is Not A) Love Song (Live)', 15, 117, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (135, 'Cooler Than You', 16, 707, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (136, 'Der Wind Hat Mir Ein Lied Erz\xc3\xa4hlt (from La Habanera")"', 17, 910, 15, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (137, 'Recorda-Me', 1, 677, 16, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (138, 'Sabor Guajiro', 2, 749, 16, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (139, 'Travel Song (Reprise)', 3, 790, 16, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (140, 'Dis moi', 4, 527, 16, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (141, 'New York (Dave Goodman Demo Version) (Explicit)', 1, 450, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (142, 'Disappeared', 2, 793, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (143, 'Consuelate Como Yo', 3, 24, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (144, '56 Days', 4, 676, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (145, 'Sahti Waari', 5, 857, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (146, 'Music Reach (1/2/3/4) (Remastered)', 6, 561, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (147, 'Give Me 40 Acres (To Turn This Rig Around)', 7, 838, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (148, '', 8, 491, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (149, 'Honey', 9, 726, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (150, 'No Control', 10, 444, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (151, 'It Goes On', 11, 700, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (153, 'Musical Episode', 13, 243, 17, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (154, 'Kashmiri Love Song', 1, 656, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (155, 'Nashville Parthenon', 2, 191, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (156, 'Indian Love Call', 3, 986, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (157, 'Raketen', 4, 622, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (158, 'La Excursion', 5, 249, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (159, 'Lullaby', 6, 277, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (160, 'If I...', 7, 277, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (161, 'Mama Kin', 8, 980, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (163, 'Drugs', 10, 671, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (165, 'Close To Me', 12, 166, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (166, 'bSarah Yellin', 13, 980, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (167, 'Space Between Us (Album Version)', 14, 407, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (168, 'Driving Home For Christmas', 15, 858, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (169, 'Triesteitaliana', 16, 919, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (171, 'Lunes Por La Madrugada', 18, 666, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (172, 'Thank You Lord', 19, 63, 18, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (173, 'Still', 1, 99, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (174, 'Alguna Vez', 2, 782, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (175, 'Deform (live)', 3, 193, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (176, 'Slip Out The Back (Album Version)', 4, 694, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (177, 'Ammonite', 5, 22, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (178, 'Come Here Feat. Jay Sean', 6, 543, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (179, 'Heart Of The City (Soul and R&B)', 7, 544, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (180, 'Harajuku Girls', 8, 237, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (181, 'Alli Mia Fora', 9, 525, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (182, 'Follow Your Dreams (The Plan Album Version)', 10, 194, 19, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (183, 'Walk Away', 1, 423, 20, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (184, 'Uncle Interlude', 2, 190, 20, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (185, 'The Emperor Falls', 3, 549, 20, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (186, 'Colonel Brown (1999 Digital Remaster)', 4, 428, 20, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (187, 'Beyond the Light', 5, 473, 20, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (188, 'You Can Always Come Home', 6, 470, 20, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (189, 'Lady Of Your Calibre', 7, 108, 20, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (190, 'Ven Conmigo/Perdoname (Live)', 1, 973, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (191, 'Spark', 2, 470, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (192, 'Oedipus Rex_ Atto Secondo: Divum Jocastae Caput Mortuum (Messaggero_ Coro) (Stravinsky)', 3, 230, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (193, 'Shake', 4, 854, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (194, 'Fire (Oscar G Space Vocal Mix)', 5, 684, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (195, 'Anti Geroi', 6, 192, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (196, 'bWarriors Quest', 7, 827, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (197, 'Bust At You [featuring Baby_ Scarface & Tony Sunshine] (edited album version)', 8, 933, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (198, 'San Cristobal', 9, 723, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (199, 'Born and Raised In Compton', 10, 443, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (200, 'Spirit', 11, 661, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (201, 'Crimson And Clover', 12, 87, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (202, 'Nina Nina', 13, 576, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (203, 'Skinhead on the MBTA (Album Version)', 14, 558, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (204, 'Citizen Of The Planet', 15, 898, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (205, 'Urgence', 16, 317, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (206, 'All I Ever Really Wanted', 17, 454, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (207, 'Tides Of Time', 18, 152, 21, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (208, 'South Side Story', 1, 995, 22, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (209, 'Kashmiri Love Song', 2, 156, 22, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (210, 'The Frail', 3, 85, 22, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (212, 'If Ever', 5, 742, 22, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (213, 'Guardian Angel', 6, 555, 22, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (214, 'Choro', 7, 20, 22, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (215, 'Go To Hell', 8, 904, 22, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (216, 'All Over Me', 1, 609, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (217, 'Talk About Us', 2, 242, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (218, 'Aquel Mundo De Amor', 3, 288, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (219, 'Soul Deep', 4, 529, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (220, 'Swallow The Knife (Live) (Segue)', 5, 9, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (221, 'Triesteitaliana', 6, 447, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (222, 'Prvni vesela', 7, 547, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (223, 'The Reason I Go On', 8, 323, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (224, 'El Arte De Amar', 9, 838, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (225, 'Adios...Borron Y Cuenta Nueva', 10, 305, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (226, 'Face the Ashes', 11, 365, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (227, 'the fallen...', 12, 70, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (228, 'Where The Thunder Roars (Tales Of Wonder Album Version)', 13, 729, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (229, 'bSarah Yellin', 14, 678, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (231, 'bNice N Easy', 16, 260, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (232, 'Prognosis', 17, 814, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (233, 'A New Hope', 18, 501, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (234, 'Left To Starve', 19, 594, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (235, 'Isla del Luna', 20, 153, 23, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (236, 'Mayday', 1, 125, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (237, 'La Sitiera', 2, 765, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (238, 'Chains Chains (Live In Hammersmith)', 3, 622, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (239, 'The Ballad Of Sleeping Beauty', 4, 459, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (240, 'You Can Always Come Home', 5, 913, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (241, 'Laws Patrolling (Album Version)', 6, 351, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (242, 'Creeper Kamikaze', 7, 572, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (243, 'Broken-Down Merry-Go-Round', 8, 856, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (244, 'Der Kleine Dompfaff', 9, 86, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (245, 'A Day In The Life (Album Version)', 10, 390, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (246, 'Walk Away', 11, 586, 25, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (247, 'Compulsory Resurrection', 1, 481, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (248, 'Conscience Ah Heng Dem (interlude)', 2, 47, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (249, 'Drive By Music', 3, 314, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (250, 'Bust At You [featuring Baby_ Scarface & Tony Sunshine] (edited album version)', 4, 698, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (251, 'Sometimes', 5, 959, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (252, 'Talk About Us', 6, 932, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (253, 'Master Of Disharmony', 7, 959, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (255, 'Feelings', 9, 703, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (256, 'Journey To Love', 10, 828, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (258, 'Bounce Back', 12, 319, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (259, 'bPortrait Of Clare (from Portrait Of Clare)', 13, 209, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (260, 'I Got Stripes (Live)', 14, 58, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (261, 'Lekeitio', 15, 581, 26, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (263, 'The Urgency (LP Version)', 1, 725, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (264, 'Hungarian Dances_ WoO 1: No. 12 in D Minor: Presto', 2, 453, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (265, 'The Cookie Bakers of the Night', 3, 883, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (266, 'Take A Look  (LP Version)', 4, 956, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (267, 'Between Eunice & Opelousas', 5, 865, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (268, 'Young Blood (2007 Digital Remaster)', 6, 764, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (269, 'Crimson And Clover', 7, 286, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (270, 'Irresistible! (Maurel & Fauvrelle LESS Mix)', 8, 512, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (271, 'Escuchame', 9, 128, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (272, 'Es dificil', 10, 498, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (273, 'Reason With The Beast', 11, 353, 28, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (274, 'Mozart', 1, 922, 29, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (275, 'Girls Make My Hair Loose', 2, 550, 29, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (276, 'Got It Twisted', 3, 833, 29, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (278, 'Waiting', 5, 862, 29, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (279, 'Mama Kin', 1, 551, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (280, 'What To Do Crying Waiting Hoping Learning The Game', 2, 532, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (281, 'Librado Maldonado', 3, 357, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (282, 'Money Make The World Go Around', 4, 248, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (283, 'Heute', 5, 67, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (284, 'Crawl Before You Ball (Album Version)', 6, 468, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (285, 'Rock the Spot', 7, 884, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (286, 'No Survivors', 8, 744, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (289, 'Exaltation', 11, 569, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (290, 'Innizar', 12, 188, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (291, 'Stickin In My Eye', 13, 775, 30, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (292, 'Hey Daddy', 1, 558, 31, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (293, 'A Distant Voice', 2, 139, 31, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (294, 'CNN War Theme', 3, 730, 31, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (295, 'Dumb Woman Blues', 1, 516, 32, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (296, 'The Czar: Usurper/Escape/Martyr/Spiral (Album Version)', 2, 187, 32, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (297, 'The Illusionist', 3, 487, 32, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (298, 'Citizen Of The Planet', 4, 347, 32, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (299, 'Thug Queen', 5, 768, 32, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (300, 'Glo-Billy-Vee-Vee', 6, 581, 32, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (301, 'Ponto', 7, 481, 32, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (302, 'The Boss', 8, 724, 32, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (303, 'Round Two Wrap-Up', 1, 254, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (304, 'I Destructor (Lenny Dee Mix)', 2, 861, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (305, 'Te quiero tanto', 3, 949, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (306, 'CNN War Theme', 4, 919, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (307, 'Shooting Stars', 5, 604, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (308, 'Arrival', 6, 661, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (309, 'Drifting From Town To Town', 7, 461, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (311, 'The Girl I Find (LP Version)', 9, 477, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (312, 'Pienso En Ti', 10, 200, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (313, 'Panama (Remastered Album Version)', 11, 292, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (314, 'God Save the Queen (Live)', 12, 254, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (315, 'bPortrait Of Clare (from Portrait Of Clare)', 13, 386, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (316, 'The Joes Mobilize', 14, 906, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (317, 'No Survivors', 15, 262, 33, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (318, 'Airheads', 1, 451, 34, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (319, 'Bo Diddley', 2, 336, 34, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (320, 'Scientas', 3, 533, 34, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (321, 'Pak shte te obicham', 4, 14, 34, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (323, 'You Are The One', 6, 862, 34, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (324, 'Opus a Satana (Part 2)', 7, 331, 34, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (325, 'Come Over', 8, 851, 34, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (326, 'Redwing', 9, 966, 34, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (327, 'Small World', 1, 920, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (328, 'Siyabonga (Unreleased Bonus Track)', 2, 860, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (329, 'Cancion Para Mi Muerte', 3, 112, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (330, 'Hello Young Lovers (LP Version)', 4, 938, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (331, 'They Say (Album)', 5, 212, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (332, 'Mash Up Mi Life', 6, 397, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (333, 'Got My Mojo Workin', 7, 465, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (334, 'Damit Du Dich in mich verliebst', 8, 263, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (335, 'Oh Oh Oh Baby', 9, 337, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (336, 'You Are My Memoir', 10, 89, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (337, 'Inolvidable', 11, 329, 35, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (338, 'The More I See You', 1, 387, 36, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (339, 'Yippiyo-Ay', 2, 425, 36, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (340, 'Did It Again (featuring Kid Cudi)', 3, 368, 36, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (341, 'Abnormal (Acoustic)', 4, 957, 36, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (342, 'Ma Louise', 5, 346, 36, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (343, 'Reason With The Beast', 6, 511, 36, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (344, 'The Painter And The Magician', 7, 774, 36, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (345, 'Rattlesnake!', 1, 873, 37, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (346, 'Mountains Of Mourne', 2, 271, 37, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (347, 'I Worship You', 1, 957, 38, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (348, 'The Ballad Of Sleeping Beauty', 2, 477, 38, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (349, 'Redwing', 3, 91, 38, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (350, 'Journey To Love', 4, 704, 38, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (351, 'Crass Commercialism', 5, 798, 38, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (352, 'Little Bitty Pretty One', 6, 486, 38, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (353, 'Disease', 1, 932, 39, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (354, 'Crying Time', 1, 974, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (355, 'LA River (Acoustic)', 2, 198, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (356, 'Der Wind Hat Mir Ein Lied Erz\xc3\xa4hlt (from La Habanera")"', 3, 836, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (357, 'Walls And Cannonballs (Album)', 4, 404, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (358, 'Solid Gold (Evolution Mix) (2005 Digital Remaster)', 5, 240, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (360, 'Awesome God', 7, 971, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (361, 'Half The Fun', 8, 234, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (362, 'South Side Story', 9, 715, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (363, 'Zalozniy', 10, 182, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (364, 'Young Blood (2007 Digital Remaster)', 11, 180, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (365, 'bI Love You More Than Youll Ever Know (LP Version)', 12, 185, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (367, 'Walk Away', 14, 283, 40, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (368, 'I Want Love (Tween You & Me) (Album Version)', 1, 343, 41, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (369, 'Gold Und Silber', 2, 662, 41, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (370, 'Faithful and True (Collectors Version)', 3, 268, 41, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (371, 'Worrying Over You', 4, 192, 41, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (372, 'My Heart Went That-A-Way', 5, 641, 41, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (373, '7 Miles', 1, 404, 42, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (374, 'Trong Com', 2, 544, 42, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (375, 'bSomethings Missing', 3, 251, 42, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (376, 'Naked Albino', 4, 821, 42, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (377, 'Ruby D.', 5, 449, 42, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (378, 'God Will Make A Way', 6, 504, 42, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (379, 'Fernando', 1, 812, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (381, 'Skinhead on the MBTA (Album Version)', 3, 196, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (382, 'I Will Always Love You', 4, 199, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (383, 'The Look Of Love', 5, 653, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (384, 'Mad World (Money-G. Remix)', 6, 693, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (385, 'Hey Joe', 7, 853, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (386, 'Morena Boca De Ouro', 8, 902, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (387, 'The Blessing', 9, 797, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (388, 'Brand New Broken Heart', 10, 419, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (389, 'Brazil Mon Amour', 11, 358, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (390, 'Go To Hell', 12, 105, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (391, 'Too Much Saturn', 13, 913, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (392, 'Youlan_ Lonely Orchid (solo guqin)', 14, 495, 43, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (394, 'The Thrill Is Gone', 1, 517, 44, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (395, 'Fausse monnaie', 2, 308, 44, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (396, 'Taste Of Dis (Explicit Version)', 3, 589, 44, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (397, 'Hungarian Dances_ WoO 1: No. 12 in D Minor: Presto', 4, 817, 44, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (398, 'On My Feet Again', 5, 611, 44, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (399, 'Terapia De Amor Intensiva', 6, 283, 44, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (400, 'Commercial Reign', 7, 131, 44, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (401, 'Baby You Got What It Takes - Original', 1, 588, 45, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (403, 'Faithful and True (Collectors Version)', 2, 398, 46, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (404, 'Smoke Screen', 3, 70, 46, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (405, 'Moon Going Down', 4, 597, 46, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (406, 'Punchdrunk', 1, 55, 47, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (407, 'Someone to Watch Over Me', 1, 508, 48, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (408, 'Red Balloon', 1, 374, 49, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (409, 'bNice N Easy', 2, 63, 49, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (410, 'Swallow The Knife (Live) (Segue)', 3, 968, 49, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (411, 'Si No Te Hubieras Ido', 4, 54, 49, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (412, 'When Those Two Towers Fell', 5, 416, 49, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (413, 'Una na na', 6, 358, 49, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (414, 'Flores Negras', 7, 577, 49, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (415, 'Solamente Una Vez', 8, 775, 49, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (416, 'To Sinnefo', 1, 361, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (417, 'I Never Came', 2, 238, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (418, 'Shadows That Move', 3, 520, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (419, 'LA River (Acoustic)', 4, 410, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (420, 'Haunting', 5, 632, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (421, 'Nordcore', 6, 626, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (423, 'Crawl Before You Ball (Album Version)', 8, 749, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (424, '56 Days', 9, 931, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (425, 'Exchange', 10, 739, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (426, 'Que Cosas_ Que Cosas', 11, 362, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (427, 'I Love You And You Love Me', 12, 809, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (428, 'Under World Du', 13, 391, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (429, 'Crazy Mixed Up World', 14, 656, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (430, 'Caroline', 15, 680, 50, NULL);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (82, 'bYour God Isnt Listening', 2, 419, 10, 9);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (92, 'All Kind of People', 3, 134, 11, 2);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (97, 'End Of The Road (Head Horny\x19s Remix)', 8, 406, 11, 3);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (116, 'Redwing', 10, 528, 14, 3);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (122, 'Please Remember Me', 3, 702, 15, 7);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (152, 'Trouble In The City', 12, 542, 17, 2);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (162, 'Old Times Sake', 9, 83, 18, 10);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (164, 'Young Boy Blues', 11, 442, 18, 5);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (170, 'Infidel', 17, 194, 18, 6);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (211, 'The Greed Of Our Stare', 4, 220, 22, 5);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (230, 'Salt In NYC', 15, 304, 23, 5);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (254, 'A Day In The Life (Album Version)', 8, 995, 26, 7);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (257, 'It Wont Be Christmas', 11, 428, 26, 8);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (262, 'Make Me Over', 1, 7, 27, 10);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (277, 'Heute', 4, 584, 29, 9);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (287, 'Le temps des cerises', 9, 129, 30, 5);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (288, 'Prelude And Fugue In C Major BWV 545 : Prelude', 10, 635, 30, 7);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (310, 'Redwing', 8, 454, 33, 5);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (322, 'I Will Always Love You', 5, 368, 34, 7);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (359, 'There Are Things I Think You Should Know', 6, 466, 40, 3);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (366, 'Johnny Loves Me (LP Version)', 13, 4, 40, 6);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (380, 'God Bless You (Goddamn it)', 2, 150, 43, 3);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (393, 'Girls Girls', 15, 875, 43, 4);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (402, 'Close Up', 1, 452, 46, 1);
INSERT INTO public.songs (song_id, name, "position", length_sec, album_id, artist_id) OVERRIDING SYSTEM VALUE VALUES (422, 'Hai Shava', 7, 853, 50, 7);


--
-- Name: albums_album_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_album_id_seq', 50, true);


--
-- Name: artists_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_artist_id_seq', 10, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 45, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 450, true);


--
-- Name: songs_song_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.songs_song_id_seq', 430, true);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (artist_id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: order_lines order_lines_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_pkey PRIMARY KEY (order_id, album_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: songs songs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_pkey PRIMARY KEY (song_id);


--
-- Name: albums albums_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: order_lines order_lines_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: order_lines order_lines_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_lines
    ADD CONSTRAINT order_lines_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: songs songs_album_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: songs songs_artist_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.songs
    ADD CONSTRAINT songs_artist_id_fkey FOREIGN KEY (artist_id) REFERENCES public.artists(artist_id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--
