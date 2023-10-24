SET check_function_bodies = false;
CREATE TABLE public.addresses (
    id bigint NOT NULL,
    line_1 text NOT NULL,
    line_2 text,
    pincode text NOT NULL,
    state_id bigint NOT NULL,
    country_id integer NOT NULL
);
CREATE SEQUENCE public.addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.addresses_id_seq OWNED BY public.addresses.id;
CREATE TABLE public.countries (
    name text NOT NULL,
    iso_code text NOT NULL,
    id integer NOT NULL
);
CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
CREATE TABLE public.states (
    id bigint NOT NULL,
    name text NOT NULL,
    country_id integer NOT NULL
);
CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;
CREATE TABLE public.users (
    name text NOT NULL,
    age integer NOT NULL,
    id bigint NOT NULL,
    primary_address_id bigint
);
CREATE SEQUENCE public.test_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.test_table_id_seq OWNED BY public.users.id;
ALTER TABLE ONLY public.addresses ALTER COLUMN id SET DEFAULT nextval('public.addresses_id_seq'::regclass);
ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);
ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.test_table_id_seq'::regclass);
ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT test_table_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
