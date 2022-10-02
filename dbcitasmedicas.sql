--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: cita_medica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cita_medica (
    cedula_paciente character varying NOT NULL,
    cedula_doctor character varying,
    fecha_programada date,
    hora_programada time without time zone,
    estado character varying NOT NULL,
    consultorio character varying,
    codigo_citamedica integer NOT NULL
);


ALTER TABLE public.cita_medica OWNER TO postgres;

--
-- Name: cita_medica_codigo_citamedica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cita_medica_codigo_citamedica_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cita_medica_codigo_citamedica_seq OWNER TO postgres;

--
-- Name: cita_medica_codigo_citamedica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cita_medica_codigo_citamedica_seq OWNED BY public.cita_medica.codigo_citamedica;


--
-- Name: doctor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.doctor (
    cedula_doctor character varying NOT NULL,
    nombre_doctor character varying NOT NULL,
    apellidos_doctor character varying NOT NULL,
    telefono_doctor character varying NOT NULL,
    correo_doctor character varying
);


ALTER TABLE public.doctor OWNER TO postgres;

--
-- Name: especializacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.especializacion (
    id_especializacion integer NOT NULL,
    nombre character varying NOT NULL
);


ALTER TABLE public.especializacion OWNER TO postgres;

--
-- Name: especializacion_id_especializacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.especializacion_id_especializacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.especializacion_id_especializacion_seq OWNER TO postgres;

--
-- Name: especializacion_id_especializacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.especializacion_id_especializacion_seq OWNED BY public.especializacion.id_especializacion;


--
-- Name: formula_medica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.formula_medica (
    codigo_registro integer NOT NULL,
    codigo_medicamento character varying NOT NULL,
    cantidad_solicitada integer NOT NULL,
    indicaciones character varying NOT NULL
);


ALTER TABLE public.formula_medica OWNER TO postgres;

--
-- Name: lista_especializaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lista_especializaciones (
    cedula_doctor character varying NOT NULL,
    id_especializacion integer NOT NULL
);


ALTER TABLE public.lista_especializaciones OWNER TO postgres;

--
-- Name: medicamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicamento (
    codigo_medicamento character varying NOT NULL,
    nombre_medicamento character varying NOT NULL,
    presentacion character varying NOT NULL
);


ALTER TABLE public.medicamento OWNER TO postgres;

--
-- Name: paciente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paciente (
    cedula_paciente character varying NOT NULL,
    nombre_paciente character varying NOT NULL,
    apellidos_paciente character varying NOT NULL,
    edad_paciente integer,
    telefono_paciente character varying NOT NULL,
    correo_paciente character varying
);


ALTER TABLE public.paciente OWNER TO postgres;

--
-- Name: registro_cita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registro_cita (
    codigo_registro integer NOT NULL,
    codigo_citamedica integer NOT NULL,
    detalle character varying NOT NULL
);


ALTER TABLE public.registro_cita OWNER TO postgres;

--
-- Name: registro_cita_codigo_registro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registro_cita_codigo_registro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registro_cita_codigo_registro_seq OWNER TO postgres;

--
-- Name: registro_cita_codigo_registro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registro_cita_codigo_registro_seq OWNED BY public.registro_cita.codigo_registro;


--
-- Name: cita_medica codigo_citamedica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita_medica ALTER COLUMN codigo_citamedica SET DEFAULT nextval('public.cita_medica_codigo_citamedica_seq'::regclass);


--
-- Name: especializacion id_especializacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especializacion ALTER COLUMN id_especializacion SET DEFAULT nextval('public.especializacion_id_especializacion_seq'::regclass);


--
-- Name: registro_cita codigo_registro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_cita ALTER COLUMN codigo_registro SET DEFAULT nextval('public.registro_cita_codigo_registro_seq'::regclass);


--
-- Data for Name: cita_medica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cita_medica (cedula_paciente, cedula_doctor, fecha_programada, hora_programada, estado, consultorio, codigo_citamedica) FROM stdin;
591-82-9684	150-29-0714	2022-05-15	12:09:00	Cancelada	Piso 2 - 204	1
108-54-4692	218-50-3924	2022-06-28	14:41:00	Programada	Piso 2 - 208	2
591-82-9684	617-64-3715	2022-04-04	15:55:00	Realizada	Piso 2 - 201	3
591-82-9684	\N	\N	\N	Sin asignar	Piso 2 - 208	4
544-23-9900	617-64-3715	2022-08-18	13:59:00	Programada	Piso 3 - 306	5
257-23-7851	\N	\N	\N	Sin asignar	Piso 2 - 204	6
591-82-9684	150-29-0714	2022-10-13	13:43:00	Realizada	Piso 3 - 305	7
591-82-9684	661-85-9238	2022-07-31	17:39:00	Realizada	Piso 3 - 301	8
445-95-7586	639-25-4402	2022-02-26	12:54:00	Realizada	Piso 2 - 201	9
203-42-9150	\N	\N	\N	Sin asignar	Piso 3 - 309	10
591-82-9684	661-85-9238	2022-05-29	12:57:00	Programada	Piso 3 - 301	11
544-23-9900	726-89-6879	2022-05-16	14:29:00	Realizada	Piso 2 - 201	12
\.


--
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.doctor (cedula_doctor, nombre_doctor, apellidos_doctor, telefono_doctor, correo_doctor) FROM stdin;
857-42-4674	Joell	Jeandin	550-326-4093	jjeandin0@51.la
282-42-8969	Rem	Collopy	762-210-5119	rcollopy1@abc.net.au
726-89-6879	Tirrell	Asbrey	321-270-8013	tasbrey2@tamu.edu
617-64-3715	Coralie	Lutton	555-616-5172	clutton3@weibo.com
661-85-9238	Raphaela	Coutts	497-210-1289	rcoutts4@devhub.com
639-25-4402	Wyatan	Fearey	916-652-6171	wfearey5@cyberchimps.com
150-29-0714	Enrichetta	Bryceson	482-191-3381	ebryceson6@adobe.com
218-50-3924	Philippa	Wrotchford	274-890-0581	pwrotchford7@liveinternet.ru
\.


--
-- Data for Name: especializacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.especializacion (id_especializacion, nombre) FROM stdin;
1	Dermatología
2	Anatomía Patológica
3	Cirugía Plástica y Reconstructiva
4	Angiología y Cirugía Vascular y Endovascular
5	Cirugía Pediátrica
\.


--
-- Data for Name: formula_medica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.formula_medica (codigo_registro, codigo_medicamento, cantidad_solicitada, indicaciones) FROM stdin;
1	49349-148	8	Tomar 1 x día
2	51079-520	4	Tomar 1 x día
3	49349-148	12	Tomar una cada 8h
4	66129-151	8	Tomar una cada 4h
5	43598-205	5	Tomar una cada 12 h
1	49349-622	6	Tomar 1 x día
2	55505-111	10	Tomar una cada 12 h
3	43598-205	9	Tomar 1 x día
4	49349-148	11	Tomar una cada 8h
5	51079-520	8	Tomar 1 x día
\.


--
-- Data for Name: lista_especializaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lista_especializaciones (cedula_doctor, id_especializacion) FROM stdin;
857-42-4674	5
282-42-8969	4
726-89-6879	1
617-64-3715	5
661-85-9238	3
639-25-4402	3
150-29-0714	4
218-50-3924	1
857-42-4674	4
282-42-8969	1
\.


--
-- Data for Name: medicamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicamento (codigo_medicamento, nombre_medicamento, presentacion) FROM stdin;
49349-148	ACETAMINOFEN	500MG TABLETA
49349-753	ACETATO DE ALUMINIO	6.15G / 100ML SUSPENSIÓN ORAL
43598-205	ACICLOVIR	0.09 CREMA
66129-151	ALCANFOR + MENTOL	3 G + 2 G / 100 G UNGÜENTO TÓPICO
51079-520	BENZOCAÍNA	10 MG TABLETA MASTICABLE
49349-622	CROTAMITON	0.1 LOCIÓN
55505-111	DESLORATADINA	5MG TABLETA
65903-276	GLICERIL GUAYACOLATO (GUAIFENESINA)	1G / 100ML JARABE
24385-152	IBUPROFENO	100 MG TABLETA
\.


--
-- Data for Name: paciente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paciente (cedula_paciente, nombre_paciente, apellidos_paciente, edad_paciente, telefono_paciente, correo_paciente) FROM stdin;
445-95-7586	Shelli	Bernardotti	43	333 640 0901	sbernardotti0@youtu.be
108-54-4692	Stefa	Dohms	48	255 212 4765	sdohms1@domainmarket.com
544-23-9900	Godiva	Ruppertz	97	309 609 0465	gruppertz2@cnet.com
203-42-9150	Chlo	Pouton	56	436 959 2900	cpouton3@msu.edu
585-91-8599	Northrop	Saladino	17	476 982 2254	nsaladino4@hud.gov
851-26-0213	Fredrika	Berrisford	81	150 157 0831	fberrisford5@sina.com.cn
591-82-9684	Jemima	Lortzing	60	936 356 8078	jlortzing6@blogtalkradio.com
257-23-7851	Benny	Cawkill	8	309 695 6211	bcawkill7@tiny.cc
\.


--
-- Data for Name: registro_cita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.registro_cita (codigo_registro, codigo_citamedica, detalle) FROM stdin;
1	3	El paciente viene por un dolor fuerte de cabeza
2	7	El paciente viene por un dolor fuerte en el pie causado por un accidente en casa
3	8	El paciente viene por dolor estomacal
4	9	El paciente viene por un dolor fuerte en el pie causado por un accidente en casa
5	12	El paciente viene por un dolor fuerte en el pie causado por un accidente en casa
\.


--
-- Name: cita_medica_codigo_citamedica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cita_medica_codigo_citamedica_seq', 16, true);


--
-- Name: especializacion_id_especializacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.especializacion_id_especializacion_seq', 20, true);


--
-- Name: registro_cita_codigo_registro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registro_cita_codigo_registro_seq', 5, true);


--
-- Name: cita_medica pk_cita; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita_medica
    ADD CONSTRAINT pk_cita PRIMARY KEY (codigo_citamedica);


--
-- Name: doctor pk_doctor; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT pk_doctor PRIMARY KEY (cedula_doctor);


--
-- Name: especializacion pk_especializacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.especializacion
    ADD CONSTRAINT pk_especializacion PRIMARY KEY (id_especializacion);


--
-- Name: formula_medica pk_formulamedica; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_medica
    ADD CONSTRAINT pk_formulamedica PRIMARY KEY (codigo_registro, codigo_medicamento);


--
-- Name: lista_especializaciones pk_lista_especializacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_especializaciones
    ADD CONSTRAINT pk_lista_especializacion PRIMARY KEY (cedula_doctor, id_especializacion);


--
-- Name: medicamento pk_medicamento; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamento
    ADD CONSTRAINT pk_medicamento PRIMARY KEY (codigo_medicamento);


--
-- Name: paciente pk_paciente; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paciente
    ADD CONSTRAINT pk_paciente PRIMARY KEY (cedula_paciente);


--
-- Name: registro_cita pk_registrocita; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_cita
    ADD CONSTRAINT pk_registrocita PRIMARY KEY (codigo_registro);


--
-- Name: registro_cita fk_citamedica; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_cita
    ADD CONSTRAINT fk_citamedica FOREIGN KEY (codigo_citamedica) REFERENCES public.cita_medica(codigo_citamedica);


--
-- Name: lista_especializaciones fk_doctor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_especializaciones
    ADD CONSTRAINT fk_doctor FOREIGN KEY (cedula_doctor) REFERENCES public.doctor(cedula_doctor);


--
-- Name: cita_medica fk_doctor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita_medica
    ADD CONSTRAINT fk_doctor FOREIGN KEY (cedula_doctor) REFERENCES public.doctor(cedula_doctor);


--
-- Name: lista_especializaciones fk_especializacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lista_especializaciones
    ADD CONSTRAINT fk_especializacion FOREIGN KEY (id_especializacion) REFERENCES public.especializacion(id_especializacion);


--
-- Name: formula_medica fk_medicamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_medica
    ADD CONSTRAINT fk_medicamento FOREIGN KEY (codigo_medicamento) REFERENCES public.medicamento(codigo_medicamento);


--
-- Name: cita_medica fk_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita_medica
    ADD CONSTRAINT fk_paciente FOREIGN KEY (cedula_paciente) REFERENCES public.paciente(cedula_paciente);


--
-- Name: formula_medica fk_registrocita; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.formula_medica
    ADD CONSTRAINT fk_registrocita FOREIGN KEY (codigo_registro) REFERENCES public.registro_cita(codigo_registro);


--
-- PostgreSQL database dump complete
--

