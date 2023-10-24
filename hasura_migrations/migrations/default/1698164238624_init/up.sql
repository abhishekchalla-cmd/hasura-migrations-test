SET check_function_bodies = false;
CREATE TABLE public.users (
    name text NOT NULL,
    age integer NOT NULL,
    id bigint NOT NULL
);
CREATE SEQUENCE public.test_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.test_table_id_seq OWNED BY public.users.id;
ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.test_table_id_seq'::regclass);
ALTER TABLE ONLY public.users
    ADD CONSTRAINT test_table_pkey PRIMARY KEY (id);
