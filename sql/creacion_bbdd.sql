--
-- PostgreSQL database dump
--

\restrict fdn1mHO081ixgHJfrmMYTKQnNAPkxfGhdMVaE9h2bE5TofquvpdwOVnkQ1KLNfw

-- Dumped from database version 18.3 (Debian 18.3-1.pgdg12+1)
-- Dumped by pg_dump version 18.2

-- Started on 2026-04-09 21:32:37 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: main_usr_db_x
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO main_usr_db_x;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 17009)
-- Name: aula; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.aula (
    id integer NOT NULL,
    nombre text NOT NULL,
    capacidad integer,
    superficie real,
    campus_id integer
);


ALTER TABLE public.aula OWNER TO main_usr_db_x;

--
-- TOC entry 220 (class 1259 OID 17016)
-- Name: aula_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.aula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aula_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3506 (class 0 OID 0)
-- Dependencies: 220
-- Name: aula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.aula_id_seq OWNED BY public.aula.id;


--
-- TOC entry 221 (class 1259 OID 17017)
-- Name: campus; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.campus (
    id integer NOT NULL,
    nombre text,
    ciudad text,
    codigo_postal text
);


ALTER TABLE public.campus OWNER TO main_usr_db_x;

--
-- TOC entry 222 (class 1259 OID 17023)
-- Name: campus_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.campus_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.campus_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3507 (class 0 OID 0)
-- Dependencies: 222
-- Name: campus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.campus_id_seq OWNED BY public.campus.id;


--
-- TOC entry 223 (class 1259 OID 17024)
-- Name: estudiante; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.estudiante (
    id integer NOT NULL,
    nombre text NOT NULL,
    apellido1 text NOT NULL,
    apellido2 text,
    correo text,
    telefono text,
    fecha_nacimiento date
);


ALTER TABLE public.estudiante OWNER TO main_usr_db_x;

--
-- TOC entry 224 (class 1259 OID 17032)
-- Name: estudiante_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.estudiante_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiante_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3508 (class 0 OID 0)
-- Dependencies: 224
-- Name: estudiante_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.estudiante_id_seq OWNED BY public.estudiante.id;


--
-- TOC entry 225 (class 1259 OID 17033)
-- Name: evaluacion; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.evaluacion (
    id integer NOT NULL,
    calificacion text,
    fecha date,
    proyecto_id integer,
    estudiante_id integer,
    profesor_id integer,
    CONSTRAINT evaluacion_calificacion_validacion CHECK ((calificacion = ANY (ARRAY['APTO'::text, 'NO_APTO'::text])))
);


ALTER TABLE public.evaluacion OWNER TO main_usr_db_x;

--
-- TOC entry 226 (class 1259 OID 17040)
-- Name: evaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.evaluacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.evaluacion_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3509 (class 0 OID 0)
-- Dependencies: 226
-- Name: evaluacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.evaluacion_id_seq OWNED BY public.evaluacion.id;


--
-- TOC entry 227 (class 1259 OID 17041)
-- Name: modalidad; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.modalidad (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.modalidad OWNER TO main_usr_db_x;

--
-- TOC entry 228 (class 1259 OID 17048)
-- Name: modalidad_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.modalidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modalidad_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3510 (class 0 OID 0)
-- Dependencies: 228
-- Name: modalidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.modalidad_id_seq OWNED BY public.modalidad.id;


--
-- TOC entry 229 (class 1259 OID 17049)
-- Name: profesor; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.profesor (
    id integer NOT NULL,
    nombre text NOT NULL,
    apellido1 text NOT NULL,
    apellido2 text,
    correo text,
    telefono text,
    rol_id integer,
    campus_id integer NOT NULL
);


ALTER TABLE public.profesor OWNER TO main_usr_db_x;

--
-- TOC entry 230 (class 1259 OID 17057)
-- Name: profesor_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.profesor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profesor_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3511 (class 0 OID 0)
-- Dependencies: 230
-- Name: profesor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.profesor_id_seq OWNED BY public.profesor.id;


--
-- TOC entry 231 (class 1259 OID 17058)
-- Name: profesor_programa; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.profesor_programa (
    profesor_id integer NOT NULL,
    programa_id integer NOT NULL
);


ALTER TABLE public.profesor_programa OWNER TO main_usr_db_x;

--
-- TOC entry 232 (class 1259 OID 17063)
-- Name: programa; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.programa (
    id integer NOT NULL,
    nombre text,
    descripcion text
);


ALTER TABLE public.programa OWNER TO main_usr_db_x;

--
-- TOC entry 233 (class 1259 OID 17069)
-- Name: programa_aula; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.programa_aula (
    programa_id integer NOT NULL,
    aula_id integer NOT NULL
);


ALTER TABLE public.programa_aula OWNER TO main_usr_db_x;

--
-- TOC entry 234 (class 1259 OID 17074)
-- Name: programa_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.programa_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programa_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3512 (class 0 OID 0)
-- Dependencies: 234
-- Name: programa_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.programa_id_seq OWNED BY public.programa.id;


--
-- TOC entry 235 (class 1259 OID 17075)
-- Name: promocion; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.promocion (
    id integer NOT NULL,
    fecha_inicio date,
    fecha_fin date,
    programa_id integer,
    aula_id integer,
    CONSTRAINT promocion_fechas_validacion CHECK ((fecha_fin > fecha_inicio))
);


ALTER TABLE public.promocion OWNER TO main_usr_db_x;

--
-- TOC entry 236 (class 1259 OID 17080)
-- Name: promocion_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.promocion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promocion_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 236
-- Name: promocion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.promocion_id_seq OWNED BY public.promocion.id;


--
-- TOC entry 237 (class 1259 OID 17081)
-- Name: promocion_modalidad; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.promocion_modalidad (
    promocion_id integer NOT NULL,
    modalidad_id integer NOT NULL
);


ALTER TABLE public.promocion_modalidad OWNER TO main_usr_db_x;

--
-- TOC entry 238 (class 1259 OID 17086)
-- Name: promocion_modalidad_estudiante; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.promocion_modalidad_estudiante (
    promocion_id integer NOT NULL,
    modalidad_id integer NOT NULL,
    estudiante_id integer NOT NULL
);


ALTER TABLE public.promocion_modalidad_estudiante OWNER TO main_usr_db_x;

--
-- TOC entry 239 (class 1259 OID 17092)
-- Name: proyecto; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.proyecto (
    id integer NOT NULL,
    nombre text NOT NULL,
    descripcion text
);


ALTER TABLE public.proyecto OWNER TO main_usr_db_x;

--
-- TOC entry 243 (class 1259 OID 17350)
-- Name: proyecto_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.proyecto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.proyecto_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 243
-- Name: proyecto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.proyecto_id_seq OWNED BY public.proyecto.id;


--
-- TOC entry 240 (class 1259 OID 17099)
-- Name: proyecto_programa; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.proyecto_programa (
    proyecto_id integer NOT NULL,
    programa_id integer NOT NULL
);


ALTER TABLE public.proyecto_programa OWNER TO main_usr_db_x;

--
-- TOC entry 241 (class 1259 OID 17104)
-- Name: rol; Type: TABLE; Schema: public; Owner: main_usr_db_x
--

CREATE TABLE public.rol (
    id integer NOT NULL,
    nombre text NOT NULL
);


ALTER TABLE public.rol OWNER TO main_usr_db_x;

--
-- TOC entry 242 (class 1259 OID 17111)
-- Name: rol_id_seq; Type: SEQUENCE; Schema: public; Owner: main_usr_db_x
--

CREATE SEQUENCE public.rol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.rol_id_seq OWNER TO main_usr_db_x;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 242
-- Name: rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: main_usr_db_x
--

ALTER SEQUENCE public.rol_id_seq OWNED BY public.rol.id;


--
-- TOC entry 3294 (class 2604 OID 17112)
-- Name: aula id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.aula ALTER COLUMN id SET DEFAULT nextval('public.aula_id_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 17113)
-- Name: campus id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.campus ALTER COLUMN id SET DEFAULT nextval('public.campus_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 17114)
-- Name: estudiante id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.estudiante ALTER COLUMN id SET DEFAULT nextval('public.estudiante_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 17115)
-- Name: evaluacion id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.evaluacion ALTER COLUMN id SET DEFAULT nextval('public.evaluacion_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 17116)
-- Name: modalidad id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.modalidad ALTER COLUMN id SET DEFAULT nextval('public.modalidad_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 17117)
-- Name: profesor id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.profesor ALTER COLUMN id SET DEFAULT nextval('public.profesor_id_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 17118)
-- Name: programa id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.programa ALTER COLUMN id SET DEFAULT nextval('public.programa_id_seq'::regclass);


--
-- TOC entry 3301 (class 2604 OID 17119)
-- Name: promocion id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion ALTER COLUMN id SET DEFAULT nextval('public.promocion_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 17478)
-- Name: proyecto id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.proyecto ALTER COLUMN id SET DEFAULT nextval('public.proyecto_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 17120)
-- Name: rol id; Type: DEFAULT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.rol ALTER COLUMN id SET DEFAULT nextval('public.rol_id_seq'::regclass);


--
-- TOC entry 3307 (class 2606 OID 17122)
-- Name: aula aula_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.aula
    ADD CONSTRAINT aula_pkey PRIMARY KEY (id);


--
-- TOC entry 3309 (class 2606 OID 17124)
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 17126)
-- Name: estudiante estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 17128)
-- Name: evaluacion evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_pkey PRIMARY KEY (id);


--
-- TOC entry 3315 (class 2606 OID 17130)
-- Name: modalidad modalidad_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.modalidad
    ADD CONSTRAINT modalidad_pkey PRIMARY KEY (id);


--
-- TOC entry 3317 (class 2606 OID 17132)
-- Name: profesor profesor_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 17134)
-- Name: profesor_programa profesor_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.profesor_programa
    ADD CONSTRAINT profesor_programa_pkey PRIMARY KEY (profesor_id, programa_id);


--
-- TOC entry 3323 (class 2606 OID 17136)
-- Name: programa_aula programa_aula_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.programa_aula
    ADD CONSTRAINT programa_aula_pkey PRIMARY KEY (programa_id, aula_id);


--
-- TOC entry 3321 (class 2606 OID 17138)
-- Name: programa programa_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.programa
    ADD CONSTRAINT programa_pkey PRIMARY KEY (id);


--
-- TOC entry 3329 (class 2606 OID 17140)
-- Name: promocion_modalidad_estudiante promocion_modalidad_estudiante_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion_modalidad_estudiante
    ADD CONSTRAINT promocion_modalidad_estudiante_pkey PRIMARY KEY (promocion_id, modalidad_id, estudiante_id);


--
-- TOC entry 3327 (class 2606 OID 17142)
-- Name: promocion_modalidad promocion_modalidad_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion_modalidad
    ADD CONSTRAINT promocion_modalidad_pkey PRIMARY KEY (promocion_id, modalidad_id);


--
-- TOC entry 3325 (class 2606 OID 17144)
-- Name: promocion promocion_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT promocion_pkey PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 17146)
-- Name: proyecto proyecto_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.proyecto
    ADD CONSTRAINT proyecto_pkey PRIMARY KEY (id);


--
-- TOC entry 3333 (class 2606 OID 17148)
-- Name: proyecto_programa proyecto_programa_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.proyecto_programa
    ADD CONSTRAINT proyecto_programa_pkey PRIMARY KEY (proyecto_id, programa_id);


--
-- TOC entry 3335 (class 2606 OID 17150)
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 17151)
-- Name: aula aula_campus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.aula
    ADD CONSTRAINT aula_campus_id_fkey FOREIGN KEY (campus_id) REFERENCES public.campus(id);


--
-- TOC entry 3337 (class 2606 OID 17156)
-- Name: evaluacion evaluacion_estudiante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id);


--
-- TOC entry 3338 (class 2606 OID 17161)
-- Name: evaluacion evaluacion_profesor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.profesor(id);


--
-- TOC entry 3339 (class 2606 OID 17166)
-- Name: evaluacion evaluacion_proyecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.evaluacion
    ADD CONSTRAINT evaluacion_proyecto_id_fkey FOREIGN KEY (proyecto_id) REFERENCES public.proyecto(id);


--
-- TOC entry 3350 (class 2606 OID 17171)
-- Name: promocion_modalidad_estudiante pme_promo_mod_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion_modalidad_estudiante
    ADD CONSTRAINT pme_promo_mod_fkey FOREIGN KEY (promocion_id, modalidad_id) REFERENCES public.promocion_modalidad(promocion_id, modalidad_id);


--
-- TOC entry 3340 (class 2606 OID 17414)
-- Name: profesor profesor_campus_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_campus_id_fkey FOREIGN KEY (campus_id) REFERENCES public.campus(id);


--
-- TOC entry 3342 (class 2606 OID 17176)
-- Name: profesor_programa profesor_programa_profesor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.profesor_programa
    ADD CONSTRAINT profesor_programa_profesor_id_fkey FOREIGN KEY (profesor_id) REFERENCES public.profesor(id);


--
-- TOC entry 3343 (class 2606 OID 17181)
-- Name: profesor_programa profesor_programa_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.profesor_programa
    ADD CONSTRAINT profesor_programa_programa_id_fkey FOREIGN KEY (programa_id) REFERENCES public.programa(id);


--
-- TOC entry 3341 (class 2606 OID 17186)
-- Name: profesor profesor_rol_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.profesor
    ADD CONSTRAINT profesor_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES public.rol(id);


--
-- TOC entry 3344 (class 2606 OID 17191)
-- Name: programa_aula programa_aula_aula_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.programa_aula
    ADD CONSTRAINT programa_aula_aula_id_fkey FOREIGN KEY (aula_id) REFERENCES public.aula(id);


--
-- TOC entry 3345 (class 2606 OID 17196)
-- Name: programa_aula programa_aula_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.programa_aula
    ADD CONSTRAINT programa_aula_programa_id_fkey FOREIGN KEY (programa_id) REFERENCES public.programa(id);


--
-- TOC entry 3346 (class 2606 OID 17201)
-- Name: promocion promocion_aula_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT promocion_aula_id_fkey FOREIGN KEY (aula_id) REFERENCES public.aula(id);


--
-- TOC entry 3351 (class 2606 OID 17206)
-- Name: promocion_modalidad_estudiante promocion_modalidad_estudiante_estudiante_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion_modalidad_estudiante
    ADD CONSTRAINT promocion_modalidad_estudiante_estudiante_id_fkey FOREIGN KEY (estudiante_id) REFERENCES public.estudiante(id);


--
-- TOC entry 3348 (class 2606 OID 17211)
-- Name: promocion_modalidad promocion_modalidad_modalidad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion_modalidad
    ADD CONSTRAINT promocion_modalidad_modalidad_id_fkey FOREIGN KEY (modalidad_id) REFERENCES public.modalidad(id);


--
-- TOC entry 3349 (class 2606 OID 17216)
-- Name: promocion_modalidad promocion_modalidad_promocion_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion_modalidad
    ADD CONSTRAINT promocion_modalidad_promocion_id_fkey FOREIGN KEY (promocion_id) REFERENCES public.promocion(id);


--
-- TOC entry 3347 (class 2606 OID 17221)
-- Name: promocion promocion_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.promocion
    ADD CONSTRAINT promocion_programa_id_fkey FOREIGN KEY (programa_id) REFERENCES public.programa(id);


--
-- TOC entry 3352 (class 2606 OID 17226)
-- Name: proyecto_programa proyecto_programa_programa_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.proyecto_programa
    ADD CONSTRAINT proyecto_programa_programa_id_fkey FOREIGN KEY (programa_id) REFERENCES public.programa(id);


--
-- TOC entry 3353 (class 2606 OID 17231)
-- Name: proyecto_programa proyecto_programa_proyecto_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: main_usr_db_x
--

ALTER TABLE ONLY public.proyecto_programa
    ADD CONSTRAINT proyecto_programa_proyecto_id_fkey FOREIGN KEY (proyecto_id) REFERENCES public.proyecto(id);


--
-- TOC entry 2118 (class 826 OID 16391)
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON SEQUENCES TO main_usr_db_x;


--
-- TOC entry 2120 (class 826 OID 16393)
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TYPES TO main_usr_db_x;


--
-- TOC entry 2119 (class 826 OID 16392)
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON FUNCTIONS TO main_usr_db_x;


--
-- TOC entry 2117 (class 826 OID 16390)
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: -; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres GRANT ALL ON TABLES TO main_usr_db_x;


-- Completed on 2026-04-09 21:32:53 CEST

--
-- PostgreSQL database dump complete
--

\unrestrict fdn1mHO081ixgHJfrmMYTKQnNAPkxfGhdMVaE9h2bE5TofquvpdwOVnkQ1KLNfw

