--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agent_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE agent_assignments (
    id integer NOT NULL,
    condition character varying,
    request_id integer,
    product_id integer,
    agent_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: agent_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE agent_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: agent_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE agent_assignments_id_seq OWNED BY agent_assignments.id;


--
-- Name: agents; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE agents (
    id integer NOT NULL,
    skill character varying NOT NULL,
    team character varying NOT NULL,
    support_center character varying NOT NULL,
    region character varying NOT NULL,
    workgroup character varying NOT NULL,
    phone character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE agents_id_seq OWNED BY agents.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: companies; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE companies (
    id integer NOT NULL,
    name character varying NOT NULL,
    website_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: companies_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE companies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: companies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE companies_id_seq OWNED BY companies.id;


--
-- Name: facilities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE facilities (
    id integer NOT NULL,
    name character varying,
    phone character varying,
    address1 character varying,
    address2 character varying,
    city character varying,
    state character varying,
    zip_code character varying,
    country character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: facilities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE facilities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: facilities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE facilities_id_seq OWNED BY facilities.id;


--
-- Name: facility_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE facility_assignments (
    id integer NOT NULL,
    condition character varying,
    request_id integer,
    product_id integer,
    facility_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: facility_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE facility_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: facility_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE facility_assignments_id_seq OWNED BY facility_assignments.id;


--
-- Name: model_numbers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE model_numbers (
    id integer NOT NULL,
    model character varying,
    description character varying,
    product_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: model_numbers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE model_numbers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: model_numbers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE model_numbers_id_seq OWNED BY model_numbers.id;


--
-- Name: portal_assignments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portal_assignments (
    id integer NOT NULL,
    condition character varying,
    request_id integer,
    product_id integer,
    portal_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: portal_assignments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE portal_assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: portal_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE portal_assignments_id_seq OWNED BY portal_assignments.id;


--
-- Name: portals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE portals (
    id integer NOT NULL,
    name character varying,
    website_url character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: portals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE portals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: portals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE portals_id_seq OWNED BY portals.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    image_url character varying,
    company_id integer,
    source_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE requests (
    id integer NOT NULL,
    request character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE requests_id_seq OWNED BY requests.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: sources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE sources (
    id integer NOT NULL,
    location character varying NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sources_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sources_id_seq OWNED BY sources.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    CONSTRAINT email_must_be_company_email CHECK (((email)::text ~* '^[^@]+@motorolasolutions\.com'::text))
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY agent_assignments ALTER COLUMN id SET DEFAULT nextval('agent_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY agents ALTER COLUMN id SET DEFAULT nextval('agents_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY companies ALTER COLUMN id SET DEFAULT nextval('companies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY facilities ALTER COLUMN id SET DEFAULT nextval('facilities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY facility_assignments ALTER COLUMN id SET DEFAULT nextval('facility_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_numbers ALTER COLUMN id SET DEFAULT nextval('model_numbers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal_assignments ALTER COLUMN id SET DEFAULT nextval('portal_assignments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY portals ALTER COLUMN id SET DEFAULT nextval('portals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY requests ALTER COLUMN id SET DEFAULT nextval('requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sources ALTER COLUMN id SET DEFAULT nextval('sources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: agent_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY agent_assignments
    ADD CONSTRAINT agent_assignments_pkey PRIMARY KEY (id);


--
-- Name: agents_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: companies_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY companies
    ADD CONSTRAINT companies_pkey PRIMARY KEY (id);


--
-- Name: facilities_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY facilities
    ADD CONSTRAINT facilities_pkey PRIMARY KEY (id);


--
-- Name: facility_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY facility_assignments
    ADD CONSTRAINT facility_assignments_pkey PRIMARY KEY (id);


--
-- Name: model_numbers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_numbers
    ADD CONSTRAINT model_numbers_pkey PRIMARY KEY (id);


--
-- Name: portal_assignments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal_assignments
    ADD CONSTRAINT portal_assignments_pkey PRIMARY KEY (id);


--
-- Name: portals_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portals
    ADD CONSTRAINT portals_pkey PRIMARY KEY (id);


--
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY sources
    ADD CONSTRAINT sources_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_agent_assignments_on_agent_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_agent_assignments_on_agent_id ON agent_assignments USING btree (agent_id);


--
-- Name: index_agent_assignments_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_agent_assignments_on_product_id ON agent_assignments USING btree (product_id);


--
-- Name: index_agent_assignments_on_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_agent_assignments_on_request_id ON agent_assignments USING btree (request_id);


--
-- Name: index_companies_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_companies_on_name ON companies USING btree (name);


--
-- Name: index_facility_assignments_on_facility_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_facility_assignments_on_facility_id ON facility_assignments USING btree (facility_id);


--
-- Name: index_facility_assignments_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_facility_assignments_on_product_id ON facility_assignments USING btree (product_id);


--
-- Name: index_facility_assignments_on_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_facility_assignments_on_request_id ON facility_assignments USING btree (request_id);


--
-- Name: index_model_numbers_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_model_numbers_on_product_id ON model_numbers USING btree (product_id);


--
-- Name: index_portal_assignments_on_portal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_portal_assignments_on_portal_id ON portal_assignments USING btree (portal_id);


--
-- Name: index_portal_assignments_on_product_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_portal_assignments_on_product_id ON portal_assignments USING btree (product_id);


--
-- Name: index_portal_assignments_on_request_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_portal_assignments_on_request_id ON portal_assignments USING btree (request_id);


--
-- Name: index_products_on_company_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_company_id ON products USING btree (company_id);


--
-- Name: index_products_on_name; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_products_on_name ON products USING btree (name);


--
-- Name: index_products_on_source_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_products_on_source_id ON products USING btree (source_id);


--
-- Name: index_sources_on_location; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_sources_on_location ON sources USING btree (location);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: fk_rails_0ce41fd2dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal_assignments
    ADD CONSTRAINT fk_rails_0ce41fd2dc FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_1acff611ed; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY facility_assignments
    ADD CONSTRAINT fk_rails_1acff611ed FOREIGN KEY (facility_id) REFERENCES facilities(id);


--
-- Name: fk_rails_2c72dc33d2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_rails_2c72dc33d2 FOREIGN KEY (source_id) REFERENCES sources(id);


--
-- Name: fk_rails_438d5b34ce; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fk_rails_438d5b34ce FOREIGN KEY (company_id) REFERENCES companies(id);


--
-- Name: fk_rails_4a2052f9ba; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal_assignments
    ADD CONSTRAINT fk_rails_4a2052f9ba FOREIGN KEY (request_id) REFERENCES requests(id);


--
-- Name: fk_rails_50a6af4f52; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY model_numbers
    ADD CONSTRAINT fk_rails_50a6af4f52 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_6e064de16f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY portal_assignments
    ADD CONSTRAINT fk_rails_6e064de16f FOREIGN KEY (portal_id) REFERENCES portals(id);


--
-- Name: fk_rails_71a80d7f73; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY facility_assignments
    ADD CONSTRAINT fk_rails_71a80d7f73 FOREIGN KEY (request_id) REFERENCES requests(id);


--
-- Name: fk_rails_8e7ef4f5e0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY agent_assignments
    ADD CONSTRAINT fk_rails_8e7ef4f5e0 FOREIGN KEY (agent_id) REFERENCES agents(id);


--
-- Name: fk_rails_af6b66a0e0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY agent_assignments
    ADD CONSTRAINT fk_rails_af6b66a0e0 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- Name: fk_rails_c32c895ac5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY agent_assignments
    ADD CONSTRAINT fk_rails_c32c895ac5 FOREIGN KEY (request_id) REFERENCES requests(id);


--
-- Name: fk_rails_e741abcf38; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY facility_assignments
    ADD CONSTRAINT fk_rails_e741abcf38 FOREIGN KEY (product_id) REFERENCES products(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20160824012057'), ('20160824140124'), ('20160824152225'), ('20160824153001'), ('20160824153501'), ('20160828172901'), ('20160828174744'), ('20160828182325'), ('20160828183333'), ('20160828193554'), ('20160828194114'), ('20160828195734'), ('20160828195814'), ('20160829002653');


