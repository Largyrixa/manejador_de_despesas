--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5 (Debian 17.5-1.pgdg120+1)
-- Dumped by pg_dump version 17.4

-- Started on 2025-06-16 17:37:59

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

DROP DATABASE IF EXISTS expenses;
--
-- TOC entry 3382 (class 1262 OID 16388)
-- Name: expenses; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE expenses WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE expenses OWNER TO postgres;

\connect expenses

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 16389)
-- Name: classificacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classificacao (
    id_classificacao bigint NOT NULL,
    desc_classificacao character varying(100) NOT NULL,
    id_tipo_classificacao character(1) NOT NULL
);


ALTER TABLE public.classificacao OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE classificacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.classificacao IS 'Classificação das entradas/saídas';


--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN classificacao.id_classificacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.classificacao.id_classificacao IS 'Chave Primária';


--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN classificacao.desc_classificacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.classificacao.desc_classificacao IS 'Descrição da Classificação';


--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 217
-- Name: COLUMN classificacao.id_tipo_classificacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.classificacao.id_tipo_classificacao IS 'Identificador';


--
-- TOC entry 218 (class 1259 OID 16392)
-- Name: classificacao_id_classificacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.classificacao ALTER COLUMN id_classificacao ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.classificacao_id_classificacao_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 219 (class 1259 OID 16393)
-- Name: registro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registro (
    id_registro bigint NOT NULL,
    dt_registro date NOT NULL,
    valor numeric(10,4) NOT NULL,
    id_classificacao bigint NOT NULL
);


ALTER TABLE public.registro OWNER TO postgres;

--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.registro IS 'Registro de Movimentação';


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN registro.id_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registro.id_registro IS 'Chave Primária';


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN registro.dt_registro; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registro.dt_registro IS 'Data do Registro';


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN registro.valor; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registro.valor IS 'Valor do registro';


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 219
-- Name: COLUMN registro.id_classificacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.registro.id_classificacao IS 'Chave Primária';


--
-- TOC entry 220 (class 1259 OID 16396)
-- Name: registro_id_registro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.registro ALTER COLUMN id_registro ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.registro_id_registro_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 221 (class 1259 OID 16397)
-- Name: tipo_classificacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_classificacao (
    id_tipo_classificacao character(1) NOT NULL,
    descricao character varying(10) NOT NULL,
    sinal integer NOT NULL
);


ALTER TABLE public.tipo_classificacao OWNER TO postgres;

--
-- TOC entry 3393 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE tipo_classificacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.tipo_classificacao IS 'Tipo de Classificação
Débito (saída, negativo) = D
Crédito (entrada, positivo) = C';


--
-- TOC entry 3394 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN tipo_classificacao.id_tipo_classificacao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tipo_classificacao.id_tipo_classificacao IS 'Identificador';


--
-- TOC entry 3395 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN tipo_classificacao.descricao; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tipo_classificacao.descricao IS 'Descrição do tipo';


--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 221
-- Name: COLUMN tipo_classificacao.sinal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.tipo_classificacao.sinal IS 'Sinal do Tipo
+1
-1';


--
-- TOC entry 3372 (class 0 OID 16389)
-- Dependencies: 217
-- Data for Name: classificacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.classificacao (id_classificacao, desc_classificacao, id_tipo_classificacao) OVERRIDING SYSTEM VALUE VALUES (1, 'Mesada Mamãe', 'C') ON CONFLICT DO NOTHING;
INSERT INTO public.classificacao (id_classificacao, desc_classificacao, id_tipo_classificacao) OVERRIDING SYSTEM VALUE VALUES (2, 'Mesada Papai', 'C') ON CONFLICT DO NOTHING;
INSERT INTO public.classificacao (id_classificacao, desc_classificacao, id_tipo_classificacao) OVERRIDING SYSTEM VALUE VALUES (3, 'Almoço', 'D') ON CONFLICT DO NOTHING;
INSERT INTO public.classificacao (id_classificacao, desc_classificacao, id_tipo_classificacao) OVERRIDING SYSTEM VALUE VALUES (4, 'Ônibus', 'D') ON CONFLICT DO NOTHING;
INSERT INTO public.classificacao (id_classificacao, desc_classificacao, id_tipo_classificacao) OVERRIDING SYSTEM VALUE VALUES (5, 'Barbeiro', 'D') ON CONFLICT DO NOTHING;


--
-- TOC entry 3374 (class 0 OID 16393)
-- Dependencies: 219
-- Data for Name: registro; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.registro (id_registro, dt_registro, valor, id_classificacao) OVERRIDING SYSTEM VALUE VALUES (1, '2025-05-01', 50.0000, 5) ON CONFLICT DO NOTHING;
INSERT INTO public.registro (id_registro, dt_registro, valor, id_classificacao) OVERRIDING SYSTEM VALUE VALUES (2, '2025-05-01', 1000.0000, 2) ON CONFLICT DO NOTHING;
INSERT INTO public.registro (id_registro, dt_registro, valor, id_classificacao) OVERRIDING SYSTEM VALUE VALUES (4, '2025-05-10', 10.0000, 3) ON CONFLICT DO NOTHING;
INSERT INTO public.registro (id_registro, dt_registro, valor, id_classificacao) OVERRIDING SYSTEM VALUE VALUES (3, '2025-05-01', 600.0000, 1) ON CONFLICT DO NOTHING;
INSERT INTO public.registro (id_registro, dt_registro, valor, id_classificacao) OVERRIDING SYSTEM VALUE VALUES (5, '2025-05-11', 5.0000, 3) ON CONFLICT DO NOTHING;


--
-- TOC entry 3376 (class 0 OID 16397)
-- Dependencies: 221
-- Data for Name: tipo_classificacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_classificacao (id_tipo_classificacao, descricao, sinal) VALUES ('D', 'Débito', -1) ON CONFLICT DO NOTHING;
INSERT INTO public.tipo_classificacao (id_tipo_classificacao, descricao, sinal) VALUES ('C', 'Crédito', 1) ON CONFLICT DO NOTHING;


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 218
-- Name: classificacao_id_classificacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classificacao_id_classificacao_seq', 5, true);


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 220
-- Name: registro_id_registro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registro_id_registro_seq', 5, true);


--
-- TOC entry 3220 (class 2606 OID 16401)
-- Name: classificacao pk_classificacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classificacao
    ADD CONSTRAINT pk_classificacao PRIMARY KEY (id_classificacao);


--
-- TOC entry 3222 (class 2606 OID 16403)
-- Name: registro pk_registro; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro
    ADD CONSTRAINT pk_registro PRIMARY KEY (id_registro);


--
-- TOC entry 3224 (class 2606 OID 16405)
-- Name: tipo_classificacao pk_tipo_classificacao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_classificacao
    ADD CONSTRAINT pk_tipo_classificacao PRIMARY KEY (id_tipo_classificacao);


--
-- TOC entry 3225 (class 2606 OID 16406)
-- Name: classificacao fk_classificacao_tipo_classificacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classificacao
    ADD CONSTRAINT fk_classificacao_tipo_classificacao FOREIGN KEY (id_tipo_classificacao) REFERENCES public.tipo_classificacao(id_tipo_classificacao);


--
-- TOC entry 3226 (class 2606 OID 16411)
-- Name: registro fk_registro_classificacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro
    ADD CONSTRAINT fk_registro_classificacao FOREIGN KEY (id_classificacao) REFERENCES public.classificacao(id_classificacao) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2025-06-16 17:37:59

--
-- PostgreSQL database dump complete
--

