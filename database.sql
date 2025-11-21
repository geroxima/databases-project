--
-- PostgreSQL database dump
--

\restrict q9qAImaEDoQvPxGohVktBGIq98xxarxctAmMx2I6lO42AzS7HAJV9i7zPPF30bK

-- Dumped from database version 17.6
-- Dumped by pg_dump version 18.0

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
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: extensions; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA extensions;


ALTER SCHEMA extensions OWNER TO postgres;

--
-- Name: graphql; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql;


ALTER SCHEMA graphql OWNER TO supabase_admin;

--
-- Name: graphql_public; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA graphql_public;


ALTER SCHEMA graphql_public OWNER TO supabase_admin;

--
-- Name: pgbouncer; Type: SCHEMA; Schema: -; Owner: pgbouncer
--

CREATE SCHEMA pgbouncer;


ALTER SCHEMA pgbouncer OWNER TO pgbouncer;

--
-- Name: realtime; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA realtime;


ALTER SCHEMA realtime OWNER TO supabase_admin;

--
-- Name: storage; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA storage;


ALTER SCHEMA storage OWNER TO supabase_admin;

--
-- Name: vault; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA vault;


ALTER SCHEMA vault OWNER TO supabase_admin;

--
-- Name: pg_graphql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_graphql WITH SCHEMA graphql;


--
-- Name: EXTENSION pg_graphql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_graphql IS 'pg_graphql: GraphQL support';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA extensions;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track planning and execution statistics of all SQL statements executed';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA extensions;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: supabase_vault; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS supabase_vault WITH SCHEMA vault;


--
-- Name: EXTENSION supabase_vault; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION supabase_vault IS 'Supabase Vault Extension';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA extensions;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn',
    'phone'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_authorization_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_authorization_status AS ENUM (
    'pending',
    'approved',
    'denied',
    'expired'
);


ALTER TYPE auth.oauth_authorization_status OWNER TO supabase_auth_admin;

--
-- Name: oauth_client_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_client_type AS ENUM (
    'public',
    'confidential'
);


ALTER TYPE auth.oauth_client_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_registration_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_registration_type AS ENUM (
    'dynamic',
    'manual'
);


ALTER TYPE auth.oauth_registration_type OWNER TO supabase_auth_admin;

--
-- Name: oauth_response_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.oauth_response_type AS ENUM (
    'code'
);


ALTER TYPE auth.oauth_response_type OWNER TO supabase_auth_admin;

--
-- Name: one_time_token_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.one_time_token_type AS ENUM (
    'confirmation_token',
    'reauthentication_token',
    'recovery_token',
    'email_change_token_new',
    'email_change_token_current',
    'phone_change_token'
);


ALTER TYPE auth.one_time_token_type OWNER TO supabase_auth_admin;

--
-- Name: Facturas_estado_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Facturas_estado_enum" AS ENUM (
    'Emitida',
    'Anulada'
);


ALTER TYPE public."Facturas_estado_enum" OWNER TO postgres;

--
-- Name: Presupuestos_forma_pago_enum; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."Presupuestos_forma_pago_enum" AS ENUM (
    'Contado',
    'Credito'
);


ALTER TYPE public."Presupuestos_forma_pago_enum" OWNER TO postgres;

--
-- Name: action; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.action AS ENUM (
    'INSERT',
    'UPDATE',
    'DELETE',
    'TRUNCATE',
    'ERROR'
);


ALTER TYPE realtime.action OWNER TO supabase_admin;

--
-- Name: equality_op; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.equality_op AS ENUM (
    'eq',
    'neq',
    'lt',
    'lte',
    'gt',
    'gte',
    'in'
);


ALTER TYPE realtime.equality_op OWNER TO supabase_admin;

--
-- Name: user_defined_filter; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.user_defined_filter AS (
	column_name text,
	op realtime.equality_op,
	value text
);


ALTER TYPE realtime.user_defined_filter OWNER TO supabase_admin;

--
-- Name: wal_column; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_column AS (
	name text,
	type_name text,
	type_oid oid,
	value jsonb,
	is_pkey boolean,
	is_selectable boolean
);


ALTER TYPE realtime.wal_column OWNER TO supabase_admin;

--
-- Name: wal_rls; Type: TYPE; Schema: realtime; Owner: supabase_admin
--

CREATE TYPE realtime.wal_rls AS (
	wal jsonb,
	is_rls_enabled boolean,
	subscription_ids uuid[],
	errors text[]
);


ALTER TYPE realtime.wal_rls OWNER TO supabase_admin;

--
-- Name: buckettype; Type: TYPE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TYPE storage.buckettype AS ENUM (
    'STANDARD',
    'ANALYTICS',
    'VECTOR'
);


ALTER TYPE storage.buckettype OWNER TO supabase_storage_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: grant_pg_cron_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_cron_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_cron'
  )
  THEN
    grant usage on schema cron to postgres with grant option;

    alter default privileges in schema cron grant all on tables to postgres with grant option;
    alter default privileges in schema cron grant all on functions to postgres with grant option;
    alter default privileges in schema cron grant all on sequences to postgres with grant option;

    alter default privileges for user supabase_admin in schema cron grant all
        on sequences to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on tables to postgres with grant option;
    alter default privileges for user supabase_admin in schema cron grant all
        on functions to postgres with grant option;

    grant all privileges on all tables in schema cron to postgres with grant option;
    revoke all on table cron.job from postgres;
    grant select on table cron.job to postgres with grant option;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_cron_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_cron_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_cron_access() IS 'Grants access to pg_cron';


--
-- Name: grant_pg_graphql_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_graphql_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
DECLARE
    func_is_graphql_resolve bool;
BEGIN
    func_is_graphql_resolve = (
        SELECT n.proname = 'resolve'
        FROM pg_event_trigger_ddl_commands() AS ev
        LEFT JOIN pg_catalog.pg_proc AS n
        ON ev.objid = n.oid
    );

    IF func_is_graphql_resolve
    THEN
        -- Update public wrapper to pass all arguments through to the pg_graphql resolve func
        DROP FUNCTION IF EXISTS graphql_public.graphql;
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language sql
        as $$
            select graphql.resolve(
                query := query,
                variables := coalesce(variables, '{}'),
                "operationName" := "operationName",
                extensions := extensions
            );
        $$;

        -- This hook executes when `graphql.resolve` is created. That is not necessarily the last
        -- function in the extension so we need to grant permissions on existing entities AND
        -- update default permissions to any others that are created after `graphql.resolve`
        grant usage on schema graphql to postgres, anon, authenticated, service_role;
        grant select on all tables in schema graphql to postgres, anon, authenticated, service_role;
        grant execute on all functions in schema graphql to postgres, anon, authenticated, service_role;
        grant all on all sequences in schema graphql to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on tables to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on functions to postgres, anon, authenticated, service_role;
        alter default privileges in schema graphql grant all on sequences to postgres, anon, authenticated, service_role;

        -- Allow postgres role to allow granting usage on graphql and graphql_public schemas to custom roles
        grant usage on schema graphql_public to postgres with grant option;
        grant usage on schema graphql to postgres with grant option;
    END IF;

END;
$_$;


ALTER FUNCTION extensions.grant_pg_graphql_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_graphql_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_graphql_access() IS 'Grants access to pg_graphql';


--
-- Name: grant_pg_net_access(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.grant_pg_net_access() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF EXISTS (
    SELECT 1
    FROM pg_event_trigger_ddl_commands() AS ev
    JOIN pg_extension AS ext
    ON ev.objid = ext.oid
    WHERE ext.extname = 'pg_net'
  )
  THEN
    IF NOT EXISTS (
      SELECT 1
      FROM pg_roles
      WHERE rolname = 'supabase_functions_admin'
    )
    THEN
      CREATE USER supabase_functions_admin NOINHERIT CREATEROLE LOGIN NOREPLICATION;
    END IF;

    GRANT USAGE ON SCHEMA net TO supabase_functions_admin, postgres, anon, authenticated, service_role;

    IF EXISTS (
      SELECT FROM pg_extension
      WHERE extname = 'pg_net'
      -- all versions in use on existing projects as of 2025-02-20
      -- version 0.12.0 onwards don't need these applied
      AND extversion IN ('0.2', '0.6', '0.7', '0.7.1', '0.8', '0.10.0', '0.11.0')
    ) THEN
      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SECURITY DEFINER;

      ALTER function net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;
      ALTER function net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) SET search_path = net;

      REVOKE ALL ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;
      REVOKE ALL ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) FROM PUBLIC;

      GRANT EXECUTE ON FUNCTION net.http_get(url text, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
      GRANT EXECUTE ON FUNCTION net.http_post(url text, body jsonb, params jsonb, headers jsonb, timeout_milliseconds integer) TO supabase_functions_admin, postgres, anon, authenticated, service_role;
    END IF;
  END IF;
END;
$$;


ALTER FUNCTION extensions.grant_pg_net_access() OWNER TO supabase_admin;

--
-- Name: FUNCTION grant_pg_net_access(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.grant_pg_net_access() IS 'Grants access to pg_net';


--
-- Name: pgrst_ddl_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_ddl_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  cmd record;
BEGIN
  FOR cmd IN SELECT * FROM pg_event_trigger_ddl_commands()
  LOOP
    IF cmd.command_tag IN (
      'CREATE SCHEMA', 'ALTER SCHEMA'
    , 'CREATE TABLE', 'CREATE TABLE AS', 'SELECT INTO', 'ALTER TABLE'
    , 'CREATE FOREIGN TABLE', 'ALTER FOREIGN TABLE'
    , 'CREATE VIEW', 'ALTER VIEW'
    , 'CREATE MATERIALIZED VIEW', 'ALTER MATERIALIZED VIEW'
    , 'CREATE FUNCTION', 'ALTER FUNCTION'
    , 'CREATE TRIGGER'
    , 'CREATE TYPE', 'ALTER TYPE'
    , 'CREATE RULE'
    , 'COMMENT'
    )
    -- don't notify in case of CREATE TEMP table or other objects created on pg_temp
    AND cmd.schema_name is distinct from 'pg_temp'
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_ddl_watch() OWNER TO supabase_admin;

--
-- Name: pgrst_drop_watch(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.pgrst_drop_watch() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  obj record;
BEGIN
  FOR obj IN SELECT * FROM pg_event_trigger_dropped_objects()
  LOOP
    IF obj.object_type IN (
      'schema'
    , 'table'
    , 'foreign table'
    , 'view'
    , 'materialized view'
    , 'function'
    , 'trigger'
    , 'type'
    , 'rule'
    )
    AND obj.is_temporary IS false -- no pg_temp objects
    THEN
      NOTIFY pgrst, 'reload schema';
    END IF;
  END LOOP;
END; $$;


ALTER FUNCTION extensions.pgrst_drop_watch() OWNER TO supabase_admin;

--
-- Name: set_graphql_placeholder(); Type: FUNCTION; Schema: extensions; Owner: supabase_admin
--

CREATE FUNCTION extensions.set_graphql_placeholder() RETURNS event_trigger
    LANGUAGE plpgsql
    AS $_$
    DECLARE
    graphql_is_dropped bool;
    BEGIN
    graphql_is_dropped = (
        SELECT ev.schema_name = 'graphql_public'
        FROM pg_event_trigger_dropped_objects() AS ev
        WHERE ev.schema_name = 'graphql_public'
    );

    IF graphql_is_dropped
    THEN
        create or replace function graphql_public.graphql(
            "operationName" text default null,
            query text default null,
            variables jsonb default null,
            extensions jsonb default null
        )
            returns jsonb
            language plpgsql
        as $$
            DECLARE
                server_version float;
            BEGIN
                server_version = (SELECT (SPLIT_PART((select version()), ' ', 2))::float);

                IF server_version >= 14 THEN
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql extension is not enabled.'
                            )
                        )
                    );
                ELSE
                    RETURN jsonb_build_object(
                        'errors', jsonb_build_array(
                            jsonb_build_object(
                                'message', 'pg_graphql is only available on projects running Postgres 14 onwards.'
                            )
                        )
                    );
                END IF;
            END;
        $$;
    END IF;

    END;
$_$;


ALTER FUNCTION extensions.set_graphql_placeholder() OWNER TO supabase_admin;

--
-- Name: FUNCTION set_graphql_placeholder(); Type: COMMENT; Schema: extensions; Owner: supabase_admin
--

COMMENT ON FUNCTION extensions.set_graphql_placeholder() IS 'Reintroduces placeholder function for graphql_public.graphql';


--
-- Name: get_auth(text); Type: FUNCTION; Schema: pgbouncer; Owner: supabase_admin
--

CREATE FUNCTION pgbouncer.get_auth(p_usename text) RETURNS TABLE(username text, password text)
    LANGUAGE plpgsql SECURITY DEFINER
    AS $_$
begin
    raise debug 'PgBouncer auth request: %', p_usename;

    return query
    select 
        rolname::text, 
        case when rolvaliduntil < now() 
            then null 
            else rolpassword::text 
        end 
    from pg_authid 
    where rolname=$1 and rolcanlogin;
end;
$_$;


ALTER FUNCTION pgbouncer.get_auth(p_usename text) OWNER TO supabase_admin;

--
-- Name: actualizar_presupuesto_pedido_anulado(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.actualizar_presupuesto_pedido_anulado() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
    IF NEW.id_estado IN (24, 25) AND OLD.id_estado != NEW.id_estado THEN
        UPDATE public."Presupuestos"
        SET id_estado = 6
        WHERE id_presupuesto = NEW.id_presupuesto;
    END IF;
    RETURN NEW;
END;$$;


ALTER FUNCTION public.actualizar_presupuesto_pedido_anulado() OWNER TO postgres;

--
-- Name: descontar_stock_factura(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.descontar_stock_factura() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    detalle RECORD;
    v_id_deposito INTEGER;
    v_cantidad_confirmada INTEGER;
BEGIN
    IF TG_OP = 'INSERT' AND NEW.estado = 'Emitida' THEN
        
        SELECT id_deposito_origen INTO v_id_deposito
        FROM public."Pedidos"
        WHERE id_pedido = NEW.id_pedido;
        
        FOR detalle IN 
            SELECT id_producto, cantidad
            FROM public."FacturaDetalles"
            WHERE id_factura = NEW.id_factura
        LOOP
            SELECT cantidad_confirmada INTO v_cantidad_confirmada
            FROM public."Stock"
            WHERE id_producto = detalle.id_producto 
              AND id_deposito = v_id_deposito;
            
            IF v_cantidad_confirmada IS NULL OR v_cantidad_confirmada < detalle.cantidad THEN
                RAISE EXCEPTION 'Cantidad confirmada insuficiente para producto % en depósito %', 
                    detalle.id_producto, v_id_deposito;
            END IF;
            
            UPDATE public."Stock"
            SET cantidad_confirmada = cantidad_confirmada - detalle.cantidad,
                cantidad_disponible = cantidad_disponible - detalle.cantidad
            WHERE id_producto = detalle.id_producto 
              AND id_deposito = v_id_deposito;
        END LOOP;
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.descontar_stock_factura() OWNER TO postgres;

--
-- Name: fn_actualizar_stock_confirmacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_actualizar_stock_confirmacion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF NEW.id_estado <> OLD.id_estado AND NEW.id_estado = 4 THEN
    UPDATE public."Stock" s
    SET cantidad_confirmada = cantidad_confirmada + pd.cantidad, cantidad_disponible = cantidad_disponible - cantidad_confirmada
    FROM public."PedidoDetalles" pd
    WHERE pd.id_pedido = NEW.id_pedido
        AND s.id_producto = pd.id_producto
        AND s.id_deposito = NEW.id_deposito_origen;
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_actualizar_stock_confirmacion() OWNER TO postgres;

--
-- Name: fn_log_pedidos_allops(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_log_pedidos_allops() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO "PedidosLog"(id_pedido, accion)
    VALUES (NEW.id_pedido, 'INSERT');
    RETURN NEW;

  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO "PedidosLog"(id_pedido, accion)
    VALUES (NEW.id_pedido, 'UPDATE');
    RETURN NEW;

  ELSIF TG_OP = 'DELETE' THEN
    INSERT INTO "PedidosLog"(id_pedido, accion)
    VALUES (OLD.id_pedido, 'DELETE');
    RETURN OLD;
  END IF;

  RETURN NULL;
END;
$$;


ALTER FUNCTION public.fn_log_pedidos_allops() OWNER TO postgres;

--
-- Name: fn_log_pedidos_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.fn_log_pedidos_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "PedidosLog"(id_pedido, accion)
  VALUES (NEW.id_pedido, 'INSERT');
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.fn_log_pedidos_insert() OWNER TO postgres;

--
-- Name: generar_pedido_desde_presupuesto(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generar_pedido_desde_presupuesto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$DECLARE
    v_id_pedido INTEGER;
BEGIN
    IF NEW.id_estado = 3 AND OLD.id_estado != 3 THEN
        INSERT INTO public."Pedidos" (
            id_presupuesto, 
            id_cliente, 
            id_deposito_origen,
            fecha_generacion,
            id_estado,
            id_motivo
        )
        VALUES (
            NEW.id_presupuesto,
            NEW.id_cliente,
            1,
            CURRENT_DATE,
            1,
            500
        )
        RETURNING id_pedido INTO v_id_pedido;
        
        INSERT INTO public."PedidoDetalles" (
            id_pedido,
            id_producto,
            cantidad,
            precio_unitario
        )
        SELECT 
            v_id_pedido,
            pd.id_producto,
            pd.cantidad,
            pd.precio_unitario
        FROM public."PresupuestoDetalles" pd
        WHERE pd.id_presupuesto = NEW.id_presupuesto;
        
        --UPDATE public."Presupuestos"
        --SET id_estado = 7
        --WHERE id_presupuesto = NEW.id_presupuesto;
    END IF;
    
    RETURN NEW;
END;$$;


ALTER FUNCTION public.generar_pedido_desde_presupuesto() OWNER TO postgres;

--
-- Name: log_pedidos(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.log_pedidos() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF TG_OP = 'INSERT' THEN
    INSERT INTO pedidos_log(pedido_id, acao) VALUES (NEW.id_pedido, 'inserido');
  ELSIF TG_OP = 'UPDATE' THEN
    INSERT INTO pedidos_log(pedido_id, acao) VALUES (NEW.id_pedido, 'atualizado');
  ELSIF TG_OP = 'DELETE' THEN
    INSERT INTO pedidos_log(pedido_id, acao) VALUES (OLD.id_pedido, 'apagado');
  END IF;
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.log_pedidos() OWNER TO postgres;

--
-- Name: prevenir_eliminacion_pedido(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.prevenir_eliminacion_pedido() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    RAISE EXCEPTION 'No está permitido eliminar pedidos';
    RETURN NULL;
END;
$$;


ALTER FUNCTION public.prevenir_eliminacion_pedido() OWNER TO postgres;

--
-- Name: prevenir_eliminacion_presupuesto(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.prevenir_eliminacion_presupuesto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    RAISE EXCEPTION 'No está permitido eliminar presupuestos';
    RETURN NULL;
END;
$$;


ALTER FUNCTION public.prevenir_eliminacion_presupuesto() OWNER TO postgres;

--
-- Name: productos_no_pedidos(date, date); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.productos_no_pedidos(fecha_inicio date, fecha_fin date) RETURNS TABLE(id_producto integer, descripcion text, precio_compra numeric)
    LANGUAGE sql
    AS $$
  select 
    p.id_producto,
    p.descripcion,
    p.precio_compra
  from "Productos" p
  where p.id_producto not in (
    select pd.id_producto
    from "PedidoDetalles" pd
    join "Pedidos" pe on pe.id_pedido = pd.id_pedido
    where pe.fecha_generacion between fecha_inicio and fecha_fin
  )
  order by p.id_producto;
$$;


ALTER FUNCTION public.productos_no_pedidos(fecha_inicio date, fecha_fin date) OWNER TO postgres;

--
-- Name: revertir_stock_factura_anulada(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.revertir_stock_factura_anulada() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    detalle RECORD;
    v_id_deposito INTEGER;
BEGIN
    IF NEW.estado = 'Anulada' AND OLD.estado != 'Anulada' THEN
        
        SELECT id_deposito_origen INTO v_id_deposito
        FROM public."Pedidos"
        WHERE id_pedido = NEW.id_pedido;
        
        FOR detalle IN 
            SELECT id_producto, cantidad
            FROM public."FacturaDetalles"
            WHERE id_factura = NEW.id_factura
        LOOP
            UPDATE public."Stock"
            SET cantidad_confirmada = cantidad_confirmada + detalle.cantidad,
                cantidad_disponible = cantidad_disponible + detalle.cantidad
            WHERE id_producto = detalle.id_producto 
              AND id_deposito = v_id_deposito;
        END LOOP;
        
        UPDATE public."Pedidos"
        SET id_estado = 1
        WHERE id_pedido = NEW.id_pedido;
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.revertir_stock_factura_anulada() OWNER TO postgres;

--
-- Name: sp_agregar_presupuesto_cabecera(integer, integer, text, integer, integer, numeric); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_agregar_presupuesto_cabecera(p_id_cliente integer, p_id_emplpeado integer, p_forma_pago text, p_id_estado integer DEFAULT 10, p_id_motivo integer DEFAULT NULL::integer, p_importe_total numeric DEFAULT 0) RETURNS TABLE(success boolean, id_presupuesto integer, msg text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    
     -- Verifica cliente
    PERFORM 1 FROM public."Clientes" WHERE id_cliente = p_id_cliente;
    IF NOT FOUND THEN
        success := false;
        id_presupuesto := NULL;
        msg := 'no se encontro el cliente';
        RETURN NEXT;
        RETURN;
    END IF;

    -- Verifica empleado
    PERFORM 1 FROM public."Empleados" WHERE id_empleado = p_id_emplpeado;
    IF NOT FOUND THEN
        success := false;
        id_presupuesto := NULL;
        msg := 'no se encuentra el empleado';
        RETURN NEXT;
        RETURN;
    END IF;

    INSERT INTO public."Presupuestos" (id_cliente, id_empleado, forma_pago, id_estado, id_motivo, importe_total)
    VALUES (
        p_id_cliente,
        p_id_emplpeado,
        p_forma_pago::public."Presupuestos_forma_pago_enum",
        p_id_estado,
        p_id_motivo,
        p_importe_total
    )

    RETURNING "Presupuestos".id_presupuesto INTO id_presupuesto;

    success := true;
    msg := 'Presupuesto creado';
    RETURN NEXT;
END;
$$;


ALTER FUNCTION public.sp_agregar_presupuesto_cabecera(p_id_cliente integer, p_id_emplpeado integer, p_forma_pago text, p_id_estado integer, p_id_motivo integer, p_importe_total numeric) OWNER TO postgres;

--
-- Name: sp_agregar_presupuesto_linea(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_agregar_presupuesto_linea(p_id_presupuesto integer, p_id_producto integer, p_cantidad integer) RETURNS TABLE(success boolean, id_detalle integer, msg text)
    LANGUAGE plpgsql
    AS $$
DECLARE 
  l_precio_unitario numeric;
BEGIN
  
  -- Verificar presupuesto
  PERFORM 1 FROM public."Presupuestos" WHERE id_presupuesto = p_id_presupuesto;
  IF NOT FOUND THEN 
    success := false; 
    id_detalle := NULL; 
    msg := 'Presupuesto no encontrado'; 
    RETURN NEXT; 
    RETURN;
  END IF;

  
  PERFORM 1 FROM public."Productos" WHERE id_producto = p_id_producto;
  IF NOT FOUND THEN  
    success := false; 
    id_detalle := NULL; 
    msg := 'Producto no encontrado';
    RETURN NEXT;
    RETURN;
  END IF;

  SELECT precio_venta 
  INTO l_precio_unitario
  FROM public."Productos"
  WHERE id_producto = p_id_producto;

  -- Insertar detalle
  INSERT INTO public."PresupuestoDetalles"(
      id_presupuesto, 
      id_producto, 
      cantidad, 
      precio_unitario
  )
  VALUES (
      p_id_presupuesto, 
      p_id_producto, 
      p_cantidad, 
      l_precio_unitario
  )
  RETURNING "PresupuestoDetalles".id_detalle INTO id_detalle;
  -- Actualizar total del presupuesto sumando todos los subtotales
    UPDATE public."Presupuestos"
    SET importe_total = (
        SELECT SUM(subtotal)
        FROM public."PresupuestoDetalles"
        WHERE id_presupuesto = p_id_presupuesto)
    WHERE id_presupuesto = p_id_presupuesto;
    
  success := true; 
  msg := 'Aniadido'; 
  RETURN NEXT;
END; 
$$;


ALTER FUNCTION public.sp_agregar_presupuesto_linea(p_id_presupuesto integer, p_id_producto integer, p_cantidad integer) OWNER TO postgres;

--
-- Name: sp_anular_factura(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_anular_factura(p_id_factura integer) RETURNS TABLE(success boolean, msg text)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id_pedido INTEGER;
    v_id_deposito INTEGER;
BEGIN
    -- Obtener pedido y depósito asociados a la factura
    SELECT f.id_pedido, p.id_deposito_origen INTO v_id_pedido, v_id_deposito
    FROM public."Facturas" f
    JOIN public."Pedidos" p ON f.id_pedido = p.id_pedido
    WHERE f.id_factura = p_id_factura;
    
    IF NOT FOUND THEN
        success := FALSE;
        msg := 'Factura no encontrada';
        RETURN NEXT;
        RETURN;
    END IF;
    
    -- Anular factura
    UPDATE public."Facturas" 
    SET estado = 'Anulada'
    WHERE id_factura = p_id_factura;
    
    -- Volver pedido a EMITIDO (estado 1)
    UPDATE public."Pedidos" 
    SET id_estado = 1 
    WHERE id_pedido = v_id_pedido;
    
    -- Restaurar stock/cantidad_confirmada
    UPDATE public."Stock" s
    SET 
        cantidad_confirmada = cantidad_confirmada + fd.cantidad,
        cantidad_disponible = cantidad_disponible + fd.cantidad
    FROM public."FacturaDetalles" fd
    WHERE s.id_producto = fd.id_producto 
      AND s.id_deposito = v_id_deposito
      AND fd.id_factura = p_id_factura;
    
    success := TRUE;
    msg := 'Factura anulada y stock restaurado';
    
    RETURN NEXT;
END;
$$;


ALTER FUNCTION public.sp_anular_factura(p_id_factura integer) OWNER TO postgres;

--
-- Name: sp_anular_o_confirmar_pedido(integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_anular_o_confirmar_pedido(pedido_id integer, accion text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  IF accion = 'ANULAR' THEN
  UPDATE pedidos
    SET estado = 'ANULADO'
    WHERE id = pedido_id;

  UPDATE presupuestos
    SET estado = 'EMITIDO'
    WHERE id = (SELECT presupuesto_id
  FROM pedidos
  WHERE id = pedido_id);

  ELSIF accion = 'CONFIRMAR' THEN
  UPDATE pedidos
    SET estado = 'CONFIRMADO'
    WHERE id = pedido_id;
END
IF;
END;
$$;


ALTER FUNCTION public.sp_anular_o_confirmar_pedido(pedido_id integer, accion text) OWNER TO postgres;

--
-- Name: sp_anular_o_confirmar_pedido(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_anular_o_confirmar_pedido(p_accion text, p_id_pedido integer) RETURNS TABLE(success boolean, msg text)
    LANGUAGE plpgsql
    AS $$DECLARE
    v_id_presupuesto INTEGER;
BEGIN
    p_accion := UPPER(p_accion);
    
    -- Obtener el presupuesto asociado al pedido
    SELECT id_presupuesto INTO v_id_presupuesto 
    FROM public."Pedidos" 
    WHERE id_pedido = p_id_pedido;
    
    IF NOT FOUND THEN
        success := FALSE;
        msg := 'Pedido no encontrado';
        RETURN NEXT;
        RETURN;
    END IF;
    
    IF p_accion = 'CONFIRMAR' THEN
        -- Confirmar pedido
        UPDATE public."Pedidos" 
        SET id_estado = 4
        WHERE id_pedido = p_id_pedido;
        
        success := TRUE;
        msg := 'Pedido confirmado';
        
    ELSIF p_accion = 'ANULAR' THEN
        -- Anular pedido y revertir presupuesto
        UPDATE public."Pedidos" 
        SET id_estado = 25
        WHERE id_pedido = p_id_pedido;
        
        -- Revertir presupuesto a EMITIDO (10)
        UPDATE public."Presupuestos" 
        SET id_estado = 10 
        WHERE id_presupuesto = v_id_presupuesto;
        
        success := TRUE;
        msg := 'Pedido anulado y presupuesto revertido';
        
    ELSE
        success := FALSE;
        msg := 'Acción inválida. Use CONFIRMAR o ANULAR';
    END IF;
    
    RETURN NEXT;
END;$$;


ALTER FUNCTION public.sp_anular_o_confirmar_pedido(p_accion text, p_id_pedido integer) OWNER TO postgres;

--
-- Name: sp_cambiar_estado_presupuesto(integer, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_cambiar_estado_presupuesto(p_id_presupuesto integer, p_nuevo_estado integer, p_id_motivo integer DEFAULT 1) RETURNS TABLE(success boolean, msg text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM 1 FROM public."Presupuestos" 
    WHERE id_presupuesto = p_id_presupuesto;

    IF NOT FOUND THEN
        success := FALSE;
        msg := 'El presupuesto no existe';
        RETURN NEXT;
        RETURN;
    END IF;

    PERFORM 1 FROM public."EstadosPresupuesto"
    WHERE id_estado = p_nuevo_estado;

    IF NOT FOUND THEN
        success := FALSE;
        msg := 'El estado no existe';
        RETURN NEXT;
        RETURN;
    END IF;

    UPDATE public."Presupuestos"
    SET id_estado = p_nuevo_estado,
        id_motivo = p_id_motivo
    WHERE id_presupuesto = p_id_presupuesto;

    success := TRUE;
    msg := 'Estado cambiado con éxito';
    RETURN NEXT;
END;
$$;


ALTER FUNCTION public.sp_cambiar_estado_presupuesto(p_id_presupuesto integer, p_nuevo_estado integer, p_id_motivo integer) OWNER TO postgres;

--
-- Name: sp_confirmar_pedido(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_confirmar_pedido(p_id_pedido integer) RETURNS TABLE(success boolean, msg text)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_id_deposito INTEGER;
BEGIN
    -- Verificar existencia del pedido
    IF NOT EXISTS (
        SELECT 1 FROM public."Pedidos"
        WHERE id_pedido = p_id_pedido
    ) THEN
        success := FALSE;
        msg := 'Pedido no encontrado';
        RETURN NEXT;
        RETURN;
    END IF;

    ----------------------------------------------------------------------
    -- 1. Encontrar un depósito que tenga stock suficiente para todo el pedido
    ----------------------------------------------------------------------
    SELECT s.id_deposito
    INTO v_id_deposito
    FROM public."Stock" s
    JOIN public."PedidoDetalles" pd
        ON s.id_producto = pd.id_producto
    WHERE pd.id_pedido = p_id_pedido
    GROUP BY s.id_deposito
    HAVING BOOL_AND(s.cantidad_disponible >= pd.cantidad)
    LIMIT 1;

    IF v_id_deposito IS NULL THEN
        success := FALSE;
        msg := 'No existe ningún depósito con stock suficiente';
        RETURN NEXT;
        RETURN;
    END IF;

    ----------------------------------------------------------------------
    -- 2. Actualizar stock confirmado
    ----------------------------------------------------------------------
    UPDATE public."Stock" s
    SET cantidad_confirmada = cantidad_confirmada + pd.cantidad
    FROM public."PedidoDetalles" pd
    WHERE s.id_producto = pd.id_producto
      AND s.id_deposito = v_id_deposito
      AND pd.id_pedido = p_id_pedido;

    IF NOT FOUND THEN
        success := FALSE;
        msg := 'Error al actualizar stock';
        RETURN NEXT;
        RETURN;
    END IF;

    ----------------------------------------------------------------------
    -- 3. Confirmar pedido y guardar depósito origen
    ----------------------------------------------------------------------
    UPDATE public."Pedidos"
    SET 
        id_estado = 3,
        id_deposito_origen = v_id_deposito
    WHERE id_pedido = p_id_pedido;

    success := TRUE;
    msg := 'Pedido confirmado automáticamente y stock actualizado';
    RETURN NEXT;
END;
$$;


ALTER FUNCTION public.sp_confirmar_pedido(p_id_pedido integer) OWNER TO postgres;

--
-- Name: sp_confirmar_pedido(integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_confirmar_pedido(p_id_pedido integer, p_id_deposito integer) RETURNS TABLE(success boolean, msg text)
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Verificar que el pedido existe
    IF NOT EXISTS (SELECT 1 FROM public."Pedidos" WHERE id_pedido = p_id_pedido) THEN
        success := FALSE;
        msg := 'Pedido no encontrado';
        RETURN NEXT;
        RETURN;
    END IF;
    
    -- Actualizar cantidad_confirmada en stock
    UPDATE public."Stock" s
    SET cantidad_confirmada = cantidad_confirmada + pd.cantidad
    FROM public."PedidoDetalles" pd
    WHERE s.id_producto = pd.id_producto 
      AND s.id_deposito = p_id_deposito
      AND pd.id_pedido = p_id_pedido;
    
    IF FOUND THEN
        -- Cambiar estado del pedido a confirmado
        UPDATE public."Pedidos" 
        SET id_estado = 4 
        WHERE id_pedido = p_id_pedido;
        
        success := TRUE;
        msg := 'Pedido confirmado y stock actualizado';
    ELSE
        success := FALSE;
        msg := 'No se pudo actualizar el stock';
    END IF;
    
    RETURN NEXT;
END;
$$;


ALTER FUNCTION public.sp_confirmar_pedido(p_id_pedido integer, p_id_deposito integer) OWNER TO postgres;

--
-- Name: sp_generar_factura_desde_pedido(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_generar_factura_desde_pedido(p_id_pedido integer) RETURNS TABLE(success boolean, id_factura integer, msg text)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_numero_factura TEXT;
    v_id_deposito INTEGER;
    v_id_usuario INTEGER;
BEGIN
    
    PERFORM 1 FROM public."Pedidos" WHERE id_pedido = p_id_pedido;
    IF NOT FOUND THEN
        success := FALSE;
        id_factura := NULL;
        msg := 'Pedido no encontrado';
        RETURN NEXT;
        RETURN;
    END IF;
    

    SELECT id_cliente INTO v_id_usuario from public."Pedidos" WHERE id_pedido = p_id_pedido;

    -- Generar número de factura único
    v_numero_factura := 'FAC-' || EXTRACT(YEAR FROM NOW()) || '-' || p_id_pedido || '-' || v_id_usuario;
    
    -- Insertar factura
    INSERT INTO public."Facturas" (id_pedido, numero_factura)
    VALUES (p_id_pedido, v_numero_factura)
    RETURNING "Facturas".id_factura INTO id_factura;
    
    -- Copiar detalles del pedido a la factura
    INSERT INTO public."FacturaDetalles" (id_factura, id_producto, cantidad, precio_unitario, porcentaje_iva)
    SELECT 
        id_factura,
        pd.id_producto,
        pd.cantidad,
        pd.precio_unitario,
        COALESCE(pr.porcentaje_iva, 10)
    FROM public."PedidoDetalles" pd
    JOIN public."Productos" pr ON pd.id_producto = pr.id_producto
    WHERE pd.id_pedido = p_id_pedido;
    
    -- Descontar del stock confirmado y afectar inventario real
    UPDATE public."Stock" s
    SET 
        cantidad_confirmada = cantidad_confirmada - pd.cantidad,
        cantidad_disponible = cantidad_disponible - pd.cantidad
    FROM public."PedidoDetalles" pd
    WHERE s.id_producto = pd.id_producto 
      AND s.id_deposito = v_id_deposito
      AND pd.id_pedido = p_id_pedido;
    
    success := TRUE;
    msg := 'Factura generada correctamente';
    
    RETURN NEXT;
END;
$$;


ALTER FUNCTION public.sp_generar_factura_desde_pedido(p_id_pedido integer) OWNER TO postgres;

--
-- Name: sp_presupuestos_rechazados(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_presupuestos_rechazados() RETURNS TABLE(presupuesto integer, fecha timestamp without time zone, codigo_cliente integer, nombre_cliente character varying, codigo_producto integer, nombre_producto character varying, cantidad integer, precio_unitario numeric, codigo_motivo integer, descripcion_motivo character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        p.id_presupuesto as presupuesto,
        p.fecha_emision as fecha,
        c.id_cliente as codigo_cliente,
        c.nombre as nombre_cliente,
        pr.id_producto as codigo_producto,
        pr.descripcion as nombre_producto,
        pd.cantidad as cantidad,
        pd.precio_unitario as precio_unitario,
        m.id_motivo as codigo_motivo,
        m.descripcion as descripcion_motivo
    FROM public."Presupuestos" p
    JOIN public."Clientes" c ON p.id_cliente = c.id_cliente
    JOIN public."PresupuestoDetalles" pd ON p.id_presupuesto = pd.id_presupuesto
    JOIN public."Productos" pr ON pd.id_producto = pr.id_producto
    JOIN public."Motivos" m ON p.id_motivo = m.id_motivo
    WHERE p.id_estado = 3; -- Asumiendo que 3 es "Rechazado"
END;
$$;


ALTER FUNCTION public.sp_presupuestos_rechazados() OWNER TO postgres;

--
-- Name: sp_upsert_cliente(text, integer, text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_upsert_cliente(accion text, p_id_cliente integer DEFAULT NULL::integer, p_nombre text DEFAULT NULL::text, p_direccion text DEFAULT NULL::text, p_telefono text DEFAULT NULL::text, p_email text DEFAULT NULL::text) RETURNS TABLE(success boolean, cliente_id integer, msg text)
    LANGUAGE plpgsql
    AS $$ 
BEGIN  
  accion := upper(accion);
  IF accion = 'INSERT' THEN 
    INSERT INTO public."Clientes"(nombre, direccion, telefono, email)
    VALUES (p_nombre, p_direccion, p_telefono, p_email)
    RETURNING id_cliente INTO cliente_id;
    success := true; 
    msg := 'Inserted';
    RETURN NEXT;
    RETURN;
  ELSIF accion = 'UPDATE' THEN 
    IF p_id_cliente IS NULL THEN 
      RAISE EXCEPTION 'Es necesario el id del cliente';
    END IF;
    UPDATE public."Clientes"
      SET nombre = p_nombre,  
      direccion = p_direccion, 
      telefono = p_telefono,
      email = p_email
    WHERE id_cliente = p_id_cliente;
    IF found THEN 
      success := true; cliente_id := p_id_cliente; msg := 'Actualizado';
    ELSE 
      success := false; cliente_id := NULL; msg := 'Cliente no encontrado';
    END IF;
    RETURN NEXT;
    RETURN;
  ELSIF accion = 'DELETE' THEN 
    IF p_id_cliente IS NULL THEN  
      RAISE EXCEPTION 'el id del cliente es requerido para eliminar';
    END IF;
    DELETE FROM public."Clientes" WHERE id_cliente = p_id_cliente;
    IF found THEN
      success := true; cliente_id := p_id_cliente; msg := 'Eliminado';
    ELSE 
      success := false; cliente_id := NULL; msg := 'Cliente no encontrado';
    END IF; 
    RETURN NEXT; 
    RETURN;
  ELSE
    RAISE EXCEPTION 'accion invalida';
  END IF ;
END;
$$;


ALTER FUNCTION public.sp_upsert_cliente(accion text, p_id_cliente integer, p_nombre text, p_direccion text, p_telefono text, p_email text) OWNER TO postgres;

--
-- Name: sp_upsert_funcionario(text, integer, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.sp_upsert_funcionario(accion text, p_id_empleado integer DEFAULT NULL::integer, p_nombre text DEFAULT NULL::text) RETURNS TABLE(success boolean, empleado_id integer, msg text)
    LANGUAGE plpgsql
    AS $$BEGIN
  accion := upper(accion);
  IF accion = 'INSERT' THEN
    INSERT INTO public."Empleados" (nombre_completo)
    VALUES (p_nombre)
    RETURNING id_empleado INTO empleado_id;
    success := true; msg := 'Inserted';
    RETURN NEXT;
    RETURN;
  ELSIF accion = 'UPDATE' THEN
    UPDATE public."Empleados"
    SET nombre_completo = p_nombre
    WHERE id_empleado = p_id_empleado;
    IF found THEN 
      success := true; empleado_id := p_id_empleado; msg := 'Actualizado correctamente';
    ELSE 
      success := false; empleado_id := p_id_empleado; msg := 'El id del empleado no existe';
    END IF;
    RETURN NEXT; 
    RETURN; 
  ELSIF accion = 'DELETE' THEN   
    IF p_id_empleado IS NULL THEN      
      RAISE EXCEPTION 'Para eliminar se necesita un id';
    END IF;    
    DELETE FROM public."Empleados" WHERE id_empleado = p_id_empleado;
    IF found THEN 
      success := true; empleado_id := p_id_empleado; msg := 'ELIMINADO';
    ELSE  
      success := false; empleado_id := p_id_empleado; msg := 'Empleado no encontrado';
    END IF; 
    RETURN NEXT; 
    RETURN;
  ELSE
    RAISE EXCEPTION 'Accion invalida';
  END IF;
END;$$;


ALTER FUNCTION public.sp_upsert_funcionario(accion text, p_id_empleado integer, p_nombre text) OWNER TO postgres;

--
-- Name: validar_modificacion_presupuesto(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validar_modificacion_presupuesto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
    IF OLD.id_estado NOT IN (10, 3, 7) THEN --Tiene que dejar modificar para pasar de emitido a confirmado and stuff
        RAISE EXCEPTION 'No se puede modificar un presupuesto que no está en estado Emitido';
    END IF;
    
    IF (CURRENT_TIMESTAMP - OLD.fecha_emision) > INTERVAL '48 hours' THEN
        RAISE EXCEPTION 'No se puede modificar un presupuesto después de 48 horas de su emisión';
    END IF;
    
    RETURN NEW;
END;$$;


ALTER FUNCTION public.validar_modificacion_presupuesto() OWNER TO postgres;

--
-- Name: validar_motivo_presupuesto(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validar_motivo_presupuesto() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.id_estado IN (4, 6) AND NEW.id_motivo IS NULL THEN
        RAISE EXCEPTION 'Debe indicar un motivo para rechazar o anular el presupuesto';
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.validar_motivo_presupuesto() OWNER TO postgres;

--
-- Name: validar_pedido_modificacion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validar_pedido_modificacion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF OLD.id_estado IN (4, 24, 25) THEN
        RAISE EXCEPTION 'No se puede modificar un pedido confirmado o anulado';
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.validar_pedido_modificacion() OWNER TO postgres;

--
-- Name: validar_stock_no_negativo(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.validar_stock_no_negativo() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.cantidad_disponible < 0 THEN
        RAISE EXCEPTION 'No se permite stock negativo para producto % en depósito %', 
            NEW.id_producto, NEW.id_deposito;
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.validar_stock_no_negativo() OWNER TO postgres;

--
-- Name: apply_rls(jsonb, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer DEFAULT (1024 * 1024)) RETURNS SETOF realtime.wal_rls
    LANGUAGE plpgsql
    AS $$
declare
-- Regclass of the table e.g. public.notes
entity_ regclass = (quote_ident(wal ->> 'schema') || '.' || quote_ident(wal ->> 'table'))::regclass;

-- I, U, D, T: insert, update ...
action realtime.action = (
    case wal ->> 'action'
        when 'I' then 'INSERT'
        when 'U' then 'UPDATE'
        when 'D' then 'DELETE'
        else 'ERROR'
    end
);

-- Is row level security enabled for the table
is_rls_enabled bool = relrowsecurity from pg_class where oid = entity_;

subscriptions realtime.subscription[] = array_agg(subs)
    from
        realtime.subscription subs
    where
        subs.entity = entity_;

-- Subscription vars
roles regrole[] = array_agg(distinct us.claims_role::text)
    from
        unnest(subscriptions) us;

working_role regrole;
claimed_role regrole;
claims jsonb;

subscription_id uuid;
subscription_has_access bool;
visible_to_subscription_ids uuid[] = '{}';

-- structured info for wal's columns
columns realtime.wal_column[];
-- previous identity values for update/delete
old_columns realtime.wal_column[];

error_record_exceeds_max_size boolean = octet_length(wal::text) > max_record_bytes;

-- Primary jsonb output for record
output jsonb;

begin
perform set_config('role', null, true);

columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'columns') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

old_columns =
    array_agg(
        (
            x->>'name',
            x->>'type',
            x->>'typeoid',
            realtime.cast(
                (x->'value') #>> '{}',
                coalesce(
                    (x->>'typeoid')::regtype, -- null when wal2json version <= 2.4
                    (x->>'type')::regtype
                )
            ),
            (pks ->> 'name') is not null,
            true
        )::realtime.wal_column
    )
    from
        jsonb_array_elements(wal -> 'identity') x
        left join jsonb_array_elements(wal -> 'pk') pks
            on (x ->> 'name') = (pks ->> 'name');

for working_role in select * from unnest(roles) loop

    -- Update `is_selectable` for columns and old_columns
    columns =
        array_agg(
            (
                c.name,
                c.type_name,
                c.type_oid,
                c.value,
                c.is_pkey,
                pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
            )::realtime.wal_column
        )
        from
            unnest(columns) c;

    old_columns =
            array_agg(
                (
                    c.name,
                    c.type_name,
                    c.type_oid,
                    c.value,
                    c.is_pkey,
                    pg_catalog.has_column_privilege(working_role, entity_, c.name, 'SELECT')
                )::realtime.wal_column
            )
            from
                unnest(old_columns) c;

    if action <> 'DELETE' and count(1) = 0 from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            -- subscriptions is already filtered by entity
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 400: Bad Request, no primary key']
        )::realtime.wal_rls;

    -- The claims role does not have SELECT permission to the primary key of entity
    elsif action <> 'DELETE' and sum(c.is_selectable::int) <> count(1) from unnest(columns) c where c.is_pkey then
        return next (
            jsonb_build_object(
                'schema', wal ->> 'schema',
                'table', wal ->> 'table',
                'type', action
            ),
            is_rls_enabled,
            (select array_agg(s.subscription_id) from unnest(subscriptions) as s where claims_role = working_role),
            array['Error 401: Unauthorized']
        )::realtime.wal_rls;

    else
        output = jsonb_build_object(
            'schema', wal ->> 'schema',
            'table', wal ->> 'table',
            'type', action,
            'commit_timestamp', to_char(
                ((wal ->> 'timestamp')::timestamptz at time zone 'utc'),
                'YYYY-MM-DD"T"HH24:MI:SS.MS"Z"'
            ),
            'columns', (
                select
                    jsonb_agg(
                        jsonb_build_object(
                            'name', pa.attname,
                            'type', pt.typname
                        )
                        order by pa.attnum asc
                    )
                from
                    pg_attribute pa
                    join pg_type pt
                        on pa.atttypid = pt.oid
                where
                    attrelid = entity_
                    and attnum > 0
                    and pg_catalog.has_column_privilege(working_role, entity_, pa.attname, 'SELECT')
            )
        )
        -- Add "record" key for insert and update
        || case
            when action in ('INSERT', 'UPDATE') then
                jsonb_build_object(
                    'record',
                    (
                        select
                            jsonb_object_agg(
                                -- if unchanged toast, get column name and value from old record
                                coalesce((c).name, (oc).name),
                                case
                                    when (c).name is null then (oc).value
                                    else (c).value
                                end
                            )
                        from
                            unnest(columns) c
                            full outer join unnest(old_columns) oc
                                on (c).name = (oc).name
                        where
                            coalesce((c).is_selectable, (oc).is_selectable)
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                    )
                )
            else '{}'::jsonb
        end
        -- Add "old_record" key for update and delete
        || case
            when action = 'UPDATE' then
                jsonb_build_object(
                        'old_record',
                        (
                            select jsonb_object_agg((c).name, (c).value)
                            from unnest(old_columns) c
                            where
                                (c).is_selectable
                                and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                        )
                    )
            when action = 'DELETE' then
                jsonb_build_object(
                    'old_record',
                    (
                        select jsonb_object_agg((c).name, (c).value)
                        from unnest(old_columns) c
                        where
                            (c).is_selectable
                            and ( not error_record_exceeds_max_size or (octet_length((c).value::text) <= 64))
                            and ( not is_rls_enabled or (c).is_pkey ) -- if RLS enabled, we can't secure deletes so filter to pkey
                    )
                )
            else '{}'::jsonb
        end;

        -- Create the prepared statement
        if is_rls_enabled and action <> 'DELETE' then
            if (select 1 from pg_prepared_statements where name = 'walrus_rls_stmt' limit 1) > 0 then
                deallocate walrus_rls_stmt;
            end if;
            execute realtime.build_prepared_statement_sql('walrus_rls_stmt', entity_, columns);
        end if;

        visible_to_subscription_ids = '{}';

        for subscription_id, claims in (
                select
                    subs.subscription_id,
                    subs.claims
                from
                    unnest(subscriptions) subs
                where
                    subs.entity = entity_
                    and subs.claims_role = working_role
                    and (
                        realtime.is_visible_through_filters(columns, subs.filters)
                        or (
                          action = 'DELETE'
                          and realtime.is_visible_through_filters(old_columns, subs.filters)
                        )
                    )
        ) loop

            if not is_rls_enabled or action = 'DELETE' then
                visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
            else
                -- Check if RLS allows the role to see the record
                perform
                    -- Trim leading and trailing quotes from working_role because set_config
                    -- doesn't recognize the role as valid if they are included
                    set_config('role', trim(both '"' from working_role::text), true),
                    set_config('request.jwt.claims', claims::text, true);

                execute 'execute walrus_rls_stmt' into subscription_has_access;

                if subscription_has_access then
                    visible_to_subscription_ids = visible_to_subscription_ids || subscription_id;
                end if;
            end if;
        end loop;

        perform set_config('role', null, true);

        return next (
            output,
            is_rls_enabled,
            visible_to_subscription_ids,
            case
                when error_record_exceeds_max_size then array['Error 413: Payload Too Large']
                else '{}'
            end
        )::realtime.wal_rls;

    end if;
end loop;

perform set_config('role', null, true);
end;
$$;


ALTER FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: broadcast_changes(text, text, text, text, text, record, record, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text DEFAULT 'ROW'::text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    -- Declare a variable to hold the JSONB representation of the row
    row_data jsonb := '{}'::jsonb;
BEGIN
    IF level = 'STATEMENT' THEN
        RAISE EXCEPTION 'function can only be triggered for each row, not for each statement';
    END IF;
    -- Check the operation type and handle accordingly
    IF operation = 'INSERT' OR operation = 'UPDATE' OR operation = 'DELETE' THEN
        row_data := jsonb_build_object('old_record', OLD, 'record', NEW, 'operation', operation, 'table', table_name, 'schema', table_schema);
        PERFORM realtime.send (row_data, event_name, topic_name);
    ELSE
        RAISE EXCEPTION 'Unexpected operation type: %', operation;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        RAISE EXCEPTION 'Failed to process the row: %', SQLERRM;
END;

$$;


ALTER FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) OWNER TO supabase_admin;

--
-- Name: build_prepared_statement_sql(text, regclass, realtime.wal_column[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) RETURNS text
    LANGUAGE sql
    AS $$
      /*
      Builds a sql string that, if executed, creates a prepared statement to
      tests retrive a row from *entity* by its primary key columns.
      Example
          select realtime.build_prepared_statement_sql('public.notes', '{"id"}'::text[], '{"bigint"}'::text[])
      */
          select
      'prepare ' || prepared_statement_name || ' as
          select
              exists(
                  select
                      1
                  from
                      ' || entity || '
                  where
                      ' || string_agg(quote_ident(pkc.name) || '=' || quote_nullable(pkc.value #>> '{}') , ' and ') || '
              )'
          from
              unnest(columns) pkc
          where
              pkc.is_pkey
          group by
              entity
      $$;


ALTER FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) OWNER TO supabase_admin;

--
-- Name: cast(text, regtype); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime."cast"(val text, type_ regtype) RETURNS jsonb
    LANGUAGE plpgsql IMMUTABLE
    AS $$
    declare
      res jsonb;
    begin
      execute format('select to_jsonb(%L::'|| type_::text || ')', val)  into res;
      return res;
    end
    $$;


ALTER FUNCTION realtime."cast"(val text, type_ regtype) OWNER TO supabase_admin;

--
-- Name: check_equality_op(realtime.equality_op, regtype, text, text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE
    AS $$
      /*
      Casts *val_1* and *val_2* as type *type_* and check the *op* condition for truthiness
      */
      declare
          op_symbol text = (
              case
                  when op = 'eq' then '='
                  when op = 'neq' then '!='
                  when op = 'lt' then '<'
                  when op = 'lte' then '<='
                  when op = 'gt' then '>'
                  when op = 'gte' then '>='
                  when op = 'in' then '= any'
                  else 'UNKNOWN OP'
              end
          );
          res boolean;
      begin
          execute format(
              'select %L::'|| type_::text || ' ' || op_symbol
              || ' ( %L::'
              || (
                  case
                      when op = 'in' then type_::text || '[]'
                      else type_::text end
              )
              || ')', val_1, val_2) into res;
          return res;
      end;
      $$;


ALTER FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) OWNER TO supabase_admin;

--
-- Name: is_visible_through_filters(realtime.wal_column[], realtime.user_defined_filter[]); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) RETURNS boolean
    LANGUAGE sql IMMUTABLE
    AS $_$
    /*
    Should the record be visible (true) or filtered out (false) after *filters* are applied
    */
        select
            -- Default to allowed when no filters present
            $2 is null -- no filters. this should not happen because subscriptions has a default
            or array_length($2, 1) is null -- array length of an empty array is null
            or bool_and(
                coalesce(
                    realtime.check_equality_op(
                        op:=f.op,
                        type_:=coalesce(
                            col.type_oid::regtype, -- null when wal2json version <= 2.4
                            col.type_name::regtype
                        ),
                        -- cast jsonb to text
                        val_1:=col.value #>> '{}',
                        val_2:=f.value
                    ),
                    false -- if null, filter does not match
                )
            )
        from
            unnest(filters) f
            join unnest(columns) col
                on f.column_name = col.name;
    $_$;


ALTER FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) OWNER TO supabase_admin;

--
-- Name: list_changes(name, name, integer, integer); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) RETURNS SETOF realtime.wal_rls
    LANGUAGE sql
    SET log_min_messages TO 'fatal'
    AS $$
      with pub as (
        select
          concat_ws(
            ',',
            case when bool_or(pubinsert) then 'insert' else null end,
            case when bool_or(pubupdate) then 'update' else null end,
            case when bool_or(pubdelete) then 'delete' else null end
          ) as w2j_actions,
          coalesce(
            string_agg(
              realtime.quote_wal2json(format('%I.%I', schemaname, tablename)::regclass),
              ','
            ) filter (where ppt.tablename is not null and ppt.tablename not like '% %'),
            ''
          ) w2j_add_tables
        from
          pg_publication pp
          left join pg_publication_tables ppt
            on pp.pubname = ppt.pubname
        where
          pp.pubname = publication
        group by
          pp.pubname
        limit 1
      ),
      w2j as (
        select
          x.*, pub.w2j_add_tables
        from
          pub,
          pg_logical_slot_get_changes(
            slot_name, null, max_changes,
            'include-pk', 'true',
            'include-transaction', 'false',
            'include-timestamp', 'true',
            'include-type-oids', 'true',
            'format-version', '2',
            'actions', pub.w2j_actions,
            'add-tables', pub.w2j_add_tables
          ) x
      )
      select
        xyz.wal,
        xyz.is_rls_enabled,
        xyz.subscription_ids,
        xyz.errors
      from
        w2j,
        realtime.apply_rls(
          wal := w2j.data::jsonb,
          max_record_bytes := max_record_bytes
        ) xyz(wal, is_rls_enabled, subscription_ids, errors)
      where
        w2j.w2j_add_tables <> ''
        and xyz.subscription_ids[1] is not null
    $$;


ALTER FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) OWNER TO supabase_admin;

--
-- Name: quote_wal2json(regclass); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.quote_wal2json(entity regclass) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
      select
        (
          select string_agg('' || ch,'')
          from unnest(string_to_array(nsp.nspname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
        )
        || '.'
        || (
          select string_agg('' || ch,'')
          from unnest(string_to_array(pc.relname::text, null)) with ordinality x(ch, idx)
          where
            not (x.idx = 1 and x.ch = '"')
            and not (
              x.idx = array_length(string_to_array(nsp.nspname::text, null), 1)
              and x.ch = '"'
            )
          )
      from
        pg_class pc
        join pg_namespace nsp
          on pc.relnamespace = nsp.oid
      where
        pc.oid = entity
    $$;


ALTER FUNCTION realtime.quote_wal2json(entity regclass) OWNER TO supabase_admin;

--
-- Name: send(jsonb, text, text, boolean); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean DEFAULT true) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
  generated_id uuid;
  final_payload jsonb;
BEGIN
  BEGIN
    -- Generate a new UUID for the id
    generated_id := gen_random_uuid();

    -- Check if payload has an 'id' key, if not, add the generated UUID
    IF payload ? 'id' THEN
      final_payload := payload;
    ELSE
      final_payload := jsonb_set(payload, '{id}', to_jsonb(generated_id));
    END IF;

    -- Set the topic configuration
    EXECUTE format('SET LOCAL realtime.topic TO %L', topic);

    -- Attempt to insert the message
    INSERT INTO realtime.messages (id, payload, event, topic, private, extension)
    VALUES (generated_id, final_payload, event, topic, private, 'broadcast');
  EXCEPTION
    WHEN OTHERS THEN
      -- Capture and notify the error
      RAISE WARNING 'ErrorSendingBroadcastMessage: %', SQLERRM;
  END;
END;
$$;


ALTER FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) OWNER TO supabase_admin;

--
-- Name: subscription_check_filters(); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.subscription_check_filters() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
    /*
    Validates that the user defined filters for a subscription:
    - refer to valid columns that the claimed role may access
    - values are coercable to the correct column type
    */
    declare
        col_names text[] = coalesce(
                array_agg(c.column_name order by c.ordinal_position),
                '{}'::text[]
            )
            from
                information_schema.columns c
            where
                format('%I.%I', c.table_schema, c.table_name)::regclass = new.entity
                and pg_catalog.has_column_privilege(
                    (new.claims ->> 'role'),
                    format('%I.%I', c.table_schema, c.table_name)::regclass,
                    c.column_name,
                    'SELECT'
                );
        filter realtime.user_defined_filter;
        col_type regtype;

        in_val jsonb;
    begin
        for filter in select * from unnest(new.filters) loop
            -- Filtered column is valid
            if not filter.column_name = any(col_names) then
                raise exception 'invalid column for filter %', filter.column_name;
            end if;

            -- Type is sanitized and safe for string interpolation
            col_type = (
                select atttypid::regtype
                from pg_catalog.pg_attribute
                where attrelid = new.entity
                      and attname = filter.column_name
            );
            if col_type is null then
                raise exception 'failed to lookup type for column %', filter.column_name;
            end if;

            -- Set maximum number of entries for in filter
            if filter.op = 'in'::realtime.equality_op then
                in_val = realtime.cast(filter.value, (col_type::text || '[]')::regtype);
                if coalesce(jsonb_array_length(in_val), 0) > 100 then
                    raise exception 'too many values for `in` filter. Maximum 100';
                end if;
            else
                -- raises an exception if value is not coercable to type
                perform realtime.cast(filter.value, col_type);
            end if;

        end loop;

        -- Apply consistent order to filters so the unique constraint on
        -- (subscription_id, entity, filters) can't be tricked by a different filter order
        new.filters = coalesce(
            array_agg(f order by f.column_name, f.op, f.value),
            '{}'
        ) from unnest(new.filters) f;

        return new;
    end;
    $$;


ALTER FUNCTION realtime.subscription_check_filters() OWNER TO supabase_admin;

--
-- Name: to_regrole(text); Type: FUNCTION; Schema: realtime; Owner: supabase_admin
--

CREATE FUNCTION realtime.to_regrole(role_name text) RETURNS regrole
    LANGUAGE sql IMMUTABLE
    AS $$ select role_name::regrole $$;


ALTER FUNCTION realtime.to_regrole(role_name text) OWNER TO supabase_admin;

--
-- Name: topic(); Type: FUNCTION; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE FUNCTION realtime.topic() RETURNS text
    LANGUAGE sql STABLE
    AS $$
select nullif(current_setting('realtime.topic', true), '')::text;
$$;


ALTER FUNCTION realtime.topic() OWNER TO supabase_realtime_admin;

--
-- Name: add_prefixes(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.add_prefixes(_bucket_id text, _name text) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    prefixes text[];
BEGIN
    prefixes := "storage"."get_prefixes"("_name");

    IF array_length(prefixes, 1) > 0 THEN
        INSERT INTO storage.prefixes (name, bucket_id)
        SELECT UNNEST(prefixes) as name, "_bucket_id" ON CONFLICT DO NOTHING;
    END IF;
END;
$$;


ALTER FUNCTION storage.add_prefixes(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: can_insert_object(text, text, uuid, jsonb); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO "storage"."objects" ("bucket_id", "name", "owner", "metadata") VALUES (bucketid, name, owner, metadata);
  -- hack to rollback the successful insert
  RAISE sqlstate 'PT200' using
  message = 'ROLLBACK',
  detail = 'rollback successful insert';
END
$$;


ALTER FUNCTION storage.can_insert_object(bucketid text, name text, owner uuid, metadata jsonb) OWNER TO supabase_storage_admin;

--
-- Name: delete_leaf_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_rows_deleted integer;
BEGIN
    LOOP
        WITH candidates AS (
            SELECT DISTINCT
                t.bucket_id,
                unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        ),
        uniq AS (
             SELECT
                 bucket_id,
                 name,
                 storage.get_level(name) AS level
             FROM candidates
             WHERE name <> ''
             GROUP BY bucket_id, name
        ),
        leaf AS (
             SELECT
                 p.bucket_id,
                 p.name,
                 p.level
             FROM storage.prefixes AS p
                  JOIN uniq AS u
                       ON u.bucket_id = p.bucket_id
                           AND u.name = p.name
                           AND u.level = p.level
             WHERE NOT EXISTS (
                 SELECT 1
                 FROM storage.objects AS o
                 WHERE o.bucket_id = p.bucket_id
                   AND o.level = p.level + 1
                   AND o.name COLLATE "C" LIKE p.name || '/%'
             )
             AND NOT EXISTS (
                 SELECT 1
                 FROM storage.prefixes AS c
                 WHERE c.bucket_id = p.bucket_id
                   AND c.level = p.level + 1
                   AND c.name COLLATE "C" LIKE p.name || '/%'
             )
        )
        DELETE
        FROM storage.prefixes AS p
            USING leaf AS l
        WHERE p.bucket_id = l.bucket_id
          AND p.name = l.name
          AND p.level = l.level;

        GET DIAGNOSTICS v_rows_deleted = ROW_COUNT;
        EXIT WHEN v_rows_deleted = 0;
    END LOOP;
END;
$$;


ALTER FUNCTION storage.delete_leaf_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix(text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix(_bucket_id text, _name text) RETURNS boolean
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
BEGIN
    -- Check if we can delete the prefix
    IF EXISTS(
        SELECT FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name") + 1
          AND "prefixes"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    )
    OR EXISTS(
        SELECT FROM "storage"."objects"
        WHERE "objects"."bucket_id" = "_bucket_id"
          AND "storage"."get_level"("objects"."name") = "storage"."get_level"("_name") + 1
          AND "objects"."name" COLLATE "C" LIKE "_name" || '/%'
        LIMIT 1
    ) THEN
    -- There are sub-objects, skip deletion
    RETURN false;
    ELSE
        DELETE FROM "storage"."prefixes"
        WHERE "prefixes"."bucket_id" = "_bucket_id"
          AND level = "storage"."get_level"("_name")
          AND "prefixes"."name" = "_name";
        RETURN true;
    END IF;
END;
$$;


ALTER FUNCTION storage.delete_prefix(_bucket_id text, _name text) OWNER TO supabase_storage_admin;

--
-- Name: delete_prefix_hierarchy_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.delete_prefix_hierarchy_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    prefix text;
BEGIN
    prefix := "storage"."get_prefix"(OLD."name");

    IF coalesce(prefix, '') != '' THEN
        PERFORM "storage"."delete_prefix"(OLD."bucket_id", prefix);
    END IF;

    RETURN OLD;
END;
$$;


ALTER FUNCTION storage.delete_prefix_hierarchy_trigger() OWNER TO supabase_storage_admin;

--
-- Name: enforce_bucket_name_length(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.enforce_bucket_name_length() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
    if length(new.name) > 100 then
        raise exception 'bucket name "%" is too long (% characters). Max is 100.', new.name, length(new.name);
    end if;
    return new;
end;
$$;


ALTER FUNCTION storage.enforce_bucket_name_length() OWNER TO supabase_storage_admin;

--
-- Name: extension(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.extension(name text) RETURNS text
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
    _filename text;
BEGIN
    SELECT string_to_array(name, '/') INTO _parts;
    SELECT _parts[array_length(_parts,1)] INTO _filename;
    RETURN reverse(split_part(reverse(_filename), '.', 1));
END
$$;


ALTER FUNCTION storage.extension(name text) OWNER TO supabase_storage_admin;

--
-- Name: filename(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.filename(name text) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
_parts text[];
BEGIN
	select string_to_array(name, '/') into _parts;
	return _parts[array_length(_parts,1)];
END
$$;


ALTER FUNCTION storage.filename(name text) OWNER TO supabase_storage_admin;

--
-- Name: foldername(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.foldername(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE
    AS $$
DECLARE
    _parts text[];
BEGIN
    -- Split on "/" to get path segments
    SELECT string_to_array(name, '/') INTO _parts;
    -- Return everything except the last segment
    RETURN _parts[1 : array_length(_parts,1) - 1];
END
$$;


ALTER FUNCTION storage.foldername(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_level(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_level(name text) RETURNS integer
    LANGUAGE sql IMMUTABLE STRICT
    AS $$
SELECT array_length(string_to_array("name", '/'), 1);
$$;


ALTER FUNCTION storage.get_level(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefix(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefix(name text) RETURNS text
    LANGUAGE sql IMMUTABLE STRICT
    AS $_$
SELECT
    CASE WHEN strpos("name", '/') > 0 THEN
             regexp_replace("name", '[\/]{1}[^\/]+\/?$', '')
         ELSE
             ''
        END;
$_$;


ALTER FUNCTION storage.get_prefix(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_prefixes(text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_prefixes(name text) RETURNS text[]
    LANGUAGE plpgsql IMMUTABLE STRICT
    AS $$
DECLARE
    parts text[];
    prefixes text[];
    prefix text;
BEGIN
    -- Split the name into parts by '/'
    parts := string_to_array("name", '/');
    prefixes := '{}';

    -- Construct the prefixes, stopping one level below the last part
    FOR i IN 1..array_length(parts, 1) - 1 LOOP
            prefix := array_to_string(parts[1:i], '/');
            prefixes := array_append(prefixes, prefix);
    END LOOP;

    RETURN prefixes;
END;
$$;


ALTER FUNCTION storage.get_prefixes(name text) OWNER TO supabase_storage_admin;

--
-- Name: get_size_by_bucket(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.get_size_by_bucket() RETURNS TABLE(size bigint, bucket_id text)
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    return query
        select sum((metadata->>'size')::bigint) as size, obj.bucket_id
        from "storage".objects as obj
        group by obj.bucket_id;
END
$$;


ALTER FUNCTION storage.get_size_by_bucket() OWNER TO supabase_storage_admin;

--
-- Name: list_multipart_uploads_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, next_key_token text DEFAULT ''::text, next_upload_token text DEFAULT ''::text) RETURNS TABLE(key text, id text, created_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(key COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                        substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1)))
                    ELSE
                        key
                END AS key, id, created_at
            FROM
                storage.s3_multipart_uploads
            WHERE
                bucket_id = $5 AND
                key ILIKE $1 || ''%'' AND
                CASE
                    WHEN $4 != '''' AND $6 = '''' THEN
                        CASE
                            WHEN position($2 IN substring(key from length($1) + 1)) > 0 THEN
                                substring(key from 1 for length($1) + position($2 IN substring(key from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                key COLLATE "C" > $4
                            END
                    ELSE
                        true
                END AND
                CASE
                    WHEN $6 != '''' THEN
                        id COLLATE "C" > $6
                    ELSE
                        true
                    END
            ORDER BY
                key COLLATE "C" ASC, created_at ASC) as e order by key COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_key_token, bucket_id, next_upload_token;
END;
$_$;


ALTER FUNCTION storage.list_multipart_uploads_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, next_key_token text, next_upload_token text) OWNER TO supabase_storage_admin;

--
-- Name: list_objects_with_delimiter(text, text, text, integer, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer DEFAULT 100, start_after text DEFAULT ''::text, next_token text DEFAULT ''::text) RETURNS TABLE(name text, id uuid, metadata jsonb, updated_at timestamp with time zone)
    LANGUAGE plpgsql
    AS $_$
BEGIN
    RETURN QUERY EXECUTE
        'SELECT DISTINCT ON(name COLLATE "C") * from (
            SELECT
                CASE
                    WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                        substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1)))
                    ELSE
                        name
                END AS name, id, metadata, updated_at
            FROM
                storage.objects
            WHERE
                bucket_id = $5 AND
                name ILIKE $1 || ''%'' AND
                CASE
                    WHEN $6 != '''' THEN
                    name COLLATE "C" > $6
                ELSE true END
                AND CASE
                    WHEN $4 != '''' THEN
                        CASE
                            WHEN position($2 IN substring(name from length($1) + 1)) > 0 THEN
                                substring(name from 1 for length($1) + position($2 IN substring(name from length($1) + 1))) COLLATE "C" > $4
                            ELSE
                                name COLLATE "C" > $4
                            END
                    ELSE
                        true
                END
            ORDER BY
                name COLLATE "C" ASC) as e order by name COLLATE "C" LIMIT $3'
        USING prefix_param, delimiter_param, max_keys, next_token, bucket_id, start_after;
END;
$_$;


ALTER FUNCTION storage.list_objects_with_delimiter(bucket_id text, prefix_param text, delimiter_param text, max_keys integer, start_after text, next_token text) OWNER TO supabase_storage_admin;

--
-- Name: lock_top_prefixes(text[], text[]); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket text;
    v_top text;
BEGIN
    FOR v_bucket, v_top IN
        SELECT DISTINCT t.bucket_id,
            split_part(t.name, '/', 1) AS top
        FROM unnest(bucket_ids, names) AS t(bucket_id, name)
        WHERE t.name <> ''
        ORDER BY 1, 2
        LOOP
            PERFORM pg_advisory_xact_lock(hashtextextended(v_bucket || '/' || v_top, 0));
        END LOOP;
END;
$$;


ALTER FUNCTION storage.lock_top_prefixes(bucket_ids text[], names text[]) OWNER TO supabase_storage_admin;

--
-- Name: objects_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_insert_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_insert_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    NEW.level := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_insert_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    -- NEW - OLD (destinations to create prefixes for)
    v_add_bucket_ids text[];
    v_add_names      text[];

    -- OLD - NEW (sources to prune)
    v_src_bucket_ids text[];
    v_src_names      text[];
BEGIN
    IF TG_OP <> 'UPDATE' THEN
        RETURN NULL;
    END IF;

    -- 1) Compute NEW−OLD (added paths) and OLD−NEW (moved-away paths)
    WITH added AS (
        SELECT n.bucket_id, n.name
        FROM new_rows n
        WHERE n.name <> '' AND position('/' in n.name) > 0
        EXCEPT
        SELECT o.bucket_id, o.name FROM old_rows o WHERE o.name <> ''
    ),
    moved AS (
         SELECT o.bucket_id, o.name
         FROM old_rows o
         WHERE o.name <> ''
         EXCEPT
         SELECT n.bucket_id, n.name FROM new_rows n WHERE n.name <> ''
    )
    SELECT
        -- arrays for ADDED (dest) in stable order
        COALESCE( (SELECT array_agg(a.bucket_id ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        COALESCE( (SELECT array_agg(a.name      ORDER BY a.bucket_id, a.name) FROM added a), '{}' ),
        -- arrays for MOVED (src) in stable order
        COALESCE( (SELECT array_agg(m.bucket_id ORDER BY m.bucket_id, m.name) FROM moved m), '{}' ),
        COALESCE( (SELECT array_agg(m.name      ORDER BY m.bucket_id, m.name) FROM moved m), '{}' )
    INTO v_add_bucket_ids, v_add_names, v_src_bucket_ids, v_src_names;

    -- Nothing to do?
    IF (array_length(v_add_bucket_ids, 1) IS NULL) AND (array_length(v_src_bucket_ids, 1) IS NULL) THEN
        RETURN NULL;
    END IF;

    -- 2) Take per-(bucket, top) locks: ALL prefixes in consistent global order to prevent deadlocks
    DECLARE
        v_all_bucket_ids text[];
        v_all_names text[];
    BEGIN
        -- Combine source and destination arrays for consistent lock ordering
        v_all_bucket_ids := COALESCE(v_src_bucket_ids, '{}') || COALESCE(v_add_bucket_ids, '{}');
        v_all_names := COALESCE(v_src_names, '{}') || COALESCE(v_add_names, '{}');

        -- Single lock call ensures consistent global ordering across all transactions
        IF array_length(v_all_bucket_ids, 1) IS NOT NULL THEN
            PERFORM storage.lock_top_prefixes(v_all_bucket_ids, v_all_names);
        END IF;
    END;

    -- 3) Create destination prefixes (NEW−OLD) BEFORE pruning sources
    IF array_length(v_add_bucket_ids, 1) IS NOT NULL THEN
        WITH candidates AS (
            SELECT DISTINCT t.bucket_id, unnest(storage.get_prefixes(t.name)) AS name
            FROM unnest(v_add_bucket_ids, v_add_names) AS t(bucket_id, name)
            WHERE name <> ''
        )
        INSERT INTO storage.prefixes (bucket_id, name)
        SELECT c.bucket_id, c.name
        FROM candidates c
        ON CONFLICT DO NOTHING;
    END IF;

    -- 4) Prune source prefixes bottom-up for OLD−NEW
    IF array_length(v_src_bucket_ids, 1) IS NOT NULL THEN
        -- re-entrancy guard so DELETE on prefixes won't recurse
        IF current_setting('storage.gc.prefixes', true) <> '1' THEN
            PERFORM set_config('storage.gc.prefixes', '1', true);
        END IF;

        PERFORM storage.delete_leaf_prefixes(v_src_bucket_ids, v_src_names);
    END IF;

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.objects_update_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_level_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_level_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Set the new level
        NEW."level" := "storage"."get_level"(NEW."name");
    END IF;
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_level_trigger() OWNER TO supabase_storage_admin;

--
-- Name: objects_update_prefix_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.objects_update_prefix_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    old_prefixes TEXT[];
BEGIN
    -- Ensure this is an update operation and the name has changed
    IF TG_OP = 'UPDATE' AND (NEW."name" <> OLD."name" OR NEW."bucket_id" <> OLD."bucket_id") THEN
        -- Retrieve old prefixes
        old_prefixes := "storage"."get_prefixes"(OLD."name");

        -- Remove old prefixes that are only used by this object
        WITH all_prefixes as (
            SELECT unnest(old_prefixes) as prefix
        ),
        can_delete_prefixes as (
             SELECT prefix
             FROM all_prefixes
             WHERE NOT EXISTS (
                 SELECT 1 FROM "storage"."objects"
                 WHERE "bucket_id" = OLD."bucket_id"
                   AND "name" <> OLD."name"
                   AND "name" LIKE (prefix || '%')
             )
         )
        DELETE FROM "storage"."prefixes" WHERE name IN (SELECT prefix FROM can_delete_prefixes);

        -- Add new prefixes
        PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    END IF;
    -- Set the new level
    NEW."level" := "storage"."get_level"(NEW."name");

    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.objects_update_prefix_trigger() OWNER TO supabase_storage_admin;

--
-- Name: operation(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.operation() RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
BEGIN
    RETURN current_setting('storage.operation', true);
END;
$$;


ALTER FUNCTION storage.operation() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_delete_cleanup(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_delete_cleanup() RETURNS trigger
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    v_bucket_ids text[];
    v_names      text[];
BEGIN
    IF current_setting('storage.gc.prefixes', true) = '1' THEN
        RETURN NULL;
    END IF;

    PERFORM set_config('storage.gc.prefixes', '1', true);

    SELECT COALESCE(array_agg(d.bucket_id), '{}'),
           COALESCE(array_agg(d.name), '{}')
    INTO v_bucket_ids, v_names
    FROM deleted AS d
    WHERE d.name <> '';

    PERFORM storage.lock_top_prefixes(v_bucket_ids, v_names);
    PERFORM storage.delete_leaf_prefixes(v_bucket_ids, v_names);

    RETURN NULL;
END;
$$;


ALTER FUNCTION storage.prefixes_delete_cleanup() OWNER TO supabase_storage_admin;

--
-- Name: prefixes_insert_trigger(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.prefixes_insert_trigger() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    PERFORM "storage"."add_prefixes"(NEW."bucket_id", NEW."name");
    RETURN NEW;
END;
$$;


ALTER FUNCTION storage.prefixes_insert_trigger() OWNER TO supabase_storage_admin;

--
-- Name: search(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql
    AS $$
declare
    can_bypass_rls BOOLEAN;
begin
    SELECT rolbypassrls
    INTO can_bypass_rls
    FROM pg_roles
    WHERE rolname = coalesce(nullif(current_setting('role', true), 'none'), current_user);

    IF can_bypass_rls THEN
        RETURN QUERY SELECT * FROM storage.search_v1_optimised(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    ELSE
        RETURN QUERY SELECT * FROM storage.search_legacy_v1(prefix, bucketname, limits, levels, offsets, search, sortcolumn, sortorder);
    END IF;
end;
$$;


ALTER FUNCTION storage.search(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_legacy_v1(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select path_tokens[$1] as folder
           from storage.objects
             where objects.name ilike $2 || $3 || ''%''
               and bucket_id = $4
               and array_length(objects.path_tokens, 1) <> $1
           group by folder
           order by folder ' || v_sort_order || '
     )
     (select folder as "name",
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[$1] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where objects.name ilike $2 || $3 || ''%''
       and bucket_id = $4
       and array_length(objects.path_tokens, 1) = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_legacy_v1(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v1_optimised(text, text, integer, integer, integer, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer DEFAULT 100, levels integer DEFAULT 1, offsets integer DEFAULT 0, search text DEFAULT ''::text, sortcolumn text DEFAULT 'name'::text, sortorder text DEFAULT 'asc'::text) RETURNS TABLE(name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
declare
    v_order_by text;
    v_sort_order text;
begin
    case
        when sortcolumn = 'name' then
            v_order_by = 'name';
        when sortcolumn = 'updated_at' then
            v_order_by = 'updated_at';
        when sortcolumn = 'created_at' then
            v_order_by = 'created_at';
        when sortcolumn = 'last_accessed_at' then
            v_order_by = 'last_accessed_at';
        else
            v_order_by = 'name';
        end case;

    case
        when sortorder = 'asc' then
            v_sort_order = 'asc';
        when sortorder = 'desc' then
            v_sort_order = 'desc';
        else
            v_sort_order = 'asc';
        end case;

    v_order_by = v_order_by || ' ' || v_sort_order;

    return query execute
        'with folders as (
           select (string_to_array(name, ''/''))[level] as name
           from storage.prefixes
             where lower(prefixes.name) like lower($2 || $3) || ''%''
               and bucket_id = $4
               and level = $1
           order by name ' || v_sort_order || '
     )
     (select name,
            null as id,
            null as updated_at,
            null as created_at,
            null as last_accessed_at,
            null as metadata from folders)
     union all
     (select path_tokens[level] as "name",
            id,
            updated_at,
            created_at,
            last_accessed_at,
            metadata
     from storage.objects
     where lower(objects.name) like lower($2 || $3) || ''%''
       and bucket_id = $4
       and level = $1
     order by ' || v_order_by || ')
     limit $5
     offset $6' using levels, prefix, search, bucketname, limits, offsets;
end;
$_$;


ALTER FUNCTION storage.search_v1_optimised(prefix text, bucketname text, limits integer, levels integer, offsets integer, search text, sortcolumn text, sortorder text) OWNER TO supabase_storage_admin;

--
-- Name: search_v2(text, text, integer, integer, text, text, text, text); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer DEFAULT 100, levels integer DEFAULT 1, start_after text DEFAULT ''::text, sort_order text DEFAULT 'asc'::text, sort_column text DEFAULT 'name'::text, sort_column_after text DEFAULT ''::text) RETURNS TABLE(key text, name text, id uuid, updated_at timestamp with time zone, created_at timestamp with time zone, last_accessed_at timestamp with time zone, metadata jsonb)
    LANGUAGE plpgsql STABLE
    AS $_$
DECLARE
    sort_col text;
    sort_ord text;
    cursor_op text;
    cursor_expr text;
    sort_expr text;
BEGIN
    -- Validate sort_order
    sort_ord := lower(sort_order);
    IF sort_ord NOT IN ('asc', 'desc') THEN
        sort_ord := 'asc';
    END IF;

    -- Determine cursor comparison operator
    IF sort_ord = 'asc' THEN
        cursor_op := '>';
    ELSE
        cursor_op := '<';
    END IF;
    
    sort_col := lower(sort_column);
    -- Validate sort column  
    IF sort_col IN ('updated_at', 'created_at') THEN
        cursor_expr := format(
            '($5 = '''' OR ROW(date_trunc(''milliseconds'', %I), name COLLATE "C") %s ROW(COALESCE(NULLIF($6, '''')::timestamptz, ''epoch''::timestamptz), $5))',
            sort_col, cursor_op
        );
        sort_expr := format(
            'COALESCE(date_trunc(''milliseconds'', %I), ''epoch''::timestamptz) %s, name COLLATE "C" %s',
            sort_col, sort_ord, sort_ord
        );
    ELSE
        cursor_expr := format('($5 = '''' OR name COLLATE "C" %s $5)', cursor_op);
        sort_expr := format('name COLLATE "C" %s', sort_ord);
    END IF;

    RETURN QUERY EXECUTE format(
        $sql$
        SELECT * FROM (
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    NULL::uuid AS id,
                    updated_at,
                    created_at,
                    NULL::timestamptz AS last_accessed_at,
                    NULL::jsonb AS metadata
                FROM storage.prefixes
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
            UNION ALL
            (
                SELECT
                    split_part(name, '/', $4) AS key,
                    name,
                    id,
                    updated_at,
                    created_at,
                    last_accessed_at,
                    metadata
                FROM storage.objects
                WHERE name COLLATE "C" LIKE $1 || '%%'
                    AND bucket_id = $2
                    AND level = $4
                    AND %s
                ORDER BY %s
                LIMIT $3
            )
        ) obj
        ORDER BY %s
        LIMIT $3
        $sql$,
        cursor_expr,    -- prefixes WHERE
        sort_expr,      -- prefixes ORDER BY
        cursor_expr,    -- objects WHERE
        sort_expr,      -- objects ORDER BY
        sort_expr       -- final ORDER BY
    )
    USING prefix, bucket_name, limits, levels, start_after, sort_column_after;
END;
$_$;


ALTER FUNCTION storage.search_v2(prefix text, bucket_name text, limits integer, levels integer, start_after text, sort_order text, sort_column text, sort_column_after text) OWNER TO supabase_storage_admin;

--
-- Name: update_updated_at_column(); Type: FUNCTION; Schema: storage; Owner: supabase_storage_admin
--

CREATE FUNCTION storage.update_updated_at_column() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.updated_at = now();
    RETURN NEW; 
END;
$$;


ALTER FUNCTION storage.update_updated_at_column() OWNER TO supabase_storage_admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL,
    auth_code_issued_at timestamp with time zone
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    provider_id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED,
    id uuid DEFAULT gen_random_uuid() NOT NULL
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL,
    otp_code text,
    web_authn_session_data jsonb
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text,
    phone text,
    last_challenged_at timestamp with time zone,
    web_authn_credential jsonb,
    web_authn_aaguid uuid,
    last_webauthn_challenge_data jsonb
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: COLUMN mfa_factors.last_webauthn_challenge_data; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.mfa_factors.last_webauthn_challenge_data IS 'Stores the latest WebAuthn challenge data including attestation/assertion for customer verification';


--
-- Name: oauth_authorizations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_authorizations (
    id uuid NOT NULL,
    authorization_id text NOT NULL,
    client_id uuid NOT NULL,
    user_id uuid,
    redirect_uri text NOT NULL,
    scope text NOT NULL,
    state text,
    resource text,
    code_challenge text,
    code_challenge_method auth.code_challenge_method,
    response_type auth.oauth_response_type DEFAULT 'code'::auth.oauth_response_type NOT NULL,
    status auth.oauth_authorization_status DEFAULT 'pending'::auth.oauth_authorization_status NOT NULL,
    authorization_code text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    expires_at timestamp with time zone DEFAULT (now() + '00:03:00'::interval) NOT NULL,
    approved_at timestamp with time zone,
    CONSTRAINT oauth_authorizations_authorization_code_length CHECK ((char_length(authorization_code) <= 255)),
    CONSTRAINT oauth_authorizations_code_challenge_length CHECK ((char_length(code_challenge) <= 128)),
    CONSTRAINT oauth_authorizations_expires_at_future CHECK ((expires_at > created_at)),
    CONSTRAINT oauth_authorizations_redirect_uri_length CHECK ((char_length(redirect_uri) <= 2048)),
    CONSTRAINT oauth_authorizations_resource_length CHECK ((char_length(resource) <= 2048)),
    CONSTRAINT oauth_authorizations_scope_length CHECK ((char_length(scope) <= 4096)),
    CONSTRAINT oauth_authorizations_state_length CHECK ((char_length(state) <= 4096))
);


ALTER TABLE auth.oauth_authorizations OWNER TO supabase_auth_admin;

--
-- Name: oauth_clients; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_clients (
    id uuid NOT NULL,
    client_secret_hash text,
    registration_type auth.oauth_registration_type NOT NULL,
    redirect_uris text NOT NULL,
    grant_types text NOT NULL,
    client_name text,
    client_uri text,
    logo_uri text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    client_type auth.oauth_client_type DEFAULT 'confidential'::auth.oauth_client_type NOT NULL,
    CONSTRAINT oauth_clients_client_name_length CHECK ((char_length(client_name) <= 1024)),
    CONSTRAINT oauth_clients_client_uri_length CHECK ((char_length(client_uri) <= 2048)),
    CONSTRAINT oauth_clients_logo_uri_length CHECK ((char_length(logo_uri) <= 2048))
);


ALTER TABLE auth.oauth_clients OWNER TO supabase_auth_admin;

--
-- Name: oauth_consents; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.oauth_consents (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    client_id uuid NOT NULL,
    scopes text NOT NULL,
    granted_at timestamp with time zone DEFAULT now() NOT NULL,
    revoked_at timestamp with time zone,
    CONSTRAINT oauth_consents_revoked_after_granted CHECK (((revoked_at IS NULL) OR (revoked_at >= granted_at))),
    CONSTRAINT oauth_consents_scopes_length CHECK ((char_length(scopes) <= 2048)),
    CONSTRAINT oauth_consents_scopes_not_empty CHECK ((char_length(TRIM(BOTH FROM scopes)) > 0))
);


ALTER TABLE auth.oauth_consents OWNER TO supabase_auth_admin;

--
-- Name: one_time_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.one_time_tokens (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    token_type auth.one_time_token_type NOT NULL,
    token_hash text NOT NULL,
    relates_to text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    CONSTRAINT one_time_tokens_token_hash_check CHECK ((char_length(token_hash) > 0))
);


ALTER TABLE auth.one_time_tokens OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    name_id_format text,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    flow_state_id uuid,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone,
    refreshed_at timestamp without time zone,
    user_agent text,
    ip inet,
    tag text,
    oauth_client_id uuid,
    refresh_token_hmac_key text,
    refresh_token_counter bigint
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: COLUMN sessions.refresh_token_hmac_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_hmac_key IS 'Holds a HMAC-SHA256 key used to sign refresh tokens for this session.';


--
-- Name: COLUMN sessions.refresh_token_counter; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.refresh_token_counter IS 'Holds the ID (counter) of the last issued refresh token.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    disabled boolean,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    is_anonymous boolean DEFAULT false NOT NULL,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: Clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Clientes" (
    id_cliente integer NOT NULL,
    nombre character varying(100) NOT NULL,
    direccion character varying(200),
    telefono character varying(20),
    email character varying(100)
);


ALTER TABLE public."Clientes" OWNER TO postgres;

--
-- Name: Clientes_id_cliente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Clientes_id_cliente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Clientes_id_cliente_seq" OWNER TO postgres;

--
-- Name: Clientes_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Clientes_id_cliente_seq" OWNED BY public."Clientes".id_cliente;


--
-- Name: Depositos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Depositos" (
    id_deposito integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public."Depositos" OWNER TO postgres;

--
-- Name: Depositos_id_deposito_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Depositos_id_deposito_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Depositos_id_deposito_seq" OWNER TO postgres;

--
-- Name: Depositos_id_deposito_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Depositos_id_deposito_seq" OWNED BY public."Depositos".id_deposito;


--
-- Name: Empleados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Empleados" (
    id_empleado integer NOT NULL,
    nombre_completo character varying(100) NOT NULL
);


ALTER TABLE public."Empleados" OWNER TO postgres;

--
-- Name: Empleados_id_empleado_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Empleados_id_empleado_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Empleados_id_empleado_seq" OWNER TO postgres;

--
-- Name: Empleados_id_empleado_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Empleados_id_empleado_seq" OWNED BY public."Empleados".id_empleado;


--
-- Name: EstadosPedido; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EstadosPedido" (
    id_estado integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public."EstadosPedido" OWNER TO postgres;

--
-- Name: EstadosPresupuesto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EstadosPresupuesto" (
    id_estado integer NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public."EstadosPresupuesto" OWNER TO postgres;

--
-- Name: FacturaDetalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FacturaDetalles" (
    id_detalle integer NOT NULL,
    id_factura integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(12,2) NOT NULL,
    porcentaje_iva numeric(5,2) NOT NULL,
    subtotal numeric(15,2) GENERATED ALWAYS AS (((cantidad)::numeric * precio_unitario)) STORED
);


ALTER TABLE public."FacturaDetalles" OWNER TO postgres;

--
-- Name: FacturaDetalles_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FacturaDetalles_id_detalle_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."FacturaDetalles_id_detalle_seq" OWNER TO postgres;

--
-- Name: FacturaDetalles_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FacturaDetalles_id_detalle_seq" OWNED BY public."FacturaDetalles".id_detalle;


--
-- Name: Facturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Facturas" (
    id_factura integer NOT NULL,
    id_pedido integer NOT NULL,
    numero_factura character varying(50) NOT NULL,
    fecha_emision timestamp without time zone DEFAULT now() NOT NULL,
    estado public."Facturas_estado_enum" DEFAULT 'Emitida'::public."Facturas_estado_enum" NOT NULL
);


ALTER TABLE public."Facturas" OWNER TO postgres;

--
-- Name: Facturas_id_factura_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Facturas_id_factura_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Facturas_id_factura_seq" OWNER TO postgres;

--
-- Name: Facturas_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Facturas_id_factura_seq" OWNED BY public."Facturas".id_factura;


--
-- Name: Marcas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Marcas" (
    id_marca integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public."Marcas" OWNER TO postgres;

--
-- Name: Marcas_id_marca_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Marcas_id_marca_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Marcas_id_marca_seq" OWNER TO postgres;

--
-- Name: Marcas_id_marca_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Marcas_id_marca_seq" OWNED BY public."Marcas".id_marca;


--
-- Name: Motivos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Motivos" (
    id_motivo integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public."Motivos" OWNER TO postgres;

--
-- Name: Motivos_id_motivo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Motivos_id_motivo_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Motivos_id_motivo_seq" OWNER TO postgres;

--
-- Name: Motivos_id_motivo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Motivos_id_motivo_seq" OWNED BY public."Motivos".id_motivo;


--
-- Name: PedidoDetalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PedidoDetalles" (
    id_detalle integer NOT NULL,
    id_pedido integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(12,2) NOT NULL,
    subtotal numeric(15,2) GENERATED ALWAYS AS (((cantidad)::numeric * precio_unitario)) STORED
);


ALTER TABLE public."PedidoDetalles" OWNER TO postgres;

--
-- Name: PedidoDetalles_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PedidoDetalles_id_detalle_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PedidoDetalles_id_detalle_seq" OWNER TO postgres;

--
-- Name: PedidoDetalles_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PedidoDetalles_id_detalle_seq" OWNED BY public."PedidoDetalles".id_detalle;


--
-- Name: Pedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Pedidos" (
    id_pedido integer NOT NULL,
    id_cliente integer NOT NULL,
    id_presupuesto integer NOT NULL,
    fecha_generacion timestamp without time zone DEFAULT now() NOT NULL,
    id_estado integer DEFAULT 1 NOT NULL,
    id_motivo integer NOT NULL,
    id_deposito_origen integer NOT NULL
);


ALTER TABLE public."Pedidos" OWNER TO postgres;

--
-- Name: PedidosLog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PedidosLog" (
    id_log integer NOT NULL,
    id_pedido integer,
    accion text,
    fecha timestamp with time zone DEFAULT now()
);


ALTER TABLE public."PedidosLog" OWNER TO postgres;

--
-- Name: PedidosLog_id_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PedidosLog_id_log_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PedidosLog_id_log_seq" OWNER TO postgres;

--
-- Name: PedidosLog_id_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PedidosLog_id_log_seq" OWNED BY public."PedidosLog".id_log;


--
-- Name: Pedidos_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Pedidos_id_pedido_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Pedidos_id_pedido_seq" OWNER TO postgres;

--
-- Name: Pedidos_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Pedidos_id_pedido_seq" OWNED BY public."Pedidos".id_pedido;


--
-- Name: PresupuestoDetalles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PresupuestoDetalles" (
    id_detalle integer NOT NULL,
    id_presupuesto integer NOT NULL,
    id_producto integer NOT NULL,
    cantidad integer NOT NULL,
    precio_unitario numeric(12,2) NOT NULL,
    subtotal numeric(15,2) GENERATED ALWAYS AS (((cantidad)::numeric * precio_unitario)) STORED
);


ALTER TABLE public."PresupuestoDetalles" OWNER TO postgres;

--
-- Name: PresupuestoDetalles_id_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."PresupuestoDetalles_id_detalle_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."PresupuestoDetalles_id_detalle_seq" OWNER TO postgres;

--
-- Name: PresupuestoDetalles_id_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."PresupuestoDetalles_id_detalle_seq" OWNED BY public."PresupuestoDetalles".id_detalle;


--
-- Name: Presupuestos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Presupuestos" (
    id_presupuesto integer NOT NULL,
    id_cliente integer NOT NULL,
    id_empleado integer NOT NULL,
    fecha_emision timestamp without time zone DEFAULT now() NOT NULL,
    forma_pago public."Presupuestos_forma_pago_enum" NOT NULL,
    id_estado integer DEFAULT 10 NOT NULL,
    id_motivo integer,
    importe_total numeric(15,2) NOT NULL
);


ALTER TABLE public."Presupuestos" OWNER TO postgres;

--
-- Name: PresupuestosPorEstado; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."PresupuestosPorEstado" AS
 SELECT e.nombre AS estado,
    count(p.id_presupuesto) AS cantidad
   FROM (public."Presupuestos" p
     JOIN public."EstadosPresupuesto" e ON ((p.id_estado = e.id_estado)))
  GROUP BY e.nombre;


ALTER VIEW public."PresupuestosPorEstado" OWNER TO postgres;

--
-- Name: PresupuestosRechazados; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."PresupuestosRechazados" AS
 SELECT p.id_presupuesto,
    c.nombre AS cliente,
    e.nombre_completo AS empleado,
    p.fecha_emision,
    p.forma_pago,
    p.importe_total,
    ep.nombre AS estado,
    m.descripcion AS motivo
   FROM ((((public."Presupuestos" p
     JOIN public."Clientes" c ON ((p.id_cliente = c.id_cliente)))
     JOIN public."Empleados" e ON ((p.id_empleado = e.id_empleado)))
     JOIN public."EstadosPresupuesto" ep ON ((p.id_estado = ep.id_estado)))
     LEFT JOIN public."Motivos" m ON ((p.id_motivo = m.id_motivo)))
  WHERE ((ep.nombre)::text = 'Rechazado'::text)
 LIMIT 2;


ALTER VIEW public."PresupuestosRechazados" OWNER TO postgres;

--
-- Name: Presupuestos_id_presupuesto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Presupuestos_id_presupuesto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Presupuestos_id_presupuesto_seq" OWNER TO postgres;

--
-- Name: Presupuestos_id_presupuesto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Presupuestos_id_presupuesto_seq" OWNED BY public."Presupuestos".id_presupuesto;


--
-- Name: Productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Productos" (
    id_producto integer NOT NULL,
    descripcion character varying(255) NOT NULL,
    id_marca integer NOT NULL,
    id_tipo_producto integer NOT NULL,
    aplica_iva boolean DEFAULT true NOT NULL,
    porcentaje_iva numeric(5,2) DEFAULT 10 NOT NULL,
    precio_venta numeric(12,2) NOT NULL,
    precio_compra numeric(12,2) NOT NULL
);


ALTER TABLE public."Productos" OWNER TO postgres;

--
-- Name: Productos_id_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Productos_id_producto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Productos_id_producto_seq" OWNER TO postgres;

--
-- Name: Productos_id_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Productos_id_producto_seq" OWNED BY public."Productos".id_producto;


--
-- Name: Stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Stock" (
    id_stock integer NOT NULL,
    id_producto integer NOT NULL,
    id_deposito integer NOT NULL,
    cantidad_disponible integer DEFAULT 0 NOT NULL,
    cantidad_confirmada integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Stock" OWNER TO postgres;

--
-- Name: Stock_id_stock_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Stock_id_stock_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Stock_id_stock_seq" OWNER TO postgres;

--
-- Name: Stock_id_stock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Stock_id_stock_seq" OWNED BY public."Stock".id_stock;


--
-- Name: TiposProducto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TiposProducto" (
    id_tipo_producto integer NOT NULL,
    nombre character varying(100) NOT NULL
);


ALTER TABLE public."TiposProducto" OWNER TO postgres;

--
-- Name: TiposProducto_id_tipo_producto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TiposProducto_id_tipo_producto_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."TiposProducto_id_tipo_producto_seq" OWNER TO postgres;

--
-- Name: TiposProducto_id_tipo_producto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TiposProducto_id_tipo_producto_seq" OWNED BY public."TiposProducto".id_tipo_producto;


--
-- Name: pedidos_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pedidos_log (
    id integer NOT NULL,
    pedido_id integer,
    acao text,
    data timestamp without time zone DEFAULT now()
);


ALTER TABLE public.pedidos_log OWNER TO postgres;

--
-- Name: pedidos_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pedidos_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pedidos_log_id_seq OWNER TO postgres;

--
-- Name: pedidos_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pedidos_log_id_seq OWNED BY public.pedidos_log.id;


--
-- Name: vista_stock_productos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_stock_productos AS
 SELECT p.descripcion,
    m.nombre AS marca,
    s.cantidad_disponible,
    s.cantidad_confirmada
   FROM ((public."Stock" s
     JOIN public."Productos" p ON ((p.id_producto = s.id_producto)))
     JOIN public."Marcas" m ON ((m.id_marca = p.id_marca)));


ALTER VIEW public.vista_stock_productos OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE TABLE realtime.messages (
    topic text NOT NULL,
    extension text NOT NULL,
    payload jsonb,
    event text,
    private boolean DEFAULT false,
    updated_at timestamp without time zone DEFAULT now() NOT NULL,
    inserted_at timestamp without time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL
)
PARTITION BY RANGE (inserted_at);


ALTER TABLE realtime.messages OWNER TO supabase_realtime_admin;

--
-- Name: schema_migrations; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE realtime.schema_migrations OWNER TO supabase_admin;

--
-- Name: subscription; Type: TABLE; Schema: realtime; Owner: supabase_admin
--

CREATE TABLE realtime.subscription (
    id bigint NOT NULL,
    subscription_id uuid NOT NULL,
    entity regclass NOT NULL,
    filters realtime.user_defined_filter[] DEFAULT '{}'::realtime.user_defined_filter[] NOT NULL,
    claims jsonb NOT NULL,
    claims_role regrole GENERATED ALWAYS AS (realtime.to_regrole((claims ->> 'role'::text))) STORED NOT NULL,
    created_at timestamp without time zone DEFAULT timezone('utc'::text, now()) NOT NULL
);


ALTER TABLE realtime.subscription OWNER TO supabase_admin;

--
-- Name: subscription_id_seq; Type: SEQUENCE; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE realtime.subscription ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME realtime.subscription_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: buckets; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets (
    id text NOT NULL,
    name text NOT NULL,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    public boolean DEFAULT false,
    avif_autodetection boolean DEFAULT false,
    file_size_limit bigint,
    allowed_mime_types text[],
    owner_id text,
    type storage.buckettype DEFAULT 'STANDARD'::storage.buckettype NOT NULL
);


ALTER TABLE storage.buckets OWNER TO supabase_storage_admin;

--
-- Name: COLUMN buckets.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.buckets.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: buckets_analytics; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_analytics (
    name text NOT NULL,
    type storage.buckettype DEFAULT 'ANALYTICS'::storage.buckettype NOT NULL,
    format text DEFAULT 'ICEBERG'::text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE storage.buckets_analytics OWNER TO supabase_storage_admin;

--
-- Name: buckets_vectors; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.buckets_vectors (
    id text NOT NULL,
    type storage.buckettype DEFAULT 'VECTOR'::storage.buckettype NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.buckets_vectors OWNER TO supabase_storage_admin;

--
-- Name: migrations; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE storage.migrations OWNER TO supabase_storage_admin;

--
-- Name: objects; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.objects (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bucket_id text,
    name text,
    owner uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    last_accessed_at timestamp with time zone DEFAULT now(),
    metadata jsonb,
    path_tokens text[] GENERATED ALWAYS AS (string_to_array(name, '/'::text)) STORED,
    version text,
    owner_id text,
    user_metadata jsonb,
    level integer
);


ALTER TABLE storage.objects OWNER TO supabase_storage_admin;

--
-- Name: COLUMN objects.owner; Type: COMMENT; Schema: storage; Owner: supabase_storage_admin
--

COMMENT ON COLUMN storage.objects.owner IS 'Field is deprecated, use owner_id instead';


--
-- Name: prefixes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.prefixes (
    bucket_id text NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    level integer GENERATED ALWAYS AS (storage.get_level(name)) STORED NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);


ALTER TABLE storage.prefixes OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads (
    id text NOT NULL,
    in_progress_size bigint DEFAULT 0 NOT NULL,
    upload_signature text NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    version text NOT NULL,
    owner_id text,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    user_metadata jsonb
);


ALTER TABLE storage.s3_multipart_uploads OWNER TO supabase_storage_admin;

--
-- Name: s3_multipart_uploads_parts; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.s3_multipart_uploads_parts (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    upload_id text NOT NULL,
    size bigint DEFAULT 0 NOT NULL,
    part_number integer NOT NULL,
    bucket_id text NOT NULL,
    key text NOT NULL COLLATE pg_catalog."C",
    etag text NOT NULL,
    owner_id text,
    version text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.s3_multipart_uploads_parts OWNER TO supabase_storage_admin;

--
-- Name: vector_indexes; Type: TABLE; Schema: storage; Owner: supabase_storage_admin
--

CREATE TABLE storage.vector_indexes (
    id text DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL COLLATE pg_catalog."C",
    bucket_id text NOT NULL,
    data_type text NOT NULL,
    dimension integer NOT NULL,
    distance_metric text NOT NULL,
    metadata_configuration jsonb,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE storage.vector_indexes OWNER TO supabase_storage_admin;

--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Name: Clientes id_cliente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clientes" ALTER COLUMN id_cliente SET DEFAULT nextval('public."Clientes_id_cliente_seq"'::regclass);


--
-- Name: Depositos id_deposito; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Depositos" ALTER COLUMN id_deposito SET DEFAULT nextval('public."Depositos_id_deposito_seq"'::regclass);


--
-- Name: Empleados id_empleado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleados" ALTER COLUMN id_empleado SET DEFAULT nextval('public."Empleados_id_empleado_seq"'::regclass);


--
-- Name: FacturaDetalles id_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FacturaDetalles" ALTER COLUMN id_detalle SET DEFAULT nextval('public."FacturaDetalles_id_detalle_seq"'::regclass);


--
-- Name: Facturas id_factura; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturas" ALTER COLUMN id_factura SET DEFAULT nextval('public."Facturas_id_factura_seq"'::regclass);


--
-- Name: Marcas id_marca; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marcas" ALTER COLUMN id_marca SET DEFAULT nextval('public."Marcas_id_marca_seq"'::regclass);


--
-- Name: Motivos id_motivo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Motivos" ALTER COLUMN id_motivo SET DEFAULT nextval('public."Motivos_id_motivo_seq"'::regclass);


--
-- Name: PedidoDetalles id_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PedidoDetalles" ALTER COLUMN id_detalle SET DEFAULT nextval('public."PedidoDetalles_id_detalle_seq"'::regclass);


--
-- Name: Pedidos id_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedidos" ALTER COLUMN id_pedido SET DEFAULT nextval('public."Pedidos_id_pedido_seq"'::regclass);


--
-- Name: PedidosLog id_log; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PedidosLog" ALTER COLUMN id_log SET DEFAULT nextval('public."PedidosLog_id_log_seq"'::regclass);


--
-- Name: PresupuestoDetalles id_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PresupuestoDetalles" ALTER COLUMN id_detalle SET DEFAULT nextval('public."PresupuestoDetalles_id_detalle_seq"'::regclass);


--
-- Name: Presupuestos id_presupuesto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Presupuestos" ALTER COLUMN id_presupuesto SET DEFAULT nextval('public."Presupuestos_id_presupuesto_seq"'::regclass);


--
-- Name: Productos id_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Productos" ALTER COLUMN id_producto SET DEFAULT nextval('public."Productos_id_producto_seq"'::regclass);


--
-- Name: Stock id_stock; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Stock" ALTER COLUMN id_stock SET DEFAULT nextval('public."Stock_id_stock_seq"'::regclass);


--
-- Name: TiposProducto id_tipo_producto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TiposProducto" ALTER COLUMN id_tipo_producto SET DEFAULT nextval('public."TiposProducto_id_tipo_producto_seq"'::regclass);


--
-- Name: pedidos_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_log ALTER COLUMN id SET DEFAULT nextval('public.pedidos_log_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method, auth_code_issued_at) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address, otp_code, web_authn_session_data) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret, phone, last_challenged_at, web_authn_credential, web_authn_aaguid, last_webauthn_challenge_data) FROM stdin;
\.


--
-- Data for Name: oauth_authorizations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_authorizations (id, authorization_id, client_id, user_id, redirect_uri, scope, state, resource, code_challenge, code_challenge_method, response_type, status, authorization_code, created_at, expires_at, approved_at) FROM stdin;
\.


--
-- Data for Name: oauth_clients; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_clients (id, client_secret_hash, registration_type, redirect_uris, grant_types, client_name, client_uri, logo_uri, created_at, updated_at, deleted_at, client_type) FROM stdin;
\.


--
-- Data for Name: oauth_consents; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.oauth_consents (id, user_id, client_id, scopes, granted_at, revoked_at) FROM stdin;
\.


--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.one_time_tokens (id, user_id, token_type, token_hash, relates_to, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at, name_id_format) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, created_at, updated_at, flow_state_id) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
20230818113222
20230914180801
20231027141322
20231114161723
20231117164230
20240115144230
20240214120130
20240306115329
20240314092811
20240427152123
20240612123726
20240729123726
20240802193726
20240806073726
20241009103726
20250717082212
20250731150234
20250804100000
20250901200500
20250903112500
20250904133000
20250925093508
20251007112900
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after, refreshed_at, user_agent, ip, tag, oauth_client_id, refresh_token_hmac_key, refresh_token_counter) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at, disabled) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at, is_anonymous) FROM stdin;
\.


--
-- Data for Name: Clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Clientes" (id_cliente, nombre, direccion, telefono, email) FROM stdin;
1	Thorpe Fullwood	0201 Blue Bill Park Circle	+595 985 229953	tfullwood0@toplist.cz
2	Melony Turville	72135 Scofield Pass	+595 992 344814	mturville1@skyrock.com
3	Priscilla Peyro	4 Scott Alley	+595 992 353625	ppeyro2@cpanel.net
4	Tonya Howey	81322 Meadow Valley Street	+595 994 274070	thowey3@loc.gov
5	Gabi Johnsee	2594 Katie Place	+595 994 813234	gjohnsee4@zdnet.com
6	Sarah Bennitt	4 Chinook Park	+595 994 720639	sbennitt5@tinypic.com
7	Tybi Voisey	937 Comanche Drive	+595 994 199134	tvoisey6@geocities.com
8	Millisent Seedull	38 Declaration Alley	+595 981 685752	mseedull7@goodreads.com
9	Ulick Sagar	2631 Florence Center	+595 994 238400	usagar8@tumblr.com
10	Lulu Murdie	12827 Mariners Cove Plaza	+595 981 190436	lmurdie9@google.ru
11	Aguste O'Brollachain	92 Schurz Hill	+595 994 446348	aobrollachaina@addthis.com
12	Grannie Dixson	08 Bayside Street	+595 981 340942	gdixsonb@hatena.ne.jp
13	Felisha Ambage	2 Hanson Drive	+595 994 215496	fambagec@1688.com
14	Bernetta Davitt	6 Westridge Way	+595 992 877405	bdavittd@cargocollective.com
15	Sanford McLarnon	476 Randy Center	+595 994 246704	smclarnone@printfriendly.com
16	Valentino Simondson	8760 Nova Park	+595 994 963050	vsimondsonf@360.cn
17	Ossie Hannis	2031 Utah Hill	+595 985 709191	ohannisg@wufoo.com
18	Errick Cosins	46 Debs Hill	+595 981 497521	ecosinsh@amazon.co.uk
19	Inesita Bearham	280 Vera Circle	+595 985 245718	ibearhami@digg.com
20	Margaret Baumler	0556 Division Court	+595 985 812085	mbaumlerj@sogou.com
21	Laryssa Hicken	3178 Lillian Pass	+595 992 828291	lhickenk@geocities.jp
22	Kristos Dormon	2697 Kim Point	+595 992 352567	kdormonl@independent.co.uk
23	Brock Massot	652 Golf Course Trail	+595 994 101169	bmassotm@bloomberg.com
24	Korie Perris	451 Dennis Point	+595 992 181638	kperrisn@google.pl
25	Chick Heindl	3 Ridgeway Avenue	+595 992 105521	cheindlo@devhub.com
26	Jessey Riply	015 Cambridge Circle	+595 992 536780	jriplyp@scribd.com
27	Kassi Symons	0057 Marcy Court	+595 992 473027	ksymonsq@boston.com
28	Inge Southway	87541 Namekagon Point	+595 981 874059	isouthwayr@prnewswire.com
29	Nicolis Glede	83 Randy Road	+595 992 301425	ngledes@purevolume.com
30	Horatius Fealty	4210 Lindbergh Terrace	+595 994 891449	hfealtyt@xinhuanet.com
31	Morgan Gurg	2576 Spenser Hill	+595 985 267527	mgurgu@deliciousdays.com
32	Thayne Skippen	5133 Pepper Wood Parkway	+595 981 110179	tskippenv@discovery.com
33	Lilia Alentyev	8 Southridge Court	+595 981 295709	lalentyevw@multiply.com
34	Claus Eadon	6458 Hintze Avenue	+595 992 889555	ceadonx@sina.com.cn
35	Stephine Bartlosz	2658 Lyons Lane	+595 992 154471	sbartloszy@is.gd
36	Latrena Drummond	76 Mockingbird Circle	+595 985 950706	ldrummondz@elpais.com
37	Roberto Verbrugge	434 Kropf Trail	+595 981 524678	rverbrugge10@altervista.org
38	Arnoldo Lethibridge	207 Mallory Plaza	+595 994 993543	alethibridge11@wisc.edu
39	Kelby Lacey	72 Di Loreto Plaza	+595 994 473592	klacey12@skype.com
40	Falito Carlo	1 Golf Park	+595 992 531096	fcarlo13@psu.edu
41	Con Cansdale	4070 Doe Crossing Drive	+595 994 441680	ccansdale14@sogou.com
42	Tessa Oran	7464 Mcguire Road	+595 994 367088	toran15@wordpress.com
43	Kelcey Loche	923 Lake View Point	+595 992 354107	kloche16@hp.com
44	Dell Iannetti	4796 Elmside Avenue	+595 985 203713	diannetti17@blinklist.com
45	Guthry Whorf	7 Shopko Way	+595 985 102478	gwhorf18@adobe.com
46	Randy Derycot	355 Pearson Place	+595 985 814059	rderycot19@mlb.com
47	Mitchell Knagges	4 Cherokee Crossing	+595 981 295489	mknagges1a@fotki.com
48	Mehetabel Yakunkin	0 Blue Bill Park Center	+595 994 179863	myakunkin1b@imdb.com
49	Stephen Scandwright	6528 Glacier Hill Place	+595 981 812658	sscandwright1c@blog.com
50	Terri Poveleye	384 Schmedeman Pass	+595 994 528165	tpoveleye1d@earthlink.net
51	Waylen Duffree	73308 Barnett Way	+595 994 485413	wduffree1e@phpbb.com
52	Dynah Matschoss	16525 Eagle Crest Alley	+595 992 873959	dmatschoss1f@omniture.com
53	Crissie Dybell	9 Forster Lane	+595 985 636355	cdybell1g@163.com
54	Fannie Decort	02 Commercial Circle	+595 992 443683	fdecort1h@bing.com
55	Morey Dillingston	16327 Burrows Road	+595 994 446151	mdillingston1i@cnn.com
56	Glenn Yakuntzov	633 Melrose Parkway	+595 992 751953	gyakuntzov1j@squidoo.com
57	Avictor Terrill	3 Buena Vista Avenue	+595 981 785308	aterrill1k@tamu.edu
58	Willabella Flanigan	27 Thackeray Terrace	+595 985 630389	wflanigan1l@fema.gov
59	Gilbertina Railton	351 Manufacturers Junction	+595 985 664600	grailton1m@bravesites.com
60	Darcey Lanfear	7075 Eliot Drive	+595 994 875292	dlanfear1n@illinois.edu
61	Merissa Milsom	5 American Ash Place	+595 994 748757	mmilsom1o@apache.org
62	Gery Lening	12858 New Castle Junction	+595 981 279140	glening1p@com.com
63	Francoise Martill	8004 Linden Point	+595 981 891855	fmartill1q@tripod.com
64	Alexine Bacchus	64 Eggendart Park	+595 985 399757	abacchus1r@sun.com
65	Ernest Birkwood	2 Cambridge Center	+595 992 348799	ebirkwood1s@webmd.com
66	Charis O'Loghlen	7742 Lighthouse Bay Junction	+595 981 686416	cologhlen1t@fda.gov
67	Frederick Rodolfi	5604 Drewry Place	+595 992 284796	frodolfi1u@ezinearticles.com
68	Lauraine Siderfin	3 Mifflin Trail	+595 994 967309	lsiderfin1v@stanford.edu
69	Daphne Schinetti	1004 Superior Terrace	+595 985 837872	dschinetti1w@usa.gov
70	Felita Mayger	38945 Artisan Way	+595 992 851981	fmayger1x@census.gov
71	Katha Denisovich	5 Oak Valley Court	+595 994 481662	kdenisovich1y@tripod.com
72	Anica Hanscome	960 6th Avenue	+595 994 193033	ahanscome1z@deviantart.com
73	Kamila Woolham	68417 Grasskamp Way	+595 994 213888	kwoolham20@ebay.com
74	Taber McGinlay	359 Maryland Point	+595 985 982536	tmcginlay21@nifty.com
75	Hali Conant	65 Farragut Crossing	+595 994 509388	hconant22@sakura.ne.jp
76	Alameda Joincey	78496 Northwestern Street	+595 994 252552	ajoincey23@ihg.com
77	Tirrell Schwander	0 Linden Way	+595 981 719813	tschwander24@de.vu
78	Stephanie Dye	6520 Sunbrook Center	+595 992 741541	sdye25@gmpg.org
79	Cory Yakubovics	4470 Walton Road	+595 992 788676	cyakubovics26@ustream.tv
80	Henri Hyrons	0 Michigan Street	+595 992 889405	hhyrons27@instagram.com
81	Astrid Juleff	43 Summerview Junction	+595 981 660439	ajuleff28@eepurl.com
82	Skell Levesque	12982 Meadow Vale Trail	+595 992 177971	slevesque29@blogger.com
83	Chelsey Snowball	641 Lien Pass	+595 985 852932	csnowball2a@icio.us
84	Harmony Tincey	0596 Stuart Hill	+595 981 664154	htincey2b@example.com
85	Yorgo Charlet	8 Melby Avenue	+595 985 691491	ycharlet2c@springer.com
86	Lenard Marten	942 Lukken Crossing	+595 994 330345	lmarten2d@ucla.edu
87	Peirce Ansty	31353 Northview Center	+595 985 912705	pansty2e@shinystat.com
88	Brigid O'Finan	69 Fairfield Court	+595 981 688181	bofinan2f@alexa.com
89	Schuyler Ochiltree	96 Waywood Hill	+595 981 672271	sochiltree2g@mac.com
90	Jackquelin Phin	9 Meadow Ridge Road	+595 994 853218	jphin2h@spiegel.de
91	Jobie Pinwell	1713 Roxbury Terrace	+595 981 666183	jpinwell2i@bravesites.com
92	Sherlock Kitteringham	575 Truax Court	+595 994 319292	skitteringham2j@sogou.com
93	Berkie Enser	53 Melody Pass	+595 992 758492	benser2k@miitbeian.gov.cn
94	Jada Slimme	1 Stang Crossing	+595 992 236595	jslimme2l@amazon.co.jp
95	Waring Craggs	2065 Bunker Hill Park	+595 992 318089	wcraggs2m@microsoft.com
96	Elfie Borge	256 Thierer Avenue	+595 985 230357	eborge2n@51.la
97	Kimble Whyley	34601 Doe Crossing Alley	+595 994 103136	kwhyley2o@php.net
98	Lorrin Botte	138 Maple Wood Crossing	+595 992 141356	lbotte2p@about.com
99	Craggie McIlwain	5 Green Ridge Center	+595 992 782470	cmcilwain2q@jugem.jp
100	Elsinore Yearns	641 Johnson Drive	+595 994 309468	eyearns2r@princeton.edu
101	Ingeberg Burditt	55 Southridge Junction	+595 992 236385	iburditt2s@i2i.jp
102	Gale Dongate	66103 Melody Lane	+595 985 779049	gdongate2t@delicious.com
103	Clementina Spellman	657 Holy Cross Avenue	+595 994 518079	cspellman2u@netlog.com
104	Toni Maunders	068 Huxley Circle	+595 981 468929	tmaunders2v@tmall.com
105	Belicia Rosenauer	659 Mandrake Park	+595 992 218566	brosenauer2w@opensource.org
106	Cordula Kensley	36023 Armistice Court	+595 994 105684	ckensley2x@pbs.org
107	Thedrick Reddoch	357 Bayside Place	+595 994 421023	treddoch2y@weebly.com
108	Virgie Densham	2 Truax Crossing	+595 981 789342	vdensham2z@stumbleupon.com
109	Seka Kill	2970 Sheridan Trail	+595 985 974764	skill30@foxnews.com
110	Alano Winterscale	80 Eastwood Lane	+595 994 991173	awinterscale31@printfriendly.com
111	Leila Quenby	772 5th Lane	+595 992 460773	lquenby32@artisteer.com
112	Errol Velasquez	394 Farragut Point	+595 994 405679	evelasquez33@toplist.cz
113	Andreana Prendiville	97497 Tennessee Crossing	+595 985 468640	aprendiville34@exblog.jp
114	Jarrad Demange	4616 Maywood Drive	+595 985 778547	jdemange35@a8.net
115	Lucinda Yitzovicz	72757 Florence Circle	+595 992 487516	lyitzovicz36@bloglovin.com
116	Zilvia Leggon	65607 Raven Center	+595 985 432921	zleggon37@disqus.com
117	Claudian Northley	991 Jana Junction	+595 994 874013	cnorthley38@springer.com
118	Tucker Cuseick	7 Fuller Way	+595 981 642866	tcuseick39@discovery.com
119	Idaline Tunnicliffe	22 Columbus Court	+595 981 883645	itunnicliffe3a@home.pl
120	Reginauld Cecely	26295 Hazelcrest Way	+595 981 345409	rcecely3b@hhs.gov
121	Modestia Evanson	19266 Cordelia Place	+595 994 268280	mevanson3c@phoca.cz
122	Hermann Buddleigh	9 Arizona Park	+595 981 324212	hbuddleigh3d@soup.io
123	Gertie Issakov	3 Crownhardt Lane	+595 994 984424	gissakov3e@tinyurl.com
124	Babbette Bampfield	145 Lakewood Point	+595 994 704863	bbampfield3f@vkontakte.ru
125	Dina Trevithick	09 Hoepker Pass	+595 994 633324	dtrevithick3g@cpanel.net
126	Ives Morson	860 Darwin Point	+595 985 705965	imorson3h@meetup.com
127	Jess Ronald	30936 Eagan Terrace	+595 992 346857	jronald3i@ted.com
128	Kial Lipgens	8706 Fairview Center	+595 981 203624	klipgens3j@paypal.com
129	Cybill Skirven	26830 Arkansas Road	+595 994 441643	cskirven3k@uiuc.edu
130	Leland Riseley	300 Veith Crossing	+595 981 424248	lriseley3l@barnesandnoble.com
131	Merle Magrannell	619 Vera Way	+595 994 468355	mmagrannell3m@tumblr.com
132	Lissy Brigman	716 Starling Drive	+595 981 598676	lbrigman3n@patch.com
133	Elmo Pybus	3 Spaight Court	+595 994 185407	epybus3o@unicef.org
134	Reade Dudek	6 Esch Parkway	+595 985 693464	rdudek3p@weebly.com
135	Kristal Queree	619 Lakewood Gardens Junction	+595 992 132789	kqueree3q@yelp.com
136	Nadya Batrip	26 Reinke Way	+595 992 800126	nbatrip3r@yahoo.com
137	Rudiger Terrazzo	18 Everett Terrace	+595 981 831638	rterrazzo3s@dyndns.org
138	Sherrie MacGahey	622 Dapin Court	+595 994 116549	smacgahey3t@rediff.com
139	Chick Humphrey	11724 South Street	+595 994 495399	chumphrey3u@vk.com
140	Joela Beecham	6415 Marcy Trail	+595 992 897842	jbeecham3v@devhub.com
141	Elene Adamski	33 Meadow Valley Place	+595 981 350888	eadamski3w@youku.com
142	Lucien Kleinstern	80 Kropf Street	+595 985 359135	lkleinstern3x@scribd.com
143	Zilvia Selley	6 Summerview Junction	+595 992 772449	zselley3y@alibaba.com
144	Fielding Surgeoner	311 Arrowood Terrace	+595 992 897136	fsurgeoner3z@wunderground.com
145	Neda Hearsum	53665 3rd Pass	+595 992 674364	nhearsum40@qq.com
146	Auberon Honsch	369 Old Gate Street	+595 992 473574	ahonsch41@free.fr
147	Marissa Doll	3007 Hintze Crossing	+595 981 182196	mdoll42@ask.com
148	Dayle Cleiment	30 Russell Junction	+595 985 978017	dcleiment43@bloglines.com
149	Frankie McGilbon	8315 Algoma Road	+595 985 279970	fmcgilbon44@state.gov
150	Templeton Maddie	22 Packers Plaza	+595 992 176018	tmaddie45@51.la
151	Jana Thowless	46584 Bluestem Road	+595 985 180665	jthowless46@amazon.de
152	Andeee Scotchbourouge	38260 Barnett Hill	+595 994 290939	ascotchbourouge47@unesco.org
153	Ursulina Duckett	84 Erie Place	+595 981 144687	uduckett48@goodreads.com
154	Ilyssa Gosnold	612 Lakewood Lane	+595 985 581457	igosnold49@godaddy.com
155	Beth Tardiff	107 Lukken Avenue	+595 981 787464	btardiff4a@biglobe.ne.jp
156	Brita Duffan	0676 Longview Circle	+595 992 360247	bduffan4b@lycos.com
157	Bethina Wigglesworth	753 Old Shore Trail	+595 985 715993	bwigglesworth4c@skype.com
158	Lari Klaas	0 Cascade Plaza	+595 981 958895	lklaas4d@gizmodo.com
159	Boris Seak	8 Norway Maple Court	+595 981 462244	bseak4e@bbc.co.uk
160	Barbara-anne Branch	07 Menomonie Place	+595 981 137633	bbranch4f@360.cn
161	Norbie Barlace	54 Petterle Circle	+595 994 948308	nbarlace4g@sfgate.com
162	Morgan Unsworth	89444 Moose Court	+595 981 430745	munsworth4h@macromedia.com
163	Iris Fildery	689 Kings Hill	+595 985 626399	ifildery4i@elpais.com
164	Consuela Hambribe	653 Anniversary Place	+595 992 962825	chambribe4j@ustream.tv
165	Alix Grellier	55793 Lake View Plaza	+595 992 610479	agrellier4k@lycos.com
166	Jamima Laxton	7 Derek Parkway	+595 992 700202	jlaxton4l@accuweather.com
167	Amity Greser	8 Blackbird Parkway	+595 981 954763	agreser4m@virginia.edu
168	Reiko Crowcher	15790 Menomonie Parkway	+595 992 418573	rcrowcher4n@naver.com
169	Glendon Dalgetty	4498 Cody Plaza	+595 981 384907	gdalgetty4o@tamu.edu
170	Blake Balfe	959 Mariners Cove Place	+595 992 439401	bbalfe4p@microsoft.com
171	Jeanine Aspinal	261 Monument Plaza	+595 981 157956	jaspinal4q@scribd.com
172	Filippa Blevin	43 Sullivan Center	+595 992 629170	fblevin4r@businesswire.com
173	Natalee Caghy	0 Hovde Drive	+595 985 700334	ncaghy4s@photobucket.com
174	Averell Mapowder	6155 Fieldstone Street	+595 981 924542	amapowder4t@macromedia.com
175	Kori Emanulsson	17 Steensland Center	+595 994 893786	kemanulsson4u@addtoany.com
176	Hall Tompkins	3816 Haas Circle	+595 985 109134	htompkins4v@vistaprint.com
177	Hillary Alvar	7165 Scoville Lane	+595 981 293723	halvar4w@smh.com.au
178	Doralin Fawdry	2554 Iowa Alley	+595 985 508526	dfawdry4x@1688.com
179	Westleigh Houndesome	8 Randy Center	+595 981 166974	whoundesome4y@prweb.com
180	Brooks Reddyhoff	5370 Gerald Park	+595 981 316907	breddyhoff4z@cnet.com
181	Dallis Olyfat	77 Russell Lane	+595 981 724629	dolyfat50@ocn.ne.jp
182	Teodoor Theaker	5 Calypso Hill	+595 981 600232	ttheaker51@google.co.uk
183	Nessy Tettley	5 Dawn Street	+595 994 926532	ntettley52@weebly.com
184	Carmelle Elrick	42080 Northwestern Street	+595 994 414927	celrick53@gov.uk
185	Derk Bonsall	1157 Little Fleur Center	+595 994 686228	dbonsall54@newsvine.com
186	Sibella Joslow	576 Kipling Terrace	+595 992 817097	sjoslow55@51.la
187	Tann Swires	41 Prentice Road	+595 994 555260	tswires56@hugedomains.com
188	Lukas Lukasen	7 Schmedeman Point	+595 985 170769	llukasen57@chron.com
189	Patty Godwyn	843 Dawn Circle	+595 992 224933	pgodwyn58@desdev.cn
190	Dyanne Thirtle	7 Lotheville Park	+595 985 533926	dthirtle59@examiner.com
191	Jacquelynn Lashmar	42 Southridge Parkway	+595 992 901067	jlashmar5a@dailymail.co.uk
192	Ced Marconi	6728 Sloan Circle	+595 985 717536	cmarconi5b@adobe.com
193	Tracey Rittelmeyer	6 Parkside Junction	+595 981 127586	trittelmeyer5c@ebay.com
194	Gannie Spier	73 Morningstar Hill	+595 992 213262	gspier5d@indiegogo.com
195	Karoly Trimming	23802 Sullivan Point	+595 994 704727	ktrimming5e@vinaora.com
196	Annemarie Corlett	0 Badeau Pass	+595 981 858849	acorlett5f@constantcontact.com
197	Rupert Milazzo	84538 Maple Park	+595 981 442368	rmilazzo5g@nps.gov
198	Giacobo Hestrop	0587 Lakewood Trail	+595 985 722639	ghestrop5h@de.vu
199	Carlo Dominec	705 4th Street	+595 985 498677	cdominec5i@amazon.co.uk
200	Ennis Bramhill	785 Lerdahl Terrace	+595 994 581494	ebramhill5j@berkeley.edu
201	Gilberta Von Salzberg	3 Calypso Road	+595 985 215017	gvon5k@hatena.ne.jp
202	Tomi Bratton	5990 Helena Center	+595 994 127839	tbratton5l@sbwire.com
203	Vania Costy	681 Buena Vista Road	+595 994 757037	vcosty5m@yahoo.com
204	Saxon Penlington	010 Clove Plaza	+595 985 107299	spenlington5n@123-reg.co.uk
205	Hans Cunnington	3517 Drewry Center	+595 992 734134	hcunnington5o@princeton.edu
206	Jeddy Catling	6 Vahlen Parkway	+595 994 415488	jcatling5p@sciencedirect.com
207	Cicily Bibey	78 Schmedeman Point	+595 985 527122	cbibey5q@elegantthemes.com
208	Delmore Pietsma	32 Vahlen Crossing	+595 985 271121	dpietsma5r@is.gd
209	Carolynn Crighton	45016 Coleman Crossing	+595 985 787836	ccrighton5s@epa.gov
210	Arman Boken	75315 Shopko Trail	+595 992 190634	aboken5t@amazon.com
211	Mendy Todarello	459 Melvin Plaza	+595 992 123095	mtodarello5u@wikipedia.org
212	Monro Milksop	6 Golf View Place	+595 994 256370	mmilksop5v@diigo.com
213	Honoria Thurston	778 Dixon Junction	+595 985 964627	hthurston5w@abc.net.au
214	Scot Hurne	0796 Sloan Alley	+595 992 910314	shurne5x@alibaba.com
215	Beitris Malitrott	4220 8th Lane	+595 994 787163	bmalitrott5y@wisc.edu
216	Alameda Louche	132 Butterfield Way	+595 985 509028	alouche5z@simplemachines.org
217	Durante Klaes	420 Michigan Pass	+595 992 987778	dklaes60@weibo.com
218	Linnell Cancutt	80 Sauthoff Hill	+595 985 316776	lcancutt61@opensource.org
219	Huey Lansberry	60198 Golf Course Drive	+595 981 982789	hlansberry62@shop-pro.jp
220	Neddie Kiraly	85 Hanson Crossing	+595 992 551559	nkiraly63@elegantthemes.com
221	Evin Bond	07 Duke Center	+595 992 314366	ebond64@cdc.gov
222	Kyle Islep	0951 Westerfield Park	+595 992 499856	kislep65@squidoo.com
223	Loren Philbrick	4348 Cody Road	+595 985 568183	lphilbrick66@globo.com
224	Lari Ellams	31 1st Plaza	+595 994 111827	lellams67@buzzfeed.com
225	Erie Darwood	8 Marquette Place	+595 985 418110	edarwood68@statcounter.com
226	Fannie Lackeye	7 Northwestern Circle	+595 992 558759	flackeye69@geocities.com
227	Vivian Clow	5955 Karstens Hill	+595 981 396333	vclow6a@mozilla.org
228	Luciana Shrubsall	1 Laurel Drive	+595 985 418282	lshrubsall6b@imdb.com
229	Teador Heape	56496 Summit Alley	+595 981 996499	theape6c@zdnet.com
230	Tomi Eccleshall	9744 Columbus Plaza	+595 981 308956	teccleshall6d@flickr.com
231	Wren Lissandre	216 Cambridge Junction	+595 985 353456	wlissandre6e@paginegialle.it
232	Aubrette Selway	08 Chinook Hill	+595 981 681339	aselway6f@alexa.com
233	Emmet McCotter	7 Buell Drive	+595 985 271322	emccotter6g@hexun.com
234	Tim Barwise	652 Sherman Road	+595 992 669823	tbarwise6h@google.ca
235	Katharina Ransome	7 Granby Terrace	+595 992 429259	kransome6i@reddit.com
236	Jess Alpine	044 Daystar Way	+595 992 380321	jalpine6j@jigsy.com
237	Brocky Dockerty	9 Summerview Junction	+595 994 700334	bdockerty6k@hatena.ne.jp
238	Dillon Noweak	52 Dixon Lane	+595 985 775962	dnoweak6l@microsoft.com
239	Lorne Keddey	23985 Brickson Park Pass	+595 981 770515	lkeddey6m@un.org
240	Katusha Rooney	4 Pepper Wood Street	+595 994 461496	krooney6n@tuttocitta.it
241	Gabriella Pedel	11935 Northview Pass	+595 992 808567	gpedel6o@squarespace.com
242	Edmon Alberts	6926 Lunder Crossing	+595 992 526987	ealberts6p@addtoany.com
243	Max Treweela	4 Huxley Parkway	+595 981 299829	mtreweela6q@youtube.com
244	Jennica Waye	23523 Hintze Way	+595 992 487441	jwaye6r@discuz.net
245	Chrysler Blythe	0 Longview Plaza	+595 994 744714	cblythe6s@mtv.com
246	Maggie Norheny	09132 Calypso Circle	+595 994 738700	mnorheny6t@altervista.org
247	Pattie Kinnon	68 Mcbride Junction	+595 981 597401	pkinnon6u@umich.edu
248	Kristal Siggs	23 Vera Pass	+595 985 218913	ksiggs6v@constantcontact.com
249	Brenden Millwall	03 Mockingbird Avenue	+595 985 523540	bmillwall6w@google.com.br
250	Sampson Stearnes	0 American Ash Park	+595 994 188699	sstearnes6x@samsung.com
251	Noble Royds	72 Dexter Terrace	+595 985 506663	nroyds6y@google.pl
252	Sherm Physic	818 Arkansas Trail	+595 985 950110	sphysic6z@ifeng.com
253	Tiffi Joliffe	5653 Aberg Plaza	+595 985 728097	tjoliffe70@skyrock.com
254	Tabitha Blaxall	85 8th Place	+595 985 999815	tblaxall71@skype.com
255	Yovonnda Quinby	5751 Dottie Center	+595 981 263088	yquinby72@github.com
256	Stefania Habbal	4926 Buell Drive	+595 985 155151	shabbal73@google.com.br
257	Wain Mincher	9879 Esker Way	+595 992 128220	wmincher74@ustream.tv
258	Si Doel	9 Village Green Terrace	+595 985 659505	sdoel75@fc2.com
259	Gerrard Keppy	7824 Fulton Hill	+595 994 363598	gkeppy76@uiuc.edu
260	Bobbee McGonnell	464 2nd Road	+595 985 949639	bmcgonnell77@ibm.com
261	Hercules Hutchins	0655 Ryan Circle	+595 981 538964	hhutchins78@yahoo.co.jp
262	Wood Harwick	09444 Raven Terrace	+595 985 842524	wharwick79@google.ru
263	Meghann Lippi	50 Clove Avenue	+595 992 335679	mlippi7a@google.fr
264	Darby Burgyn	1694 Cordelia Crossing	+595 992 143561	dburgyn7b@google.co.uk
265	Carlie Searle	6 Anniversary Center	+595 981 824203	csearle7c@bizjournals.com
266	Averell Daniell	33010 Hanover Drive	+595 981 327138	adaniell7d@businessweek.com
267	Veradis Toynbee	3 Roxbury Point	+595 981 275941	vtoynbee7e@blogtalkradio.com
268	Brier Sheeres	4183 Moose Lane	+595 992 629531	bsheeres7f@craigslist.org
269	Leicester Handrik	90487 Fair Oaks Center	+595 981 291562	lhandrik7g@globo.com
270	Felecia Dabrowski	134 Florence Trail	+595 994 233116	fdabrowski7h@usa.gov
271	Craig Merrien	816 Moland Pass	+595 985 487479	cmerrien7i@cdc.gov
272	Darby Pither	823 Sloan Center	+595 992 677796	dpither7j@mit.edu
273	Theresa Peiro	4606 Bunker Hill Way	+595 981 538337	tpeiro7k@eventbrite.com
274	Corie Olenikov	388 Cardinal Junction	+595 985 952145	colenikov7l@state.tx.us
275	Correy de Quesne	4 Fremont Park	+595 985 180006	cde7m@networksolutions.com
276	Timmie McLagain	6 Anniversary Hill	+595 994 206172	tmclagain7n@microsoft.com
277	Mimi Aubert	845 Lakewood Gardens Lane	+595 992 302510	maubert7o@sciencedaily.com
278	Elvin Agnolo	05128 Mallory Drive	+595 992 196467	eagnolo7p@google.ru
279	Hermina Phalp	0358 Alpine Drive	+595 981 678749	hphalp7q@issuu.com
280	Aristotle Peppett	8 Main Alley	+595 985 623289	apeppett7r@vkontakte.ru
281	Marthena Daintier	07 7th Pass	+595 981 241691	mdaintier7s@dion.ne.jp
282	Giraud Marchant	8276 Straubel Way	+595 985 429198	gmarchant7t@mtv.com
283	Nikolaos Lyddon	6370 Sunbrook Crossing	+595 992 211287	nlyddon7u@zdnet.com
284	Lauren Tanswell	06 Sutteridge Court	+595 985 570702	ltanswell7v@usnews.com
285	Smith Demangeot	7472 Bartelt Junction	+595 981 475233	sdemangeot7w@bandcamp.com
286	Ermin Martinot	69 Hooker Trail	+595 985 730965	emartinot7x@salon.com
287	Margo Oxe	1455 Longview Drive	+595 981 384086	moxe7y@jiathis.com
288	Jephthah Kermit	13120 Westerfield Trail	+595 994 725821	jkermit7z@wisc.edu
289	Kimberlee Ellington	77238 Dahle Court	+595 981 692843	kellington80@istockphoto.com
290	Alvin Friett	2 Merchant Point	+595 985 915533	afriett81@sitemeter.com
291	Katee Bulteel	4 Monument Pass	+595 992 626589	kbulteel82@ehow.com
292	Ive Laffan	1 Cardinal Center	+595 994 291402	ilaffan83@wp.com
293	Perle Robecon	22992 Westend Alley	+595 992 700680	probecon84@sina.com.cn
294	Willette Stow	26 Waubesa Park	+595 992 735612	wstow85@unesco.org
295	Normie Lamy	2769 Oriole Crossing	+595 992 187648	nlamy86@tinypic.com
296	Cirstoforo Dagleas	87 Coleman Street	+595 985 975713	cdagleas87@twitpic.com
297	Brigitta Verlinden	3 Bartillon Plaza	+595 994 943169	bverlinden88@fastcompany.com
298	Alphonse Tandy	7 Nancy Junction	+595 992 544902	atandy89@dot.gov
299	Jody Corona	59 Fieldstone Pass	+595 994 935883	jcorona8a@techcrunch.com
300	Gerek Hoyle	4 Petterle Trail	+595 981 486685	ghoyle8b@fc2.com
301	Frannie Elener	4 Maple Wood Junction	+595 994 317370	felener8c@dedecms.com
302	Neils Morando	261 Hoepker Pass	+595 992 580127	nmorando8d@lulu.com
303	Zora Sute	76 West Pass	+595 994 950724	zsute8e@symantec.com
304	Reba Torre	21 Independence Way	+595 992 750146	rtorre8f@japanpost.jp
305	Cindie Prendiville	6 Macpherson Park	+595 994 262031	cprendiville8g@list-manage.com
306	Edward Duplain	193 Menomonie Drive	+595 981 905744	eduplain8h@seesaa.net
307	Reggy Southwell	413 Crowley Center	+595 992 587456	rsouthwell8i@nifty.com
308	Bari Descroix	2404 Messerschmidt Lane	+595 985 432935	bdescroix8j@rambler.ru
309	Madelin Fitzsymon	73991 Menomonie Pass	+595 992 944883	mfitzsymon8k@github.com
310	Cathlene Durran	0886 Comanche Lane	+595 981 311736	cdurran8l@1und1.de
311	Ingar Robard	763 Donald Hill	+595 981 508179	irobard8m@symantec.com
312	Vernen Allflatt	243 Lyons Alley	+595 992 989086	vallflatt8n@adobe.com
313	Grover Sagg	518 Lake View Park	+595 985 962800	gsagg8o@earthlink.net
314	Emmie Badam	5 Lighthouse Bay Drive	+595 994 223465	ebadam8p@seesaa.net
315	Asa Newnham	5135 Moulton Street	+595 992 455513	anewnham8q@nydailynews.com
316	Meggy Sephton	1 Schiller Place	+595 994 774928	msephton8r@senate.gov
317	Aharon Ham	7805 Barby Trail	+595 981 608813	aham8s@dedecms.com
318	Brinn Jose	48 4th Alley	+595 981 696411	bjose8t@is.gd
319	Conny Demko	54 Forster Avenue	+595 992 522038	cdemko8u@studiopress.com
320	Fionna Reggler	0129 Jay Way	+595 992 248042	freggler8v@epa.gov
321	Nariko Churms	9 Forest Run Pass	+595 994 830240	nchurms8w@flavors.me
322	Aubree Gobel	99 Fordem Center	+595 994 432563	agobel8x@seattletimes.com
323	Osmond Prophet	914 Erie Point	+595 981 428550	oprophet8y@google.com
324	Pia Galer	1290 Center Terrace	+595 981 325156	pgaler8z@mysql.com
325	Christoper Inkster	4 Parkside Center	+595 992 651526	cinkster90@slideshare.net
326	Micheal Minear	84557 Holmberg Parkway	+595 985 971690	mminear91@skype.com
327	Maurice Coke	26 Fordem Crossing	+595 985 710180	mcoke92@cnn.com
328	Noe Chainey	5 Bultman Road	+595 994 637242	nchainey93@pinterest.com
329	Anjela Szanto	38492 Washington Plaza	+595 992 598771	aszanto94@nature.com
330	Ashia Eales	276 Eliot Terrace	+595 994 432780	aeales95@ebay.com
331	Madlin Bysshe	1684 Colorado Pass	+595 985 540765	mbysshe96@wordpress.org
332	Baxie Zollner	0 Mosinee Place	+595 994 568389	bzollner97@yellowbook.com
333	Mariette Cartan	15 Walton Alley	+595 985 593043	mcartan98@cyberchimps.com
334	Dimitry Winward	23 Talmadge Parkway	+595 994 785181	dwinward99@mapy.cz
335	Margit Oxe	8375 Stone Corner Pass	+595 994 617183	moxe9a@photobucket.com
336	Ewan Isakson	90 Iowa Place	+595 994 818662	eisakson9b@bloglovin.com
337	Jany Fancott	5 Carpenter Drive	+595 994 741380	jfancott9c@miibeian.gov.cn
338	Cyrille Graybeal	3 Vermont Junction	+595 981 304340	cgraybeal9d@photobucket.com
339	Rodrick Teaser	1 Westport Lane	+595 981 356762	rteaser9e@histats.com
340	Amandy Kepe	8 Lien Terrace	+595 994 720577	akepe9f@google.cn
341	Jeff Collop	43 Veith Alley	+595 994 232965	jcollop9g@wp.com
342	Mattie Stych	72350 Michigan Place	+595 985 151558	mstych9h@uiuc.edu
343	Marie-ann Cotesford	2 Menomonie Drive	+595 994 860047	mcotesford9i@cam.ac.uk
344	Francisca Fletcher	2 Goodland Circle	+595 994 871220	ffletcher9j@devhub.com
345	Alwin Clynter	646 Manley Circle	+595 985 498784	aclynter9k@cam.ac.uk
346	Aldridge Tace	620 Delladonna Center	+595 981 927215	atace9l@bloglovin.com
347	Faustina Snoddy	34 Emmet Park	+595 994 823565	fsnoddy9m@admin.ch
348	Lorin Dowyer	4 Goodland Terrace	+595 985 121045	ldowyer9n@deviantart.com
349	Aurelea Edrich	202 Shopko Plaza	+595 992 792188	aedrich9o@symantec.com
350	Dominica Trevaskus	9 Elmside Alley	+595 981 262347	dtrevaskus9p@arstechnica.com
351	Querida Riley	92 New Castle Place	+595 994 409934	qriley9q@uiuc.edu
352	Solly Coldham	850 Ridge Oak Terrace	+595 992 435485	scoldham9r@slideshare.net
353	Bobby de Courcy	04513 Fulton Point	+595 994 555202	bde9s@soundcloud.com
354	Belicia Silverthorn	27 Holy Cross Road	+595 992 707750	bsilverthorn9t@amazon.de
355	Frieda Jedrych	3620 Browning Way	+595 992 943353	fjedrych9u@fotki.com
356	Jolie Sever	49 Susan Drive	+595 992 868933	jsever9v@auda.org.au
357	Hanni Farnon	5602 Schurz Circle	+595 981 152853	hfarnon9w@sciencedirect.com
358	Aida Sullens	959 Golf Circle	+595 992 553305	asullens9x@nymag.com
359	Bruis Brooksbank	5862 Arizona Court	+595 981 332079	bbrooksbank9y@cloudflare.com
360	Jess Gellibrand	5 Randy Trail	+595 994 498945	jgellibrand9z@unblog.fr
361	Rasla Manneville	0739 Northridge Pass	+595 985 822553	rmannevillea0@paypal.com
362	Rianon Parlatt	08 Grasskamp Road	+595 981 608963	rparlatta1@slideshare.net
363	Licha Armatidge	289 North Circle	+595 992 965603	larmatidgea2@angelfire.com
364	Amandi Luetchford	065 Armistice Parkway	+595 994 734197	aluetchforda3@gov.uk
365	Thatch Brookes	4342 Russell Way	+595 985 384345	tbrookesa4@oracle.com
366	Francene Follows	86 Randy Crossing	+595 985 361439	ffollowsa5@g.co
367	Lynda Brick	904 Buena Vista Drive	+595 981 336965	lbricka6@elegantthemes.com
368	Paquito McLaughlan	636 Pennsylvania Circle	+595 981 262439	pmclaughlana7@fema.gov
369	Pegeen Duquesnay	56042 Dwight Point	+595 994 803009	pduquesnaya8@nydailynews.com
370	Leoline Coysh	8 Warbler Street	+595 981 661811	lcoysha9@mail.ru
371	Cathe Tough	912 Rieder Parkway	+595 981 175118	ctoughaa@seesaa.net
372	Christie Blagden	04 New Castle Trail	+595 992 100947	cblagdenab@stanford.edu
373	Gothart Wolford	67234 Cody Pass	+595 992 595888	gwolfordac@weebly.com
374	Charisse Ventham	1 Talmadge Trail	+595 992 560232	cventhamad@soundcloud.com
375	Shaughn Nolli	3929 Farwell Center	+595 992 891704	snolliae@yelp.com
376	Griswold Jacklin	300 Burrows Pass	+595 981 306681	gjacklinaf@uol.com.br
377	Cherish Tock	9 Mallory Drive	+595 992 541988	ctockag@princeton.edu
378	Morton Crewdson	04 Becker Road	+595 985 846750	mcrewdsonah@hubpages.com
379	Victoir Penella	959 Di Loreto Terrace	+595 981 235101	vpenellaai@wix.com
380	Gena Dawidman	7 Haas Junction	+595 985 745076	gdawidmanaj@wunderground.com
381	Terencio Aupol	6 Bobwhite Avenue	+595 981 678110	taupolak@japanpost.jp
382	Cornie Royal	2299 Moland Street	+595 994 123648	croyalal@eepurl.com
383	Hi Pellatt	0 Spohn Junction	+595 981 813957	hpellattam@gizmodo.com
384	Diahann Kett	864 Ridgeway Center	+595 985 446948	dkettan@example.com
385	Kimbra Print	96823 Holmberg Way	+595 981 953134	kprintao@ning.com
386	Tudor Embleton	80 Corben Point	+595 981 811200	tembletonap@sun.com
387	Eryn Zute	345 Westend Circle	+595 985 892429	ezuteaq@wikia.com
388	Adolphe Lillo	5 Division Lane	+595 992 802959	alilloar@odnoklassniki.ru
389	Carri Haddeston	62226 Dryden Avenue	+595 994 292936	chaddestonas@artisteer.com
390	Chaddy Degoy	51 Spohn Pass	+595 985 274315	cdegoyat@usatoday.com
391	Chandra Kmicicki	1 Manley Center	+595 985 150200	ckmicickiau@time.com
392	Forbes Gentery	94012 Northridge Park	+595 985 891739	fgenteryav@list-manage.com
393	Cleo Rettie	0294 Morrow Plaza	+595 992 381938	crettieaw@facebook.com
394	Aile Joskovitch	093 North Junction	+595 985 350220	ajoskovitchax@a8.net
395	Miriam Littley	8935 Farmco Pass	+595 992 778571	mlittleyay@artisteer.com
396	Micky Sperring	00753 Maywood Trail	+595 992 852864	msperringaz@howstuffworks.com
397	Rayner Vinter	887 Esker Terrace	+595 981 177788	rvinterb0@japanpost.jp
398	Kareem Yarranton	81282 Veith Way	+595 985 256400	kyarrantonb1@mapquest.com
399	Ailina Margerison	74752 Norway Maple Junction	+595 981 867644	amargerisonb2@independent.co.uk
400	Murdoch Chatt	4791 Grasskamp Lane	+595 992 581065	mchattb3@buzzfeed.com
401	Elsa Seaking	5991 Bonner Junction	+595 981 411650	eseakingb4@slideshare.net
402	Alison MacGiolla Pheadair	2 Sutteridge Trail	+595 981 599248	amacgiollab5@xing.com
403	Donavon Lyle	9 Cascade Center	+595 994 958027	dlyleb6@stumbleupon.com
404	Gunner St. Hill	57669 Merchant Center	+595 992 914823	gstb7@examiner.com
405	Obadiah Feld	7 Scott Circle	+595 992 183617	ofeldb8@ezinearticles.com
406	Papageno Jouanet	5 Chinook Junction	+595 992 692631	pjouanetb9@cdc.gov
407	Augie Flori	0228 Kensington Lane	+595 994 402029	afloriba@flickr.com
408	Brittney Boone	291 Rutledge Center	+595 985 807581	bboonebb@chron.com
409	Nappie Hunston	7 Heffernan Terrace	+595 992 326164	nhunstonbc@nhs.uk
410	Eolanda Goodayle	16 Sachs Center	+595 994 334674	egoodaylebd@arstechnica.com
411	Ricki Tregenna	15224 Clemons Parkway	+595 992 565911	rtregennabe@google.cn
412	Patrice Millsom	2 Redwing Street	+595 985 194362	pmillsombf@opensource.org
413	Marlene Feore	49350 Utah Road	+595 981 922248	mfeorebg@cam.ac.uk
414	Joachim Tremoille	3 Arrowood Junction	+595 981 154108	jtremoillebh@mit.edu
415	Euell Di Maggio	7085 Birchwood Crossing	+595 985 629453	edibi@last.fm
416	Jeri Titmarsh	22480 Truax Crossing	+595 992 245522	jtitmarshbj@utexas.edu
417	Audrye Orris	6550 Fairfield Plaza	+595 994 365615	aorrisbk@nbcnews.com
418	Carolynn Dewerson	9806 Fuller Lane	+595 994 499835	cdewersonbl@meetup.com
419	Rebekah Pasby	6432 Thackeray Crossing	+595 994 451976	rpasbybm@tripadvisor.com
420	Thatch Rylands	8482 Lunder Junction	+595 981 187927	trylandsbn@usda.gov
421	Sonnie Northridge	09290 Hansons Alley	+595 994 901617	snorthridgebo@vimeo.com
422	Felix Willgoss	727 Surrey Drive	+595 992 608153	fwillgossbp@de.vu
423	Marlie Wort	232 Paget Drive	+595 985 613774	mwortbq@si.edu
424	Graeme MacCaig	92202 Village Green Street	+595 985 754485	gmaccaigbr@xrea.com
425	Alberik Giacomi	708 Luster Lane	+595 985 707117	agiacomibs@wp.com
426	Caresa Haswall	658 Harbort Plaza	+595 981 510959	chaswallbt@dropbox.com
427	Jorgan Sirrell	6 Barby Junction	+595 985 810704	jsirrellbu@soup.io
428	Lazarus Leagas	754 Loftsgordon Circle	+595 994 843260	lleagasbv@yellowpages.com
429	Gillian Littledyke	70 Michigan Parkway	+595 981 862053	glittledykebw@mozilla.org
430	Stern Edgington	5821 Main Avenue	+595 992 432401	sedgingtonbx@hp.com
431	Deonne Biernacki	87016 Sunbrook Circle	+595 981 341042	dbiernackiby@infoseek.co.jp
432	Carlye Narracott	81 Trailsway Court	+595 985 754042	cnarracottbz@indiatimes.com
433	Florenza Fricker	21926 Fremont Alley	+595 994 505075	ffrickerc0@fc2.com
434	Dorella Le Surf	86844 Bowman Point	+595 992 646353	dlec1@homestead.com
435	Kassandra Rolfo	13 Portage Way	+595 994 234478	krolfoc2@washington.edu
436	Pavla Fibbings	0726 Shoshone Trail	+595 992 619079	pfibbingsc3@nydailynews.com
437	Mirabel Pigny	0 Rutledge Center	+595 992 995927	mpignyc4@wikispaces.com
438	Esra Nelthrop	33498 Stephen Avenue	+595 994 493496	enelthropc5@jalbum.net
439	Duffy Sartain	723 Buell Hill	+595 985 866962	dsartainc6@xrea.com
440	Honoria Izkovitz	53841 Bonner Circle	+595 992 239513	hizkovitzc7@sciencedirect.com
441	Joana Vynall	6 Bellgrove Plaza	+595 981 198760	jvynallc8@artisteer.com
442	Joeann Dillicate	578 Valley Edge Circle	+595 994 184669	jdillicatec9@altervista.org
443	Jaquith Ruslin	70514 Schlimgen Street	+595 992 140216	jruslinca@rediff.com
444	Giulietta McAirt	13 Rockefeller Crossing	+595 994 167934	gmcairtcb@google.pl
445	Ennis Cino	9 Manitowish Alley	+595 992 132381	ecinocc@ovh.net
446	Stephenie Seleway	9458 Upham Street	+595 985 263345	sselewaycd@seesaa.net
447	Cristin Mawhinney	96657 Iowa Lane	+595 981 517254	cmawhinneyce@deliciousdays.com
448	Mechelle Togwell	50836 Warner Junction	+595 992 325892	mtogwellcf@joomla.org
449	Sean Caines	50533 Fisk Terrace	+595 992 222972	scainescg@themeforest.net
450	Ethelred Aspden	69 Gina Avenue	+595 992 193065	easpdench@webnode.com
451	Mike Khadir	68098 Myrtle Place	+595 994 222583	mkhadirci@army.mil
452	Carin Walshe	78398 Express Road	+595 992 634812	cwalshecj@cisco.com
453	Channa Hallen	83 Birchwood Drive	+595 992 605449	challenck@free.fr
454	Malynda Innett	1 Pond Plaza	+595 992 686379	minnettcl@barnesandnoble.com
455	Nichol Rudsdell	0375 Russell Center	+595 985 910197	nrudsdellcm@un.org
456	Gun Gunter	36 Donald Center	+595 985 362216	gguntercn@prweb.com
457	Tedi De Mars	9553 Sundown Street	+595 981 564892	tdeco@blogtalkradio.com
458	Kenneth Beinke	132 Dawn Alley	+595 985 189272	kbeinkecp@macromedia.com
459	Vanessa Maddison	5489 Welch Court	+595 992 940984	vmaddisoncq@ning.com
460	Celinda McCuthais	3 Browning Drive	+595 985 417593	cmccuthaiscr@shutterfly.com
461	Donalt Noblett	3750 Hollow Ridge Center	+595 985 727762	dnoblettcs@facebook.com
462	Patric Petkens	15769 Redwing Alley	+595 992 779713	ppetkensct@blogspot.com
463	Melina Dreakin	98 Eagle Crest Alley	+595 992 595456	mdreakincu@amazon.co.jp
464	Caryl Piburn	15585 Truax Circle	+595 992 506401	cpiburncv@webs.com
465	Ashla Janata	738 Russell Crossing	+595 981 946016	ajanatacw@homestead.com
466	Leonhard Elderfield	48334 Ronald Regan Plaza	+595 992 538801	lelderfieldcx@mit.edu
467	Merell Slidders	9 Lyons Hill	+595 994 329411	mslidderscy@goo.gl
468	Knox Damper	60205 Atwood Parkway	+595 985 363731	kdampercz@census.gov
469	Perri Molyneaux	95 Kensington Point	+595 985 580716	pmolyneauxd0@java.com
470	Stanton Brocks	18 Village Plaza	+595 985 235720	sbrocksd1@usa.gov
471	Juliane Colly	9 Nevada Avenue	+595 992 329357	jcollyd2@usda.gov
472	Felice Maciaszek	0262 Weeping Birch Hill	+595 981 767506	fmaciaszekd3@oakley.com
473	Vinnie Bidmead	6 Springs Street	+595 981 407816	vbidmeadd4@wix.com
474	Wayne Allen	7 Dennis Court	+595 981 832058	wallend5@blogtalkradio.com
475	Odo Burner	0334 Memorial Lane	+595 985 935078	oburnerd6@columbia.edu
476	Fannie Penner	9076 Huxley Place	+595 981 280980	fpennerd7@auda.org.au
477	Kiel Binnion	6192 Hayes Drive	+595 985 423500	kbinniond8@clickbank.net
478	Stephine Ruske	3 Loomis Pass	+595 985 339958	srusked9@angelfire.com
479	Mirabel Orritt	15658 Melby Alley	+595 985 917641	morrittda@sina.com.cn
480	Fowler Murrey	98345 Dwight Court	+595 994 697070	fmurreydb@vk.com
481	Daile Bodley	03539 Golf View Park	+595 985 992291	dbodleydc@vinaora.com
482	Arley Cosin	590 Corscot Place	+595 985 104109	acosindd@pbs.org
483	Seymour Symper	224 Nova Point	+595 985 356318	ssymperde@bandcamp.com
484	Madelon MacIan	810 Thackeray Parkway	+595 992 365857	mmaciandf@flavors.me
485	Allix Garvey	18702 Bunker Hill Lane	+595 981 716508	agarveydg@bigcartel.com
486	Selle Brandel	06 Golf View Point	+595 992 936331	sbrandeldh@blogspot.com
487	Birk Diver	47 Bobwhite Place	+595 981 889658	bdiverdi@ehow.com
488	Burgess Medwell	915 Vera Plaza	+595 981 555729	bmedwelldj@cafepress.com
489	Konstantine Goulborne	41 Holmberg Hill	+595 992 666531	kgoulbornedk@unc.edu
490	Adelice Towe	390 Crescent Oaks Park	+595 992 317274	atowedl@arstechnica.com
491	Annaliese Canceller	23639 Paget Trail	+595 985 568582	acancellerdm@pen.io
492	Ephrem Heffron	25 Badeau Court	+595 994 137992	eheffrondn@desdev.cn
493	Delmer Fazzioli	135 Grover Park	+595 992 821486	dfazziolido@narod.ru
494	Rusty Kelinge	15 Glacier Hill Road	+595 992 768782	rkelingedp@google.es
495	Vina Magor	085 Gina Terrace	+595 985 717801	vmagordq@hatena.ne.jp
496	Micaela Matousek	9957 Eliot Junction	+595 981 326013	mmatousekdr@dyndns.org
497	Velvet Wickens	80 Anderson Avenue	+595 994 279807	vwickensds@virginia.edu
498	Lind Hesbrook	53 Rockefeller Drive	+595 985 739891	lhesbrookdt@indiegogo.com
499	Atalanta Pickerin	126 Mariners Cove Street	+595 981 428201	apickerindu@psu.edu
500	Job Ilyinski	59 Leroy Avenue	+595 985 719787	jilyinskidv@marriott.com
1000	Cliente Prueba	\N	\N	\N
502	Adán Alvarez	Av. Victor Matiauda	+595 994177042	adan.alvarez@mail.com
\.


--
-- Data for Name: Depositos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Depositos" (id_deposito, nombre) FROM stdin;
1	Depósito General
2	Salón de Ventas
10	Deposito Prueba
\.


--
-- Data for Name: Empleados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Empleados" (id_empleado, nombre_completo) FROM stdin;
1	Helena Gartin
2	Elmo Shields
3	Jaye Petett
4	Kippy Trusler
5	Justis Scriviner
6	Alexio Eldrid
7	Gardner Crickmoor
8	Dylan Klainer
9	Alexandr Gowthorpe
10	Candy Whicher
11	Marsiella Boribal
12	Dody Lambshine
13	Hakim Halbert
14	Emmalynne Harwood
15	Georgiana Wells
16	Anders Peasnone
17	Ailyn Swalwel
18	Keeley Kubal
19	Virginia Naerup
20	Colman Aime
21	Gualterio Flegg
22	Ogdon Horlick
23	Emera Spring
24	Zachariah Burgess
25	Arney Girardey
26	Andrey Ianson
27	Dyna Pavlov
28	Cymbre Tartt
29	Harald Rottgers
30	Yoko Ecob
31	Bobinette Poxson
32	Madeleine MacTurlough
33	Bellina Geraudy
34	Pete Scorer
35	Meyer Nieass
36	Tremaine Bligh
37	Elwira Duffit
38	Shela Winslade
39	York Tolputt
40	Jade Cantero
41	Hilario Proffitt
42	Abran McVeagh
43	Silvain Leach
44	Walther Van der Krui
45	Salomo Glew
46	Norton Donkersley
47	Jillian Cogin
48	Thorsten Dunrige
49	Janek Pilkington
1000	Empleado Prueba
\.


--
-- Data for Name: EstadosPedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EstadosPedido" (id_estado, nombre) FROM stdin;
1	Pedido Recibido
2	Pendiente de Aprobación
3	Pendiente de Pago
5	Pago Parcial
6	Error en el Pago
7	En Espera de Stock
8	Stock Reservado
9	En Preparación
10	Empaquetado
11	Listo para Retirar
12	Listo para Despacho
13	Despachado
14	En Tránsito
15	En Centro de Distribución
16	En Reparto
17	Intento de Entrega Fallido
18	Entregado
19	Completado
20	En Disputa
21	Solicitud de Devolución
22	Devolución Aprobada
23	Devuelto
24	Cancelado por Cliente
25	Cancelado por Sistema
4	Confirmado
\.


--
-- Data for Name: EstadosPresupuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EstadosPresupuesto" (id_estado, nombre) FROM stdin;
1	Borrador
2	Enviado
4	Rechazado
5	Vencido
6	Anulado
7	Convertido
8	Pendiente
3	Confirmado
100	EP_Test
10	Emitido
\.


--
-- Data for Name: FacturaDetalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FacturaDetalles" (id_detalle, id_factura, id_producto, cantidad, precio_unitario, porcentaje_iva) FROM stdin;
1	1	30	1	750000.00	10.00
2	1	31	1	850000.00	10.00
3	2	77	2	110000.00	10.00
6	5	5	2	110000.00	0.00
7	6	107	10	129.99	6.00
8	6	115	40	9.99	0.00
9	6	178	40	19.99	8.00
\.


--
-- Data for Name: Facturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Facturas" (id_factura, id_pedido, numero_factura, fecha_emision, estado) FROM stdin;
1	1	001-001-0002101	2025-10-09 11:00:00	Emitida
2	2	001-001-0002102	2025-10-10 07:55:00	Emitida
5	2	FAC-2025-2-62	2025-11-21 02:58:48.147129	Emitida
6	29	FAC-2025-29-100	2025-11-21 04:09:45.359762	Emitida
\.


--
-- Data for Name: Marcas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Marcas" (id_marca, nombre) FROM stdin;
1	Photospace
2	Youbridge
3	Vidoo
4	Blogspan
5	Youtags
6	Rhynyx
7	Skipfire
8	Mymm
9	Oyonder
10	Gigashots
11	Topicware
12	Voonder
13	Kazio
14	Fanoodle
15	Eire
16	Realpoint
17	Wordpedia
18	Tazzy
19	Minyx
20	Ntag
21	Rhybox
22	Gigaclub
25	Kwinu
26	Oloo
27	Kaymbo
28	Yoveo
29	Latz
30	Npath
31	Dablist
32	Zoonder
33	Skinte
35	Meetz
36	Livetube
37	Pixoboo
38	Skalith
39	Meemm
40	Vinte
41	Abatz
42	Talane
43	Twitterbridge
44	Ozu
45	Oyoba
46	Skimia
47	Yadel
48	Bluezoom
49	Avamba
50	Devpoint
51	Quinu
52	Geba
53	Zoovu
54	Eadel
55	Meeveo
56	Nlounge
58	Jabberstorm
59	Yakijo
60	Yabox
61	Tavu
62	Youspan
63	Aimbo
64	Ailane
65	Realcube
66	Zoombox
67	Realfire
69	Camido
70	Riffpath
71	Skynoodle
72	Demivee
73	Shuffletag
75	Aivee
76	Yakitri
77	Jabberbean
79	Thoughtsphere
80	Trupe
81	Tanoodle
82	Eamia
83	Topdrive
84	Edgepulse
86	Reallinks
87	Rhyloo
88	Blognation
89	Skyba
90	Kayveo
91	Yombu
92	Feedbug
93	Blogpad
95	Zoomlounge
96	Skyndu
97	Zava
98	Viva
100	Jayo
\.


--
-- Data for Name: Motivos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Motivos" (id_motivo, descripcion) FROM stdin;
1	Cliente no confirmó
2	Producto fuera de stock
3	Error en el precio
4	Cambio de proveedor
5	Retraso en entrega
6	Pedido duplicado
7	Producto discontinuado
8	Cancelación por política interna
9	Solicitud de anulación del cliente
10	Error en la cantidad solicitada
11	Pedido incompleto
12	Fallo en el sistema de pagos
13	Desacuerdo en condiciones de venta
14	Error en la dirección de entrega
15	Cliente desistió de la compra
16	Problema logístico
17	Falta de autorización interna
18	Cambio de prioridades del cliente
19	Producto dañado
20	Problema de transporte
21	Condiciones contractuales no aceptadas
22	Problema en la documentación
23	Error de facturación
24	Pedido mal registrado
25	Cliente cambió de proveedor
26	Producto incompatible
27	Problema de inventario
28	Cancelación por fuerza mayor
29	Error en la cotización
30	Pedido rechazado por auditoría
31	Condición de crédito no aprobada
32	Producto no conforme a especificaciones
33	Solicitud de cambio de entrega
34	Problema en la logística de transporte
500	Motivo Prueba
\.


--
-- Data for Name: PedidoDetalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PedidoDetalles" (id_detalle, id_pedido, id_producto, cantidad, precio_unitario) FROM stdin;
1	1	30	1	750000.00
2	1	31	1	850000.00
3	2	5	2	110000.00
7	25	1	1	59.99
8	28	1	1	59.99
9	29	107	10	129.99
10	29	115	40	9.99
11	29	178	40	19.99
12	30	178	40	19.99
13	31	178	40	19.99
14	31	200	10	4.99
15	31	49	2	49.99
\.


--
-- Data for Name: Pedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Pedidos" (id_pedido, id_cliente, id_presupuesto, fecha_generacion, id_estado, id_motivo, id_deposito_origen) FROM stdin;
2	62	7	2025-10-09 14:20:00	4	11	2
1	35	3	2025-10-08 09:00:00	4	10	1
3	1	2000	2025-10-31 05:52:23.976659	4	500	2
25	5	35	2025-11-20 00:00:00	1	500	1
29	100	42	2025-11-21 00:00:00	4	500	1
28	5	40	2025-11-21 00:00:00	4	500	1
30	100	45	2025-11-21 00:00:00	4	500	1
31	100	46	2025-11-21 00:00:00	4	500	1
\.


--
-- Data for Name: PedidosLog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PedidosLog" (id_log, id_pedido, accion, fecha) FROM stdin;
1	3	INSERT	2025-10-31 05:52:23.976659+00
12	1	UPDATE	2025-10-31 11:54:39.391918+00
23	3	UPDATE	2025-11-20 20:55:55.49159+00
24	3	UPDATE	2025-11-20 21:03:50.027789+00
25	3	UPDATE	2025-11-20 21:04:48.05918+00
30	25	INSERT	2025-11-20 22:51:36.964637+00
31	25	INSERT	2025-11-20 22:51:36.964637+00
32	28	INSERT	2025-11-21 00:28:23.791075+00
33	28	INSERT	2025-11-21 00:28:23.791075+00
34	29	INSERT	2025-11-21 03:55:10.91719+00
35	29	INSERT	2025-11-21 03:55:10.91719+00
36	29	UPDATE	2025-11-21 04:25:15.813307+00
37	29	UPDATE	2025-11-21 04:25:23.279194+00
38	29	UPDATE	2025-11-21 04:42:30.801051+00
39	28	UPDATE	2025-11-21 04:52:05.632193+00
40	30	INSERT	2025-11-21 04:57:56.306877+00
41	30	INSERT	2025-11-21 04:57:56.306877+00
42	30	UPDATE	2025-11-21 05:00:53.69325+00
43	30	UPDATE	2025-11-21 05:02:51.017805+00
44	31	INSERT	2025-11-21 11:01:19.535308+00
45	31	INSERT	2025-11-21 11:01:19.535308+00
46	31	UPDATE	2025-11-21 11:04:41.009682+00
\.


--
-- Data for Name: PresupuestoDetalles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PresupuestoDetalles" (id_detalle, id_presupuesto, id_producto, cantidad, precio_unitario) FROM stdin;
1	1	10	2	50000.00
2	1	12	1	120000.00
3	2	25	5	15000.00
5	3	31	1	850000.00
7	5	50	1	500000.00
8	6	60	3	30000.00
9	7	77	2	110000.00
4	3	20	1	750000.00
6	4	6	10	25000.00
12	24	1	1	59.99
13	23	2	1	4.79
14	22	3	1	59.99
15	21	4	1	39.99
16	20	5	1	6.99
17	20	6	1	14.99
18	20	7	1	2.49
21	26	2	100	4.79
22	26	5	90	6.99
23	27	1	1	59.99
24	28	2	1	4.79
25	29	3	1	59.99
26	30	4	1	39.99
27	31	5	1	6.99
28	32	6	1	14.99
29	33	7	1	2.49
30	34	1	1	59.99
31	35	1	1	59.99
32	36	1	1	59.99
35	40	1	1	59.99
36	42	107	10	129.99
37	42	115	40	9.99
38	42	178	40	19.99
40	45	178	40	19.99
41	46	178	40	19.99
42	46	200	10	4.99
43	46	49	2	49.99
\.


--
-- Data for Name: Presupuestos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Presupuestos" (id_presupuesto, id_cliente, id_empleado, fecha_emision, forma_pago, id_estado, id_motivo, importe_total) FROM stdin;
1	10	25	2025-10-08 11:30:00	Contado	2	\N	220000.00
2	22	30	2025-10-09 09:15:00	Credito	2	\N	75000.00
3	35	25	2025-10-07 16:00:00	Credito	3	\N	1600000.00
4	40	31	2025-10-06 14:00:00	Contado	4	15	250000.00
5	18	28	2025-09-05 10:00:00	Contado	5	\N	500000.00
6	55	30	2025-10-10 07:45:00	Contado	1	\N	90000.00
7	62	25	2025-09-20 12:00:00	Credito	8	\N	220000.00
2000	1000	1000	2025-10-31 05:52:23.976659	Contado	100	\N	12345.67
15	1	2	2025-11-20 21:22:26.51988	Credito	1	3	150000.00
16	1	2	2025-11-20 21:26:09.322003	Credito	1	3	150000.00
17	1	2	2025-11-20 21:26:11.951835	Credito	1	3	150000.00
18	5	11	2025-11-20 00:00:00	Contado	2	1	0.00
19	6	12	2025-01-20 00:00:00	Credito	1	1	0.00
20	7	13	2025-03-20 00:00:00	Contado	4	1	0.00
21	8	14	2025-05-20 00:00:00	Credito	5	1	0.00
22	9	15	2025-07-20 00:00:00	Contado	6	1	0.00
23	10	16	2025-02-27 00:00:00	Credito	8	1	0.00
24	11	17	2024-05-12 00:00:00	Contado	1	1	0.00
26	90	28	2025-11-20 22:00:06.000026	Contado	10	\N	1108.10
27	5	11	2025-11-20 00:00:00	Contado	10	1	0.00
28	6	12	2025-01-20 00:00:00	Credito	10	1	0.00
29	7	13	2025-03-20 00:00:00	Contado	10	1	0.00
30	8	14	2025-05-20 00:00:00	Credito	10	1	0.00
31	9	15	2025-07-20 00:00:00	Contado	10	1	0.00
32	10	16	2025-02-27 00:00:00	Credito	10	1	0.00
33	11	17	2024-05-12 00:00:00	Contado	10	1	0.00
34	5	11	2025-11-20 00:00:00	Contado	10	1	0.00
36	10	10	2025-11-20 22:45:50.826653	Contado	1	\N	0.00
35	5	11	2025-11-20 00:00:00	Contado	7	1	0.00
37	5	11	2025-11-20 00:00:00	Contado	10	1	0.00
40	5	11	2025-11-20 00:00:00	Contado	3	1	0.00
41	10	30	2025-11-21 01:27:03.424004	Contado	10	\N	0.00
43	100	40	2025-11-21 04:20:53.501355	Contado	8	\N	0.00
42	100	40	2025-11-21 03:04:13.92097	Contado	1	\N	2499.10
44	100	40	2025-11-21 04:55:29.90166	Contado	8	\N	0.00
45	100	40	2025-11-21 04:55:58.373805	Contado	3	\N	799.60
46	100	40	2025-11-21 10:59:39.119516	Contado	3	1	949.48
\.


--
-- Data for Name: Productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Productos" (id_producto, descripcion, id_marca, id_tipo_producto, aplica_iva, porcentaje_iva, precio_venta, precio_compra) FROM stdin;
1	Filtra el aire que entra al motor para evitar partículas dañinas	43	1	f	0.00	59.99	37.66
2	Retiene impurezas del aceite del motor para proteger componentes	69	2	t	19.00	4.79	2.17
3	Limpia el combustible antes de llegar al motor	100	3	t	17.00	59.99	36.31
4	Proporciona la chispa necesaria para la combustión del motor	50	4	f	0.00	39.99	34.55
5	Sincroniza el movimiento del cigüeñal y el árbol de levas	77	5	f	0.00	6.99	5.28
6	Mueve accesorios como alternador, bomba de agua o aire acondicionado	37	6	t	14.00	14.99	4.13
7	Genera energía eléctrica para el vehículo y carga la batería	69	7	f	0.00	2.49	1.02
8	Circula el refrigerante por el motor y radiador	26	8	t	17.00	39.99	36.43
9	Enfría el refrigerante para mantener la temperatura del motor	66	9	t	12.00	39.99	37.13
10	Regula el flujo de refrigerante según la temperatura	46	10	t	17.00	22.99	10.44
11	Introduce el combustible de forma precisa en los cilindros	7	11	f	0.00	59.99	41.96
12	Proporciona energía para el arranque y sistemas eléctricos	47	12	f	0.00	8.99	4.57
13	Sin Descripción	31	60	f	0.00	14.99	1.23
14	Permite encender el motor del vehículo	31	14	f	0.00	44.99	28.98
15	Transfiere la fuerza del motor a la transmisión	73	15	t	20.00	39.99	31.68
16	Presiona el disco de embrague para acoplarlo	26	16	f	0.00	69.99	40.74
17	Permite el desacoplamiento del embrague	55	17	t	10.00	19.99	7.44
18	Permite seleccionar la relación de transmisión adecuada	92	18	f	0.00	79.99	54.89
19	Absorben impactos y proporcionan estabilidad al vehículo	66	19	t	10.00	1.99	0.99
20	Soportan el peso del vehículo y absorben irregularidades	5	20	t	15.00	26.99	23.36
21	Conectan componentes de suspensión y dirección, permitiendo movimiento	71	21	t	17.00	1.89	0.97
22	Transmiten el movimiento del volante a las ruedas	55	22	t	13.00	3.19	1.24
23	Convierte el giro del volante en movimiento de las ruedas	7	25	t	12.00	9.99	3.12
24	Conectan la barra estabilizadora a la suspensión	42	26	f	0.00	149.99	32.40
25	Soportan y fijan los amortiguadores al chasis	5	27	t	11.00	24.99	21.27
26	Generan fricción sobre los discos para detener el vehículo	25	28	f	0.00	39.99	16.40
27	Superficie de fricción donde actúan las pastillas de freno	77	29	t	13.00	5.49	1.76
28	Fricción sobre el tambor para detener las ruedas traseras	22	30	f	0.00	4.29	3.23
29	Superficie de fricción para frenos de tambor	48	31	t	6.00	39.99	22.78
30	Presionan las pastillas sobre los discos para frenar	64	32	t	13.00	4.49	1.03
31	Transportan el líquido de frenos a las pinzas o tambores	53	33	t	7.00	3.99	2.06
32	Amplifica la fuerza aplicada al pedal de freno	10	35	t	13.00	22.99	2.62
33	Transmiten potencia a las ruedas manteniendo el ángulo de giro	84	36	t	7.00	4.79	3.62
34	Conectan la transmisión con las ruedas motrices	29	37	t	18.00	29.99	28.79
35	Permiten el giro y movimiento de los ejes de transmisión	18	38	f	0.00	1.29	0.67
36	Distribuye la potencia entre las ruedas motrices	69	39	t	14.00	49.99	36.05
37	Sin Descripción	59	41	t	5.00	35.99	23.26
38	Refresca el radiador cuando el vehículo está detenido	36	41	t	17.00	2.49	1.10
39	Contiene el exceso de refrigerante y permite su expansión	62	42	t	8.00	2.49	1.49
40	Conducen el líquido refrigerante por el motor y radiador	70	43	t	14.00	29.99	28.27
41	Mide la temperatura del motor para controlar sistemas	73	44	t	10.00	99.99	95.35
42	Sin Descripción	27	25	t	6.00	3.50	1.82
43	Sin Descripción	62	49	f	0.00	29.99	25.08
44	Sin Descripción	72	41	t	9.00	39.99	19.99
45	Controlan el flujo de corriente en circuitos eléctricos	3	48	t	14.00	24.99	8.95
46	Protegen los circuitos eléctricos de sobrecargas	71	49	t	18.00	4.29	2.41
47	Iluminan a larga distancia por la noche	83	50	f	0.00	5.49	1.22
48	Señalizan que el vehículo está frenando	98	51	f	0.00	39.99	16.62
49	Indican giros o cambios de carril	53	52	f	0.00	49.99	22.66
50	Transportan corriente y señales a distintos componentes	31	53	t	6.00	2.99	1.48
51	Unen cables eléctricos de manera segura	11	54	t	18.00	2.49	1.12
52	Protege la carrocería de impactos menores	100	55	t	13.00	27.99	18.53
53	Evita que barro y piedras salpiquen otras partes del vehículo	9	56	f	0.00	49.99	6.03
54	Acceso y protección de los ocupantes	61	58	t	10.00	3.59	2.14
55	Protege el motor y permite su acceso para mantenimiento	67	59	t	18.00	3.99	2.98
56	Permite la entrada de aire al radiador y protege el frente	22	60	f	0.00	44.99	2.89
57	Aseguran puertas, capó y maletero	28	61	t	20.00	4.99	1.36
58	Permiten abrir puertas y compartimentos	55	62	f	0.00	99.99	46.54
59	Proporcionan soporte y comodidad a los ocupantes	49	63	t	17.00	34.99	31.55
60	Sin Descripción	2	64	f	0.00	14.99	6.85
61	Retienen a los ocupantes en caso de accidente	67	65	f	0.00	3.49	1.72
62	Permite controlar la dirección del vehículo	61	66	t	6.00	49.99	9.12
63	Controlan aceleración, freno y embrague	100	67	t	6.00	3.99	1.62
64	Canaliza gases de combustión desde el motor	56	69	f	0.00	14.99	8.00
65	Reduce emisiones contaminantes de los gases de escape	13	70	t	13.00	2.49	1.24
66	Disminuye el ruido del escape	47	71	t	11.00	3.99	1.78
67	Conduce los gases fuera del vehículo	65	72	t	20.00	9.49	3.91
68	Sin Descripción	2	72	f	0.00	34.99	30.02
69	Sin Descripción	53	66	t	13.00	5.99	3.90
70	Sin Descripción	6	65	f	0.00	7.49	1.33
71	Sin Descripción	46	60	t	10.00	349.99	133.88
72	Sin Descripción	54	33	t	18.00	19.99	15.87
73	Sin Descripción	93	32	t	5.00	29.99	8.99
74	Sin Descripción	65	4	f	0.00	10.99	8.05
75	Sin Descripción	49	5	f	0.00	3.49	1.56
76	Sin Descripción	64	6	f	0.00	5.49	1.22
77	Sin Descripción	83	7	t	17.00	1.99	1.00
78	Sin Descripción	27	8	t	16.00	4.79	1.83
79	Sin Descripción	2	9	t	13.00	49.95	26.35
80	Sin Descripción	5	10	t	16.00	10.99	2.08
81	Sin Descripción	92	11	f	0.00	2.99	1.20
82	Sin Descripción	54	12	t	15.00	4.99	3.22
83	Sin Descripción	93	14	f	0.00	15.99	12.45
84	Sin Descripción	80	15	t	8.00	22.99	9.23
85	Sin Descripción	61	28	t	19.00	49.99	30.66
86	Sin Descripción	4	29	f	0.00	59.99	44.00
87	Sin Descripción	83	30	f	0.00	49.95	36.35
88	Sin Descripción	46	31	f	0.00	3.49	1.75
89	Sin Descripción	52	32	f	0.00	14.99	5.83
90	Sin Descripción	32	33	t	8.00	5.49	1.51
91	Sin Descripción	50	9	t	11.00	5.99	2.72
92	Retiene impurezas del aceite del motor para proteger componentes	36	2	f	0.00	2.49	1.11
93	Limpia el combustible antes de llegar al motor	15	3	t	7.00	15.99	4.32
94	Proporciona la chispa necesaria para la combustión del motor	56	4	f	0.00	34.99	13.09
95	Sincroniza el movimiento del cigüeñal y el árbol de levas	39	5	t	6.00	6.49	2.96
96	Mueve accesorios como alternador, bomba de agua o aire acondicionado	76	6	t	19.00	6.99	3.78
97	Genera energía eléctrica para el vehículo y carga la batería	6	7	f	0.00	49.99	36.43
98	Circula el refrigerante por el motor y radiador	66	8	t	11.00	24.99	19.24
99	Enfría el refrigerante para mantener la temperatura del motor	62	9	t	16.00	89.99	86.72
100	Regula el flujo de refrigerante según la temperatura	72	10	t	20.00	29.99	22.56
101	Introduce el combustible de forma precisa en los cilindros	96	11	t	16.00	129.99	42.15
102	Proporciona energía para el arranque y sistemas eléctricos	60	12	f	0.00	4.99	1.32
103	Permite encender el motor del vehículo	22	14	t	13.00	3.49	1.59
104	Transfiere la fuerza del motor a la transmisión	46	15	f	0.00	79.99	2.90
105	Presiona el disco de embrague para acoplarlo	82	16	t	12.00	12.99	2.83
106	Permite el desacoplamiento del embrague	37	17	t	19.00	1.99	0.99
107	Permite seleccionar la relación de transmisión adecuada	47	18	t	6.00	129.99	50.14
108	Absorben impactos y proporcionan estabilidad al vehículo	7	19	f	0.00	1.79	0.88
109	Soportan el peso del vehículo y absorben irregularidades	72	20	f	0.00	59.99	58.52
110	Conectan componentes de suspensión y dirección, permitiendo movimiento	30	21	f	0.00	1.99	1.00
111	Transmiten el movimiento del volante a las ruedas	3	22	f	0.00	6.99	1.12
112	Reduce el balanceo del vehículo en curvas	33	23	t	20.00	249.99	48.23
113	Aíslan vibraciones y permiten movimiento entre piezas de la suspensión	32	24	t	8.00	4.99	1.36
114	Convierte el giro del volante en movimiento de las ruedas	51	25	f	0.00	18.99	14.88
115	Conectan la barra estabilizadora a la suspensión	83	26	f	0.00	9.99	8.87
116	Soportan y fijan los amortiguadores al chasis	13	27	f	0.00	29.99	18.15
117	Generan fricción sobre los discos para detener el vehículo	52	28	t	13.00	34.99	25.41
118	Superficie de fricción donde actúan las pastillas de freno	7	29	t	9.00	129.99	48.31
119	Fricción sobre el tambor para detener las ruedas traseras	72	30	f	0.00	12.99	5.19
120	Superficie de fricción para frenos de tambor	50	31	f	0.00	29.99	13.35
121	Presionan las pastillas sobre los discos para frenar	88	32	f	0.00	79.99	63.59
122	Transportan el líquido de frenos a las pinzas o tambores	96	33	t	18.00	199.99	32.87
123	Genera presión hidráulica en el sistema de frenos	8	34	f	0.00	8.99	6.82
124	Amplifica la fuerza aplicada al pedal de freno	19	35	f	0.00	1.99	0.99
125	Transmiten potencia a las ruedas manteniendo el ángulo de giro	89	36	f	0.00	4.99	2.46
126	Conectan la transmisión con las ruedas motrices	1	37	t	11.00	24.99	22.31
127	Permiten el giro y movimiento de los ejes de transmisión	51	38	f	0.00	22.00	3.00
128	Distribuye la potencia entre las ruedas motrices	41	39	f	0.00	3.29	1.60
129	Refresca el radiador cuando el vehículo está detenido	73	41	t	12.00	3.99	1.05
130	Contiene el exceso de refrigerante y permite su expansión	22	42	f	0.00	4.99	2.44
131	Conducen el líquido refrigerante por el motor y radiador	7	43	t	18.00	3.99	1.44
132	Mide la temperatura del motor para controlar sistemas	6	44	f	0.00	19.99	5.94
133	Controlan el flujo de corriente en circuitos eléctricos	59	48	t	17.00	249.99	223.78
134	Protegen los circuitos eléctricos de sobrecargas	48	49	t	16.00	4.89	2.15
135	Iluminan a larga distancia por la noche	1	50	f	0.00	4.29	2.00
136	Señalizan que el vehículo está frenando	61	51	f	0.00	19.99	1.43
137	Indican giros o cambios de carril	100	52	f	0.00	45.00	15.00
138	Transportan corriente y señales a distintos componentes	97	53	f	0.00	22.99	15.66
139	Unen cables eléctricos de manera segura	60	54	f	0.00	4.99	2.55
140	Protege la carrocería de impactos menores	81	55	t	16.00	3.39	1.08
141	Evita que barro y piedras salpiquen otras partes del vehículo	43	56	f	0.00	15.99	7.20
142	Permiten ver lo que sucede detrás del vehículo	43	57	t	9.00	4.49	1.79
143	Acceso y protección de los ocupantes	47	58	t	16.00	14.99	8.32
144	Protege el motor y permite su acceso para mantenimiento	54	59	t	5.00	7.99	5.21
145	Permite la entrada de aire al radiador y protege el frente	16	60	f	0.00	99.99	20.45
146	Aseguran puertas, capó y maletero	53	61	t	6.00	1.29	0.72
147	Permiten abrir puertas y compartimentos	38	62	f	0.00	2.49	1.16
148	Proporcionan soporte y comodidad a los ocupantes	38	63	f	0.00	44.99	29.36
149	Sin Descripción	31	64	f	0.00	2.29	1.11
150	Retienen a los ocupantes en caso de accidente	83	65	f	0.00	29.99	2.73
151	Permite controlar la dirección del vehículo	1	66	t	5.00	59.99	18.43
152	Controlan aceleración, freno y embrague	35	67	f	0.00	3.29	1.58
153	Protegen el piso del vehículo y facilitan limpieza	15	68	t	6.00	19.99	2.07
154	Canaliza gases de combustión desde el motor	52	69	t	13.00	4.49	1.59
155	Reduce emisiones contaminantes de los gases de escape	14	70	f	0.00	8.99	5.26
156	Disminuye el ruido del escape	2	71	f	0.00	3.29	2.29
157	Conduce los gases fuera del vehículo	92	72	f	0.00	6.49	4.11
158	Filtra el aire que entra al motor para evitar partículas dañinas	9	1	f	0.00	34.99	19.80
159	Retiene impurezas del aceite del motor para proteger componentes	4	2	t	14.00	19.99	9.96
160	Limpia el combustible antes de llegar al motor	9	3	f	0.00	3.29	1.92
161	Proporciona la chispa necesaria para la combustión del motor	9	4	f	0.00	39.99	18.39
162	Sincroniza el movimiento del cigüeñal y el árbol de levas	72	5	t	19.00	3.99	1.74
163	Mueve accesorios como alternador, bomba de agua o aire acondicionado	17	6	t	16.00	99.99	55.51
164	Genera energía eléctrica para el vehículo y carga la batería	64	7	t	18.00	15.99	7.96
165	Circula el refrigerante por el motor y radiador	65	8	t	14.00	5.49	1.90
166	Enfría el refrigerante para mantener la temperatura del motor	7	9	t	11.00	19.99	11.59
167	Regula el flujo de refrigerante según la temperatura	95	10	f	0.00	6.99	3.38
168	Introduce el combustible de forma precisa en los cilindros	9	11	f	0.00	2.49	1.30
169	Proporciona energía para el arranque y sistemas eléctricos	58	12	f	0.00	0.89	0.07
170	Sin Descripción	60	34	f	0.00	15.99	3.06
171	Permite encender el motor del vehículo	16	14	t	9.00	2.99	1.09
172	Transfiere la fuerza del motor a la transmisión	13	15	t	12.00	3.59	1.66
173	Presiona el disco de embrague para acoplarlo	76	16	f	0.00	7.99	5.68
174	Permite el desacoplamiento del embrague	66	17	t	18.00	4.99	3.15
175	Permite seleccionar la relación de transmisión adecuada	67	18	t	20.00	22.99	20.49
176	Absorben impactos y proporcionan estabilidad al vehículo	100	19	t	16.00	6.49	4.78
177	Soportan el peso del vehículo y absorben irregularidades	60	20	f	0.00	3.99	2.63
178	Conectan componentes de suspensión y dirección, permitiendo movimiento	70	21	t	8.00	19.99	4.06
179	Transmiten el movimiento del volante a las ruedas	37	22	f	0.00	0.99	0.15
180	Convierte el giro del volante en movimiento de las ruedas	41	25	t	15.00	139.99	80.49
181	Conectan la barra estabilizadora a la suspensión	64	26	f	0.00	7.49	5.45
182	Soportan y fijan los amortiguadores al chasis	14	27	f	0.00	64.99	61.71
183	Generan fricción sobre los discos para detener el vehículo	71	28	t	10.00	29.99	11.68
184	Superficie de fricción donde actúan las pastillas de freno	2	29	f	0.00	129.99	56.90
185	Fricción sobre el tambor para detener las ruedas traseras	83	30	f	0.00	2.49	1.45
186	Superficie de fricción para frenos de tambor	76	31	f	0.00	15.99	7.26
187	Presionan las pastillas sobre los discos para frenar	62	32	t	13.00	2.49	1.18
188	Transportan el líquido de frenos a las pinzas o tambores	60	33	t	20.00	29.99	9.88
189	Amplifica la fuerza aplicada al pedal de freno	30	35	f	0.00	3.49	1.34
190	Transmiten potencia a las ruedas manteniendo el ángulo de giro	97	36	t	10.00	3.29	1.83
191	Conectan la transmisión con las ruedas motrices	14	37	t	6.00	22.99	17.91
192	Permiten el giro y movimiento de los ejes de transmisión	54	38	f	0.00	1.49	0.80
193	Distribuye la potencia entre las ruedas motrices	22	39	t	8.00	24.99	15.86
194	Sin Descripción	10	42	f	0.00	3.99	1.51
195	Refresca el radiador cuando el vehículo está detenido	17	41	f	0.00	29.99	10.12
196	Contiene el exceso de refrigerante y permite su expansión	79	42	f	0.00	3.49	1.76
197	Conducen el líquido refrigerante por el motor y radiador	82	43	t	6.00	6.49	2.40
198	Mide la temperatura del motor para controlar sistemas	35	44	t	19.00	4.99	3.23
199	Sin Descripción	43	21	f	0.00	29.99	24.28
200	Sin Descripción	96	52	f	0.00	4.99	2.23
\.


--
-- Data for Name: Stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Stock" (id_stock, id_producto, id_deposito, cantidad_disponible, cantidad_confirmada) FROM stdin;
416	1	2	337	0
417	2	1	555	0
418	3	1	710	0
419	4	1	718	0
420	5	1	271	0
421	6	1	451	0
422	7	1	692	0
423	8	2	652	0
424	9	1	997	0
425	10	2	465	0
426	11	2	493	0
427	12	1	744	0
428	13	1	682	0
429	14	1	318	0
430	15	1	287	0
431	16	1	952	0
432	17	1	122	0
433	18	2	347	0
434	19	1	852	0
435	20	2	79	0
436	21	2	950	0
437	22	2	702	0
438	23	1	948	0
439	24	2	327	0
440	25	2	271	0
441	26	1	228	0
442	27	1	351	0
443	28	1	99	0
444	29	1	669	0
445	30	2	872	0
446	31	2	71	0
447	32	1	861	0
448	33	1	407	0
449	34	1	869	0
450	35	1	739	0
451	36	2	69	0
452	37	2	796	0
453	38	2	313	0
454	39	1	728	0
455	40	2	951	0
456	41	2	811	0
457	42	1	741	0
458	43	2	297	0
459	44	2	512	0
460	45	1	841	0
461	46	1	393	0
462	47	2	492	0
463	48	1	230	0
465	50	2	978	0
466	51	1	696	0
467	52	1	969	0
468	53	1	470	0
469	54	1	581	0
470	55	2	24	0
471	56	2	911	0
472	57	1	76	0
473	58	2	129	0
474	59	1	418	0
475	60	1	895	0
476	61	1	572	0
477	62	2	4	0
478	63	2	222	0
479	64	1	85	0
480	65	1	266	0
481	66	1	166	0
482	67	2	357	0
483	68	2	449	0
484	69	1	205	0
485	70	2	118	0
486	71	1	6	0
487	72	1	34	0
488	73	2	275	0
489	74	1	71	0
490	75	2	575	0
491	76	2	258	0
492	77	1	237	0
493	78	2	527	0
494	79	2	564	0
495	80	1	696	0
496	81	2	386	0
497	82	2	214	0
498	83	1	49	0
499	84	2	325	0
500	85	2	982	0
501	86	1	333	0
502	87	2	818	0
503	88	2	284	0
504	89	2	927	0
505	90	1	489	0
506	91	2	488	0
507	92	2	795	0
508	93	1	372	0
509	94	2	845	0
510	95	2	700	0
511	96	2	440	0
512	97	2	7	0
513	98	2	729	0
514	99	1	844	0
515	100	1	753	0
516	101	2	86	0
517	102	2	474	0
518	103	1	258	0
519	104	2	966	0
520	105	2	714	0
521	106	2	678	0
522	107	1	817	0
523	108	2	835	0
524	109	2	433	0
525	110	1	381	0
526	111	1	47	0
527	112	1	93	0
528	113	2	883	0
529	114	1	216	0
530	115	1	558	0
531	116	1	113	0
532	117	1	86	0
533	118	1	774	0
534	119	2	31	0
535	120	1	200	0
536	121	1	728	0
537	122	1	850	0
538	123	2	880	0
539	124	2	396	0
540	125	2	308	0
541	126	2	386	0
542	127	2	341	0
543	128	1	70	0
544	129	1	62	0
545	130	1	148	0
546	131	2	896	0
547	132	2	402	0
548	133	1	942	0
549	134	1	627	0
550	135	1	134	0
551	136	1	944	0
552	137	2	42	0
553	138	1	399	0
554	139	1	984	0
555	140	1	928	0
556	141	2	899	0
557	142	2	344	0
558	143	2	913	0
559	144	1	117	0
560	145	1	401	0
561	146	2	485	0
562	147	2	33	0
563	148	2	876	0
564	149	1	106	0
565	150	2	525	0
566	151	2	238	0
567	152	2	646	0
568	153	1	6	0
569	154	1	421	0
570	155	2	976	0
571	156	2	728	0
572	157	1	131	0
573	158	2	748	0
574	159	2	232	0
575	160	1	252	0
576	161	1	594	0
577	162	1	86	0
578	163	2	814	0
579	164	2	306	0
580	165	1	260	0
581	166	1	65	0
582	167	1	855	0
583	168	1	335	0
584	169	1	6	0
585	170	2	982	0
586	171	1	480	0
587	172	2	984	0
588	173	2	810	0
589	174	2	463	0
590	175	2	512	0
591	176	2	319	0
592	177	2	753	0
594	179	2	73	0
595	180	1	5	0
596	181	2	498	0
597	182	2	424	0
598	183	2	36	0
599	184	2	439	0
600	185	1	826	0
601	186	2	509	0
602	187	1	510	0
603	188	2	313	0
604	189	1	133	0
605	190	2	643	0
606	191	2	878	0
607	192	2	359	0
608	193	2	173	0
609	194	2	801	0
610	195	2	865	0
611	196	1	735	0
612	197	2	866	0
613	198	2	826	0
614	199	2	763	0
464	49	1	852	4
615	200	1	285	20
593	178	1	497	160
\.


--
-- Data for Name: TiposProducto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TiposProducto" (id_tipo_producto, nombre) FROM stdin;
1	Filtro de aire
2	Filtro de aceite
3	Filtro de combustible
4	Bujías
5	Correa de distribución
6	Correa auxiliar
7	Alternador
8	Bomba de agua
9	Radiador
10	Termostato
11	Inyectores
12	Batería
14	Motor de arranque
15	Embrague disco
16	Embrague plato
17	Embrague collarín
18	Caja de cambios (transmisión)
19	Amortiguadores
20	Resortes (espirales)
21	Rótulas
22	Terminales de dirección
23	Barra estabilizadora
24	Bujes
25	Cremallera de dirección
26	Bieletas
27	Bases de amortiguador
28	Pastillas de freno
29	Discos de freno
30	Zapatas de freno
31	Tambores de freno
32	Calipers o pinzas
33	Líneas de freno
34	Bomba de freno
35	Servofreno
36	Homocinéticas
37	Ejes de transmisión
38	Crucetas
39	Diferencial
41	Electroventilador
42	Depósito de expansión
43	Mangueras de refrigerante
44	Sensor de temperatura
48	Relés
49	Fusibles
50	Luces altas
51	Luces de stop
52	Luces intermitentes
53	Cables eléctricos
54	Conectores
55	Parachoques
56	Guardabarros
57	Retrovisores
58	Puertas
59	Capó
60	Parrilla
61	Cerraduras
62	Manijas
63	Asientos
64	
65	Cinturones de seguridad
66	Volante
67	Pedales
68	Alfombras
69	Múltiple de escape
70	Catalizador
71	Silenciador
72	Tubo de escape
\.


--
-- Data for Name: pedidos_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pedidos_log (id, pedido_id, acao, data) FROM stdin;
6	1	atualizado	2025-10-31 11:54:39.391918
13	3	atualizado	2025-11-20 20:55:55.49159
14	3	atualizado	2025-11-20 21:03:50.027789
15	3	atualizado	2025-11-20 21:04:48.05918
18	25	inserido	2025-11-20 22:51:36.964637
19	28	inserido	2025-11-21 00:28:23.791075
20	29	inserido	2025-11-21 03:55:10.91719
21	29	atualizado	2025-11-21 04:25:15.813307
22	29	atualizado	2025-11-21 04:25:23.279194
23	29	atualizado	2025-11-21 04:42:30.801051
24	28	atualizado	2025-11-21 04:52:05.632193
25	30	inserido	2025-11-21 04:57:56.306877
26	30	atualizado	2025-11-21 05:00:53.69325
27	30	atualizado	2025-11-21 05:02:51.017805
28	31	inserido	2025-11-21 11:01:19.535308
29	31	atualizado	2025-11-21 11:04:41.009682
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.schema_migrations (version, inserted_at) FROM stdin;
20211116024918	2025-10-09 15:42:22
20211116045059	2025-10-09 15:42:26
20211116050929	2025-10-09 15:42:28
20211116051442	2025-10-09 15:42:30
20211116212300	2025-10-09 15:42:33
20211116213355	2025-10-09 15:42:35
20211116213934	2025-10-09 15:42:38
20211116214523	2025-10-09 15:42:41
20211122062447	2025-10-09 15:42:43
20211124070109	2025-10-09 15:42:46
20211202204204	2025-10-09 15:42:48
20211202204605	2025-10-09 15:42:50
20211210212804	2025-10-09 15:42:57
20211228014915	2025-10-09 15:42:59
20220107221237	2025-10-09 15:43:02
20220228202821	2025-10-09 15:43:04
20220312004840	2025-10-09 15:43:06
20220603231003	2025-10-09 15:43:10
20220603232444	2025-10-09 15:43:12
20220615214548	2025-10-09 15:43:15
20220712093339	2025-10-09 15:43:17
20220908172859	2025-10-09 15:43:19
20220916233421	2025-10-09 15:43:22
20230119133233	2025-10-09 15:43:24
20230128025114	2025-10-09 15:43:27
20230128025212	2025-10-09 15:43:29
20230227211149	2025-10-09 15:43:32
20230228184745	2025-10-09 15:43:34
20230308225145	2025-10-09 15:43:36
20230328144023	2025-10-09 15:43:38
20231018144023	2025-10-09 15:43:41
20231204144023	2025-10-09 15:43:45
20231204144024	2025-10-09 15:43:47
20231204144025	2025-10-09 15:43:49
20240108234812	2025-10-09 15:43:52
20240109165339	2025-10-09 15:43:54
20240227174441	2025-10-09 15:43:58
20240311171622	2025-10-09 15:44:01
20240321100241	2025-10-09 15:44:06
20240401105812	2025-10-09 15:44:12
20240418121054	2025-10-09 15:44:15
20240523004032	2025-10-09 15:44:24
20240618124746	2025-10-09 15:44:26
20240801235015	2025-10-09 15:44:28
20240805133720	2025-10-09 15:44:31
20240827160934	2025-10-09 15:44:33
20240919163303	2025-10-09 15:44:36
20240919163305	2025-10-09 15:44:38
20241019105805	2025-10-09 15:44:41
20241030150047	2025-10-09 15:44:49
20241108114728	2025-10-09 15:44:53
20241121104152	2025-10-09 15:44:55
20241130184212	2025-10-09 15:44:58
20241220035512	2025-10-09 15:45:00
20241220123912	2025-10-09 15:45:02
20241224161212	2025-10-09 15:45:04
20250107150512	2025-10-09 15:45:07
20250110162412	2025-10-09 15:45:09
20250123174212	2025-10-09 15:45:11
20250128220012	2025-10-09 15:45:13
20250506224012	2025-10-09 15:45:15
20250523164012	2025-10-09 15:45:17
20250714121412	2025-10-09 15:45:20
20250905041441	2025-10-09 15:45:22
20251103001201	2025-11-12 20:29:02
\.


--
-- Data for Name: subscription; Type: TABLE DATA; Schema: realtime; Owner: supabase_admin
--

COPY realtime.subscription (id, subscription_id, entity, filters, claims, created_at) FROM stdin;
\.


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets (id, name, owner, created_at, updated_at, public, avif_autodetection, file_size_limit, allowed_mime_types, owner_id, type) FROM stdin;
\.


--
-- Data for Name: buckets_analytics; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_analytics (name, type, format, created_at, updated_at, id, deleted_at) FROM stdin;
\.


--
-- Data for Name: buckets_vectors; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.buckets_vectors (id, type, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.migrations (id, name, hash, executed_at) FROM stdin;
0	create-migrations-table	e18db593bcde2aca2a408c4d1100f6abba2195df	2025-10-09 15:42:19.251652
1	initialmigration	6ab16121fbaa08bbd11b712d05f358f9b555d777	2025-10-09 15:42:19.258388
2	storage-schema	5c7968fd083fcea04050c1b7f6253c9771b99011	2025-10-09 15:42:19.265294
3	pathtoken-column	2cb1b0004b817b29d5b0a971af16bafeede4b70d	2025-10-09 15:42:19.287238
4	add-migrations-rls	427c5b63fe1c5937495d9c635c263ee7a5905058	2025-10-09 15:42:19.348163
5	add-size-functions	79e081a1455b63666c1294a440f8ad4b1e6a7f84	2025-10-09 15:42:19.35166
6	change-column-name-in-get-size	f93f62afdf6613ee5e7e815b30d02dc990201044	2025-10-09 15:42:19.355874
7	add-rls-to-buckets	e7e7f86adbc51049f341dfe8d30256c1abca17aa	2025-10-09 15:42:19.359798
8	add-public-to-buckets	fd670db39ed65f9d08b01db09d6202503ca2bab3	2025-10-09 15:42:19.36283
9	fix-search-function	3a0af29f42e35a4d101c259ed955b67e1bee6825	2025-10-09 15:42:19.368633
10	search-files-search-function	68dc14822daad0ffac3746a502234f486182ef6e	2025-10-09 15:42:19.373581
11	add-trigger-to-auto-update-updated_at-column	7425bdb14366d1739fa8a18c83100636d74dcaa2	2025-10-09 15:42:19.377989
12	add-automatic-avif-detection-flag	8e92e1266eb29518b6a4c5313ab8f29dd0d08df9	2025-10-09 15:42:19.384425
13	add-bucket-custom-limits	cce962054138135cd9a8c4bcd531598684b25e7d	2025-10-09 15:42:19.388249
14	use-bytes-for-max-size	941c41b346f9802b411f06f30e972ad4744dad27	2025-10-09 15:42:19.39212
15	add-can-insert-object-function	934146bc38ead475f4ef4b555c524ee5d66799e5	2025-10-09 15:42:19.412012
16	add-version	76debf38d3fd07dcfc747ca49096457d95b1221b	2025-10-09 15:42:19.416376
17	drop-owner-foreign-key	f1cbb288f1b7a4c1eb8c38504b80ae2a0153d101	2025-10-09 15:42:19.419574
18	add_owner_id_column_deprecate_owner	e7a511b379110b08e2f214be852c35414749fe66	2025-10-09 15:42:19.42302
19	alter-default-value-objects-id	02e5e22a78626187e00d173dc45f58fa66a4f043	2025-10-09 15:42:19.428106
20	list-objects-with-delimiter	cd694ae708e51ba82bf012bba00caf4f3b6393b7	2025-10-09 15:42:19.431386
21	s3-multipart-uploads	8c804d4a566c40cd1e4cc5b3725a664a9303657f	2025-10-09 15:42:19.43672
22	s3-multipart-uploads-big-ints	9737dc258d2397953c9953d9b86920b8be0cdb73	2025-10-09 15:42:19.452032
23	optimize-search-function	9d7e604cddc4b56a5422dc68c9313f4a1b6f132c	2025-10-09 15:42:19.461584
24	operation-function	8312e37c2bf9e76bbe841aa5fda889206d2bf8aa	2025-10-09 15:42:19.46491
25	custom-metadata	d974c6057c3db1c1f847afa0e291e6165693b990	2025-10-09 15:42:19.468033
26	objects-prefixes	ef3f7871121cdc47a65308e6702519e853422ae2	2025-10-09 15:42:19.471387
27	search-v2	33b8f2a7ae53105f028e13e9fcda9dc4f356b4a2	2025-10-09 15:42:19.482913
28	object-bucket-name-sorting	ba85ec41b62c6a30a3f136788227ee47f311c436	2025-10-09 15:42:19.492876
29	create-prefixes	a7b1a22c0dc3ab630e3055bfec7ce7d2045c5b7b	2025-10-09 15:42:19.498397
30	update-object-levels	6c6f6cc9430d570f26284a24cf7b210599032db7	2025-10-09 15:42:19.503831
31	objects-level-index	33f1fef7ec7fea08bb892222f4f0f5d79bab5eb8	2025-10-09 15:42:19.509733
32	backward-compatible-index-on-objects	2d51eeb437a96868b36fcdfb1ddefdf13bef1647	2025-10-09 15:42:19.516456
33	backward-compatible-index-on-prefixes	fe473390e1b8c407434c0e470655945b110507bf	2025-10-09 15:42:19.523186
34	optimize-search-function-v1	82b0e469a00e8ebce495e29bfa70a0797f7ebd2c	2025-10-09 15:42:19.524908
35	add-insert-trigger-prefixes	63bb9fd05deb3dc5e9fa66c83e82b152f0caf589	2025-10-09 15:42:19.530017
36	optimise-existing-functions	81cf92eb0c36612865a18016a38496c530443899	2025-10-09 15:42:19.533644
37	add-bucket-name-length-trigger	3944135b4e3e8b22d6d4cbb568fe3b0b51df15c1	2025-10-09 15:42:19.538768
38	iceberg-catalog-flag-on-buckets	19a8bd89d5dfa69af7f222a46c726b7c41e462c5	2025-10-09 15:42:19.542851
39	add-search-v2-sort-support	39cf7d1e6bf515f4b02e41237aba845a7b492853	2025-10-09 15:42:19.551075
40	fix-prefix-race-conditions-optimized	fd02297e1c67df25a9fc110bf8c8a9af7fb06d1f	2025-10-09 15:42:19.556308
41	add-object-level-update-trigger	44c22478bf01744b2129efc480cd2edc9a7d60e9	2025-10-09 15:42:19.56271
42	rollback-prefix-triggers	f2ab4f526ab7f979541082992593938c05ee4b47	2025-10-09 15:42:19.567129
43	fix-object-level	ab837ad8f1c7d00cc0b7310e989a23388ff29fc6	2025-10-09 15:42:19.572798
44	vector-bucket-type	99c20c0ffd52bb1ff1f32fb992f3b351e3ef8fb3	2025-11-17 19:29:33.504355
45	vector-buckets	049e27196d77a7cb76497a85afae669d8b230953	2025-11-17 19:29:33.545083
46	buckets-objects-grants	fedeb96d60fefd8e02ab3ded9fbde05632f84aed	2025-11-17 19:29:33.645788
47	iceberg-table-metadata	649df56855c24d8b36dd4cc1aeb8251aa9ad42c2	2025-11-17 19:29:33.65249
48	iceberg-catalog-ids	2666dff93346e5d04e0a878416be1d5fec345d6f	2025-11-17 19:29:33.655827
\.


--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.objects (id, bucket_id, name, owner, created_at, updated_at, last_accessed_at, metadata, version, owner_id, user_metadata, level) FROM stdin;
\.


--
-- Data for Name: prefixes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.prefixes (bucket_id, name, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads (id, in_progress_size, upload_signature, bucket_id, key, version, owner_id, created_at, user_metadata) FROM stdin;
\.


--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.s3_multipart_uploads_parts (id, upload_id, size, part_number, bucket_id, key, etag, owner_id, version, created_at) FROM stdin;
\.


--
-- Data for Name: vector_indexes; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--

COPY storage.vector_indexes (id, name, bucket_id, data_type, dimension, distance_metric, metadata_configuration, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--

COPY vault.secrets (id, name, description, secret, key_id, nonce, created_at, updated_at) FROM stdin;
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: Clientes_id_cliente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Clientes_id_cliente_seq"', 510, true);


--
-- Name: Depositos_id_deposito_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Depositos_id_deposito_seq"', 1, false);


--
-- Name: Empleados_id_empleado_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Empleados_id_empleado_seq"', 53, true);


--
-- Name: FacturaDetalles_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FacturaDetalles_id_detalle_seq"', 9, true);


--
-- Name: Facturas_id_factura_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Facturas_id_factura_seq"', 6, true);


--
-- Name: Marcas_id_marca_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Marcas_id_marca_seq"', 5, true);


--
-- Name: Motivos_id_motivo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Motivos_id_motivo_seq"', 3, true);


--
-- Name: PedidoDetalles_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PedidoDetalles_id_detalle_seq"', 15, true);


--
-- Name: PedidosLog_id_log_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PedidosLog_id_log_seq"', 46, true);


--
-- Name: Pedidos_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Pedidos_id_pedido_seq"', 31, true);


--
-- Name: PresupuestoDetalles_id_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."PresupuestoDetalles_id_detalle_seq"', 43, true);


--
-- Name: Presupuestos_id_presupuesto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Presupuestos_id_presupuesto_seq"', 46, true);


--
-- Name: Productos_id_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Productos_id_producto_seq"', 1, false);


--
-- Name: Stock_id_stock_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Stock_id_stock_seq"', 615, true);


--
-- Name: TiposProducto_id_tipo_producto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TiposProducto_id_tipo_producto_seq"', 5, true);


--
-- Name: pedidos_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pedidos_log_id_seq', 29, true);


--
-- Name: subscription_id_seq; Type: SEQUENCE SET; Schema: realtime; Owner: supabase_admin
--

SELECT pg_catalog.setval('realtime.subscription_id_seq', 1, false);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (id);


--
-- Name: identities identities_provider_id_provider_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_provider_id_provider_unique UNIQUE (provider_id, provider);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_last_challenged_at_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_last_challenged_at_key UNIQUE (last_challenged_at);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_code_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_code_key UNIQUE (authorization_code);


--
-- Name: oauth_authorizations oauth_authorizations_authorization_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_authorization_id_key UNIQUE (authorization_id);


--
-- Name: oauth_authorizations oauth_authorizations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_pkey PRIMARY KEY (id);


--
-- Name: oauth_clients oauth_clients_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_clients
    ADD CONSTRAINT oauth_clients_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_pkey PRIMARY KEY (id);


--
-- Name: oauth_consents oauth_consents_user_client_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_client_unique UNIQUE (user_id, client_id);


--
-- Name: one_time_tokens one_time_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: Clientes Clientes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clientes"
    ADD CONSTRAINT "Clientes_email_key" UNIQUE (email);


--
-- Name: Clientes Clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Clientes"
    ADD CONSTRAINT "Clientes_pkey" PRIMARY KEY (id_cliente);


--
-- Name: Depositos Depositos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Depositos"
    ADD CONSTRAINT "Depositos_nombre_key" UNIQUE (nombre);


--
-- Name: Depositos Depositos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Depositos"
    ADD CONSTRAINT "Depositos_pkey" PRIMARY KEY (id_deposito);


--
-- Name: Empleados Empleados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Empleados"
    ADD CONSTRAINT "Empleados_pkey" PRIMARY KEY (id_empleado);


--
-- Name: EstadosPedido EstadosPedido_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EstadosPedido"
    ADD CONSTRAINT "EstadosPedido_nombre_key" UNIQUE (nombre);


--
-- Name: EstadosPedido EstadosPedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EstadosPedido"
    ADD CONSTRAINT "EstadosPedido_pkey" PRIMARY KEY (id_estado);


--
-- Name: EstadosPresupuesto EstadosPresupuesto_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EstadosPresupuesto"
    ADD CONSTRAINT "EstadosPresupuesto_nombre_key" UNIQUE (nombre);


--
-- Name: EstadosPresupuesto EstadosPresupuesto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EstadosPresupuesto"
    ADD CONSTRAINT "EstadosPresupuesto_pkey" PRIMARY KEY (id_estado);


--
-- Name: FacturaDetalles FacturaDetalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FacturaDetalles"
    ADD CONSTRAINT "FacturaDetalles_pkey" PRIMARY KEY (id_detalle);


--
-- Name: Facturas Facturas_numero_factura_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturas"
    ADD CONSTRAINT "Facturas_numero_factura_key" UNIQUE (numero_factura);


--
-- Name: Facturas Facturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturas"
    ADD CONSTRAINT "Facturas_pkey" PRIMARY KEY (id_factura);


--
-- Name: Marcas Marcas_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marcas"
    ADD CONSTRAINT "Marcas_nombre_key" UNIQUE (nombre);


--
-- Name: Marcas Marcas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Marcas"
    ADD CONSTRAINT "Marcas_pkey" PRIMARY KEY (id_marca);


--
-- Name: Motivos Motivos_descripcion_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Motivos"
    ADD CONSTRAINT "Motivos_descripcion_key" UNIQUE (descripcion);


--
-- Name: Motivos Motivos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Motivos"
    ADD CONSTRAINT "Motivos_pkey" PRIMARY KEY (id_motivo);


--
-- Name: PedidoDetalles PedidoDetalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PedidoDetalles"
    ADD CONSTRAINT "PedidoDetalles_pkey" PRIMARY KEY (id_detalle);


--
-- Name: PedidosLog PedidosLog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PedidosLog"
    ADD CONSTRAINT "PedidosLog_pkey" PRIMARY KEY (id_log);


--
-- Name: Pedidos Pedidos_id_presupuesto_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedidos"
    ADD CONSTRAINT "Pedidos_id_presupuesto_key" UNIQUE (id_presupuesto);


--
-- Name: Pedidos Pedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedidos"
    ADD CONSTRAINT "Pedidos_pkey" PRIMARY KEY (id_pedido);


--
-- Name: PresupuestoDetalles PresupuestoDetalles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PresupuestoDetalles"
    ADD CONSTRAINT "PresupuestoDetalles_pkey" PRIMARY KEY (id_detalle);


--
-- Name: Presupuestos Presupuestos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Presupuestos"
    ADD CONSTRAINT "Presupuestos_pkey" PRIMARY KEY (id_presupuesto);


--
-- Name: Productos Productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Productos"
    ADD CONSTRAINT "Productos_pkey" PRIMARY KEY (id_producto);


--
-- Name: Stock Stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Stock"
    ADD CONSTRAINT "Stock_pkey" PRIMARY KEY (id_stock);


--
-- Name: TiposProducto TiposProducto_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TiposProducto"
    ADD CONSTRAINT "TiposProducto_nombre_key" UNIQUE (nombre);


--
-- Name: TiposProducto TiposProducto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TiposProducto"
    ADD CONSTRAINT "TiposProducto_pkey" PRIMARY KEY (id_tipo_producto);


--
-- Name: pedidos_log pedidos_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pedidos_log
    ADD CONSTRAINT pedidos_log_pkey PRIMARY KEY (id);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE ONLY realtime.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id, inserted_at);


--
-- Name: subscription pk_subscription; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.subscription
    ADD CONSTRAINT pk_subscription PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: realtime; Owner: supabase_admin
--

ALTER TABLE ONLY realtime.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: buckets_analytics buckets_analytics_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_analytics
    ADD CONSTRAINT buckets_analytics_pkey PRIMARY KEY (id);


--
-- Name: buckets buckets_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets
    ADD CONSTRAINT buckets_pkey PRIMARY KEY (id);


--
-- Name: buckets_vectors buckets_vectors_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.buckets_vectors
    ADD CONSTRAINT buckets_vectors_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_name_key; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: objects objects_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT objects_pkey PRIMARY KEY (id);


--
-- Name: prefixes prefixes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT prefixes_pkey PRIMARY KEY (bucket_id, level, name);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_pkey PRIMARY KEY (id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_pkey PRIMARY KEY (id);


--
-- Name: vector_indexes vector_indexes_pkey; Type: CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: mfa_factors_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_factors_user_id_idx ON auth.mfa_factors USING btree (user_id);


--
-- Name: oauth_auth_pending_exp_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_auth_pending_exp_idx ON auth.oauth_authorizations USING btree (expires_at) WHERE (status = 'pending'::auth.oauth_authorization_status);


--
-- Name: oauth_clients_deleted_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_clients_deleted_at_idx ON auth.oauth_clients USING btree (deleted_at);


--
-- Name: oauth_consents_active_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_client_idx ON auth.oauth_consents USING btree (client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_active_user_client_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_active_user_client_idx ON auth.oauth_consents USING btree (user_id, client_id) WHERE (revoked_at IS NULL);


--
-- Name: oauth_consents_user_order_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX oauth_consents_user_order_idx ON auth.oauth_consents USING btree (user_id, granted_at DESC);


--
-- Name: one_time_tokens_relates_to_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_relates_to_hash_idx ON auth.one_time_tokens USING hash (relates_to);


--
-- Name: one_time_tokens_token_hash_hash_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX one_time_tokens_token_hash_hash_idx ON auth.one_time_tokens USING hash (token_hash);


--
-- Name: one_time_tokens_user_id_token_type_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX one_time_tokens_user_id_token_type_key ON auth.one_time_tokens USING btree (user_id, token_type);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_oauth_client_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_oauth_client_id_idx ON auth.sessions USING btree (oauth_client_id);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: sso_providers_resource_id_pattern_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_providers_resource_id_pattern_idx ON auth.sso_providers USING btree (resource_id text_pattern_ops);


--
-- Name: unique_phone_factor_per_user; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX unique_phone_factor_per_user ON auth.mfa_factors USING btree (user_id, phone);


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: users_is_anonymous_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_is_anonymous_idx ON auth.users USING btree (is_anonymous);


--
-- Name: uq_producto_deposito; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX uq_producto_deposito ON public."Stock" USING btree (id_producto, id_deposito);


--
-- Name: ix_realtime_subscription_entity; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE INDEX ix_realtime_subscription_entity ON realtime.subscription USING btree (entity);


--
-- Name: messages_inserted_at_topic_index; Type: INDEX; Schema: realtime; Owner: supabase_realtime_admin
--

CREATE INDEX messages_inserted_at_topic_index ON ONLY realtime.messages USING btree (inserted_at DESC, topic) WHERE ((extension = 'broadcast'::text) AND (private IS TRUE));


--
-- Name: subscription_subscription_id_entity_filters_key; Type: INDEX; Schema: realtime; Owner: supabase_admin
--

CREATE UNIQUE INDEX subscription_subscription_id_entity_filters_key ON realtime.subscription USING btree (subscription_id, entity, filters);


--
-- Name: bname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bname ON storage.buckets USING btree (name);


--
-- Name: bucketid_objname; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX bucketid_objname ON storage.objects USING btree (bucket_id, name);


--
-- Name: buckets_analytics_unique_name_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX buckets_analytics_unique_name_idx ON storage.buckets_analytics USING btree (name) WHERE (deleted_at IS NULL);


--
-- Name: idx_multipart_uploads_list; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_multipart_uploads_list ON storage.s3_multipart_uploads USING btree (bucket_id, key, created_at);


--
-- Name: idx_name_bucket_level_unique; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX idx_name_bucket_level_unique ON storage.objects USING btree (name COLLATE "C", bucket_id, level);


--
-- Name: idx_objects_bucket_id_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_bucket_id_name ON storage.objects USING btree (bucket_id, name COLLATE "C");


--
-- Name: idx_objects_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_objects_lower_name ON storage.objects USING btree ((path_tokens[level]), lower(name) text_pattern_ops, bucket_id, level);


--
-- Name: idx_prefixes_lower_name; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX idx_prefixes_lower_name ON storage.prefixes USING btree (bucket_id, level, ((string_to_array(name, '/'::text))[level]), lower(name) text_pattern_ops);


--
-- Name: name_prefix_search; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE INDEX name_prefix_search ON storage.objects USING btree (name text_pattern_ops);


--
-- Name: objects_bucket_id_level_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX objects_bucket_id_level_idx ON storage.objects USING btree (bucket_id, level, name COLLATE "C");


--
-- Name: vector_indexes_name_bucket_id_idx; Type: INDEX; Schema: storage; Owner: supabase_storage_admin
--

CREATE UNIQUE INDEX vector_indexes_name_bucket_id_idx ON storage.vector_indexes USING btree (name, bucket_id);


--
-- Name: Pedidos actualizar_stock_confirmacion; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizar_stock_confirmacion AFTER UPDATE ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.fn_actualizar_stock_confirmacion();


--
-- Name: Pedidos log_all_pedidos; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER log_all_pedidos AFTER INSERT OR DELETE OR UPDATE ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.log_pedidos();


--
-- Name: Pedidos trg_actualizar_presupuesto_pedido_anulado; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_actualizar_presupuesto_pedido_anulado AFTER UPDATE ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.actualizar_presupuesto_pedido_anulado();


--
-- Name: Pedidos trg_actualizar_stock_confirmacion; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_actualizar_stock_confirmacion AFTER UPDATE ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.fn_actualizar_stock_confirmacion();


--
-- Name: Facturas trg_descontar_stock_factura; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_descontar_stock_factura AFTER INSERT ON public."Facturas" FOR EACH ROW EXECUTE FUNCTION public.descontar_stock_factura();


--
-- Name: Presupuestos trg_generar_pedido_desde_presupuesto; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_generar_pedido_desde_presupuesto AFTER UPDATE ON public."Presupuestos" FOR EACH ROW EXECUTE FUNCTION public.generar_pedido_desde_presupuesto();


--
-- Name: Pedidos trg_pedidos_allops_del; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_pedidos_allops_del AFTER DELETE ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.fn_log_pedidos_allops();


--
-- Name: Pedidos trg_pedidos_allops_ins; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_pedidos_allops_ins AFTER INSERT ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.fn_log_pedidos_allops();


--
-- Name: Pedidos trg_pedidos_allops_upd; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_pedidos_allops_upd AFTER UPDATE ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.fn_log_pedidos_allops();


--
-- Name: Pedidos trg_pedidos_insert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_pedidos_insert AFTER INSERT ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.fn_log_pedidos_insert();


--
-- Name: Pedidos trg_prevenir_eliminacion_pedido; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_prevenir_eliminacion_pedido BEFORE DELETE ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.prevenir_eliminacion_pedido();


--
-- Name: Presupuestos trg_prevenir_eliminacion_presupuesto; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_prevenir_eliminacion_presupuesto BEFORE DELETE ON public."Presupuestos" FOR EACH ROW EXECUTE FUNCTION public.prevenir_eliminacion_presupuesto();


--
-- Name: Facturas trg_revertir_stock_factura_anulada; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_revertir_stock_factura_anulada AFTER UPDATE ON public."Facturas" FOR EACH ROW EXECUTE FUNCTION public.revertir_stock_factura_anulada();


--
-- Name: Presupuestos trg_validar_modificacion_presupuesto; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_validar_modificacion_presupuesto BEFORE UPDATE ON public."Presupuestos" FOR EACH ROW EXECUTE FUNCTION public.validar_modificacion_presupuesto();


--
-- Name: Presupuestos trg_validar_motivo_presupuesto; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_validar_motivo_presupuesto BEFORE INSERT OR UPDATE ON public."Presupuestos" FOR EACH ROW EXECUTE FUNCTION public.validar_motivo_presupuesto();


--
-- Name: Pedidos trg_validar_pedido_modificacion; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_validar_pedido_modificacion BEFORE UPDATE ON public."Pedidos" FOR EACH ROW EXECUTE FUNCTION public.validar_pedido_modificacion();


--
-- Name: Stock trg_validar_stock_no_negativo; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_validar_stock_no_negativo BEFORE UPDATE ON public."Stock" FOR EACH ROW EXECUTE FUNCTION public.validar_stock_no_negativo();


--
-- Name: subscription tr_check_filters; Type: TRIGGER; Schema: realtime; Owner: supabase_admin
--

CREATE TRIGGER tr_check_filters BEFORE INSERT OR UPDATE ON realtime.subscription FOR EACH ROW EXECUTE FUNCTION realtime.subscription_check_filters();


--
-- Name: buckets enforce_bucket_name_length_trigger; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER enforce_bucket_name_length_trigger BEFORE INSERT OR UPDATE OF name ON storage.buckets FOR EACH ROW EXECUTE FUNCTION storage.enforce_bucket_name_length();


--
-- Name: objects objects_delete_delete_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_delete_delete_prefix AFTER DELETE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects objects_insert_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_insert_create_prefix BEFORE INSERT ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.objects_insert_prefix_trigger();


--
-- Name: objects objects_update_create_prefix; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER objects_update_create_prefix BEFORE UPDATE ON storage.objects FOR EACH ROW WHEN (((new.name <> old.name) OR (new.bucket_id <> old.bucket_id))) EXECUTE FUNCTION storage.objects_update_prefix_trigger();


--
-- Name: prefixes prefixes_create_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_create_hierarchy BEFORE INSERT ON storage.prefixes FOR EACH ROW WHEN ((pg_trigger_depth() < 1)) EXECUTE FUNCTION storage.prefixes_insert_trigger();


--
-- Name: prefixes prefixes_delete_hierarchy; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER prefixes_delete_hierarchy AFTER DELETE ON storage.prefixes FOR EACH ROW EXECUTE FUNCTION storage.delete_prefix_hierarchy_trigger();


--
-- Name: objects update_objects_updated_at; Type: TRIGGER; Schema: storage; Owner: supabase_storage_admin
--

CREATE TRIGGER update_objects_updated_at BEFORE UPDATE ON storage.objects FOR EACH ROW EXECUTE FUNCTION storage.update_updated_at_column();


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_authorizations oauth_authorizations_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_authorizations
    ADD CONSTRAINT oauth_authorizations_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_client_id_fkey FOREIGN KEY (client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: oauth_consents oauth_consents_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.oauth_consents
    ADD CONSTRAINT oauth_consents_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: one_time_tokens one_time_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.one_time_tokens
    ADD CONSTRAINT one_time_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_flow_state_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_flow_state_id_fkey FOREIGN KEY (flow_state_id) REFERENCES auth.flow_state(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_oauth_client_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_oauth_client_id_fkey FOREIGN KEY (oauth_client_id) REFERENCES auth.oauth_clients(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: FacturaDetalles fk_detalle_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FacturaDetalles"
    ADD CONSTRAINT fk_detalle_factura FOREIGN KEY (id_factura) REFERENCES public."Facturas"(id_factura) ON DELETE CASCADE;


--
-- Name: PedidoDetalles fk_detalle_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PedidoDetalles"
    ADD CONSTRAINT fk_detalle_pedido FOREIGN KEY (id_pedido) REFERENCES public."Pedidos"(id_pedido) ON DELETE CASCADE;


--
-- Name: PresupuestoDetalles fk_detalle_presupuesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PresupuestoDetalles"
    ADD CONSTRAINT fk_detalle_presupuesto FOREIGN KEY (id_presupuesto) REFERENCES public."Presupuestos"(id_presupuesto) ON DELETE CASCADE;


--
-- Name: PresupuestoDetalles fk_detalle_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PresupuestoDetalles"
    ADD CONSTRAINT fk_detalle_producto FOREIGN KEY (id_producto) REFERENCES public."Productos"(id_producto);


--
-- Name: FacturaDetalles fk_detalle_producto_factura; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FacturaDetalles"
    ADD CONSTRAINT fk_detalle_producto_factura FOREIGN KEY (id_producto) REFERENCES public."Productos"(id_producto);


--
-- Name: PedidoDetalles fk_detalle_producto_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PedidoDetalles"
    ADD CONSTRAINT fk_detalle_producto_pedido FOREIGN KEY (id_producto) REFERENCES public."Productos"(id_producto);


--
-- Name: Facturas fk_factura_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Facturas"
    ADD CONSTRAINT fk_factura_pedido FOREIGN KEY (id_pedido) REFERENCES public."Pedidos"(id_pedido);


--
-- Name: Pedidos fk_pedido_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedidos"
    ADD CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES public."Clientes"(id_cliente);


--
-- Name: Pedidos fk_pedido_deposito; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedidos"
    ADD CONSTRAINT fk_pedido_deposito FOREIGN KEY (id_deposito_origen) REFERENCES public."Depositos"(id_deposito);


--
-- Name: Pedidos fk_pedido_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedidos"
    ADD CONSTRAINT fk_pedido_estado FOREIGN KEY (id_estado) REFERENCES public."EstadosPedido"(id_estado);


--
-- Name: Pedidos fk_pedido_motivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedidos"
    ADD CONSTRAINT fk_pedido_motivo FOREIGN KEY (id_motivo) REFERENCES public."Motivos"(id_motivo);


--
-- Name: Pedidos fk_pedido_presupuesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Pedidos"
    ADD CONSTRAINT fk_pedido_presupuesto FOREIGN KEY (id_presupuesto) REFERENCES public."Presupuestos"(id_presupuesto);


--
-- Name: Presupuestos fk_presupuesto_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Presupuestos"
    ADD CONSTRAINT fk_presupuesto_cliente FOREIGN KEY (id_cliente) REFERENCES public."Clientes"(id_cliente);


--
-- Name: Presupuestos fk_presupuesto_empleado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Presupuestos"
    ADD CONSTRAINT fk_presupuesto_empleado FOREIGN KEY (id_empleado) REFERENCES public."Empleados"(id_empleado);


--
-- Name: Presupuestos fk_presupuesto_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Presupuestos"
    ADD CONSTRAINT fk_presupuesto_estado FOREIGN KEY (id_estado) REFERENCES public."EstadosPresupuesto"(id_estado);


--
-- Name: Presupuestos fk_presupuesto_motivo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Presupuestos"
    ADD CONSTRAINT fk_presupuesto_motivo FOREIGN KEY (id_motivo) REFERENCES public."Motivos"(id_motivo);


--
-- Name: Productos fk_producto_marca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Productos"
    ADD CONSTRAINT fk_producto_marca FOREIGN KEY (id_marca) REFERENCES public."Marcas"(id_marca);


--
-- Name: Productos fk_producto_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Productos"
    ADD CONSTRAINT fk_producto_tipo FOREIGN KEY (id_tipo_producto) REFERENCES public."TiposProducto"(id_tipo_producto);


--
-- Name: Stock fk_stock_deposito; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Stock"
    ADD CONSTRAINT fk_stock_deposito FOREIGN KEY (id_deposito) REFERENCES public."Depositos"(id_deposito);


--
-- Name: Stock fk_stock_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Stock"
    ADD CONSTRAINT fk_stock_producto FOREIGN KEY (id_producto) REFERENCES public."Productos"(id_producto);


--
-- Name: objects objects_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.objects
    ADD CONSTRAINT "objects_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: prefixes prefixes_bucketId_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.prefixes
    ADD CONSTRAINT "prefixes_bucketId_fkey" FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads s3_multipart_uploads_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads
    ADD CONSTRAINT s3_multipart_uploads_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets(id);


--
-- Name: s3_multipart_uploads_parts s3_multipart_uploads_parts_upload_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.s3_multipart_uploads_parts
    ADD CONSTRAINT s3_multipart_uploads_parts_upload_id_fkey FOREIGN KEY (upload_id) REFERENCES storage.s3_multipart_uploads(id) ON DELETE CASCADE;


--
-- Name: vector_indexes vector_indexes_bucket_id_fkey; Type: FK CONSTRAINT; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE ONLY storage.vector_indexes
    ADD CONSTRAINT vector_indexes_bucket_id_fkey FOREIGN KEY (bucket_id) REFERENCES storage.buckets_vectors(id);


--
-- Name: audit_log_entries; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.audit_log_entries ENABLE ROW LEVEL SECURITY;

--
-- Name: flow_state; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.flow_state ENABLE ROW LEVEL SECURITY;

--
-- Name: identities; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.identities ENABLE ROW LEVEL SECURITY;

--
-- Name: instances; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.instances ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_amr_claims; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_amr_claims ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_challenges; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_challenges ENABLE ROW LEVEL SECURITY;

--
-- Name: mfa_factors; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.mfa_factors ENABLE ROW LEVEL SECURITY;

--
-- Name: one_time_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.one_time_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: refresh_tokens; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.refresh_tokens ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: saml_relay_states; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.saml_relay_states ENABLE ROW LEVEL SECURITY;

--
-- Name: schema_migrations; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.schema_migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: sessions; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sessions ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_domains; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_domains ENABLE ROW LEVEL SECURITY;

--
-- Name: sso_providers; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.sso_providers ENABLE ROW LEVEL SECURITY;

--
-- Name: users; Type: ROW SECURITY; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE auth.users ENABLE ROW LEVEL SECURITY;

--
-- Name: Clientes; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public."Clientes" ENABLE ROW LEVEL SECURITY;

--
-- Name: Depositos; Type: ROW SECURITY; Schema: public; Owner: postgres
--

ALTER TABLE public."Depositos" ENABLE ROW LEVEL SECURITY;

--
-- Name: messages; Type: ROW SECURITY; Schema: realtime; Owner: supabase_realtime_admin
--

ALTER TABLE realtime.messages ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_analytics; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_analytics ENABLE ROW LEVEL SECURITY;

--
-- Name: buckets_vectors; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.buckets_vectors ENABLE ROW LEVEL SECURITY;

--
-- Name: migrations; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.migrations ENABLE ROW LEVEL SECURITY;

--
-- Name: objects; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.objects ENABLE ROW LEVEL SECURITY;

--
-- Name: prefixes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.prefixes ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads ENABLE ROW LEVEL SECURITY;

--
-- Name: s3_multipart_uploads_parts; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.s3_multipart_uploads_parts ENABLE ROW LEVEL SECURITY;

--
-- Name: vector_indexes; Type: ROW SECURITY; Schema: storage; Owner: supabase_storage_admin
--

ALTER TABLE storage.vector_indexes ENABLE ROW LEVEL SECURITY;

-- --
-- -- Name: supabase_realtime; Type: PUBLICATION; Schema: -; Owner: postgres
-- --

-- CREATE PUBLICATION supabase_realtime WITH (publish = 'insert, update, delete, truncate');


-- ALTER PUBLICATION supabase_realtime OWNER TO postgres;

-- --
-- -- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
-- --

-- GRANT USAGE ON SCHEMA auth TO anon;
-- GRANT USAGE ON SCHEMA auth TO authenticated;
-- GRANT USAGE ON SCHEMA auth TO service_role;
-- GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
-- GRANT ALL ON SCHEMA auth TO dashboard_user;
-- GRANT USAGE ON SCHEMA auth TO postgres;


-- --
-- -- Name: SCHEMA extensions; Type: ACL; Schema: -; Owner: postgres
-- --

-- GRANT USAGE ON SCHEMA extensions TO anon;
-- GRANT USAGE ON SCHEMA extensions TO authenticated;
-- GRANT USAGE ON SCHEMA extensions TO service_role;
-- GRANT ALL ON SCHEMA extensions TO dashboard_user;


-- --
-- -- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
-- --

-- REVOKE USAGE ON SCHEMA public FROM PUBLIC;
-- GRANT USAGE ON SCHEMA public TO postgres;
-- GRANT USAGE ON SCHEMA public TO anon;
-- GRANT USAGE ON SCHEMA public TO authenticated;
-- GRANT USAGE ON SCHEMA public TO service_role;
-- GRANT USAGE ON SCHEMA public TO ventas;
-- GRANT USAGE ON SCHEMA public TO deposito;


-- --
-- -- Name: SCHEMA realtime; Type: ACL; Schema: -; Owner: supabase_admin
-- --

-- GRANT USAGE ON SCHEMA realtime TO postgres;
-- GRANT USAGE ON SCHEMA realtime TO anon;
-- GRANT USAGE ON SCHEMA realtime TO authenticated;
-- GRANT USAGE ON SCHEMA realtime TO service_role;
-- GRANT ALL ON SCHEMA realtime TO supabase_realtime_admin;


-- --
-- -- Name: SCHEMA storage; Type: ACL; Schema: -; Owner: supabase_admin
-- --

-- GRANT USAGE ON SCHEMA storage TO postgres WITH GRANT OPTION;
-- GRANT USAGE ON SCHEMA storage TO anon;
-- GRANT USAGE ON SCHEMA storage TO authenticated;
-- GRANT USAGE ON SCHEMA storage TO service_role;
-- GRANT ALL ON SCHEMA storage TO supabase_storage_admin;
-- GRANT ALL ON SCHEMA storage TO dashboard_user;


-- --
-- -- Name: SCHEMA vault; Type: ACL; Schema: -; Owner: supabase_admin
-- --

-- GRANT USAGE ON SCHEMA vault TO postgres WITH GRANT OPTION;
-- GRANT USAGE ON SCHEMA vault TO service_role;


-- --
-- -- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


-- --
-- -- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON FUNCTION auth.jwt() TO postgres;
-- GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


-- --
-- -- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


-- --
-- -- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


-- --
-- -- Name: FUNCTION armor(bytea); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.armor(bytea) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.armor(bytea) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.armor(bytea) TO dashboard_user;


-- --
-- -- Name: FUNCTION armor(bytea, text[], text[]); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.armor(bytea, text[], text[]) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.armor(bytea, text[], text[]) TO dashboard_user;


-- --
-- -- Name: FUNCTION crypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.crypt(text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.crypt(text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.crypt(text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION dearmor(text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.dearmor(text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.dearmor(text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.dearmor(text) TO dashboard_user;


-- --
-- -- Name: FUNCTION decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.decrypt(bytea, bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION decrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.decrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION digest(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.digest(bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.digest(bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION digest(text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.digest(text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.digest(text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.digest(text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION encrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.encrypt(bytea, bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION encrypt_iv(bytea, bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.encrypt_iv(bytea, bytea, bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION gen_random_bytes(integer); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.gen_random_bytes(integer) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.gen_random_bytes(integer) TO dashboard_user;


-- --
-- -- Name: FUNCTION gen_random_uuid(); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.gen_random_uuid() FROM postgres;
-- GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.gen_random_uuid() TO dashboard_user;


-- --
-- -- Name: FUNCTION gen_salt(text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.gen_salt(text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.gen_salt(text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.gen_salt(text) TO dashboard_user;


-- --
-- -- Name: FUNCTION gen_salt(text, integer); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.gen_salt(text, integer) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.gen_salt(text, integer) TO dashboard_user;


-- --
-- -- Name: FUNCTION grant_pg_cron_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
-- --

-- REVOKE ALL ON FUNCTION extensions.grant_pg_cron_access() FROM supabase_admin;
-- GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO supabase_admin WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.grant_pg_cron_access() TO dashboard_user;


-- --
-- -- Name: FUNCTION grant_pg_graphql_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION extensions.grant_pg_graphql_access() TO postgres WITH GRANT OPTION;


-- --
-- -- Name: FUNCTION grant_pg_net_access(); Type: ACL; Schema: extensions; Owner: supabase_admin
-- --

-- REVOKE ALL ON FUNCTION extensions.grant_pg_net_access() FROM supabase_admin;
-- GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO supabase_admin WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.grant_pg_net_access() TO dashboard_user;


-- --
-- -- Name: FUNCTION hmac(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.hmac(bytea, bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.hmac(bytea, bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION hmac(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.hmac(text, text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.hmac(text, text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pg_stat_statements(showtext boolean, OUT userid oid, OUT dbid oid, OUT toplevel boolean, OUT queryid bigint, OUT query text, OUT plans bigint, OUT total_plan_time double precision, OUT min_plan_time double precision, OUT max_plan_time double precision, OUT mean_plan_time double precision, OUT stddev_plan_time double precision, OUT calls bigint, OUT total_exec_time double precision, OUT min_exec_time double precision, OUT max_exec_time double precision, OUT mean_exec_time double precision, OUT stddev_exec_time double precision, OUT rows bigint, OUT shared_blks_hit bigint, OUT shared_blks_read bigint, OUT shared_blks_dirtied bigint, OUT shared_blks_written bigint, OUT local_blks_hit bigint, OUT local_blks_read bigint, OUT local_blks_dirtied bigint, OUT local_blks_written bigint, OUT temp_blks_read bigint, OUT temp_blks_written bigint, OUT shared_blk_read_time double precision, OUT shared_blk_write_time double precision, OUT local_blk_read_time double precision, OUT local_blk_write_time double precision, OUT temp_blk_read_time double precision, OUT temp_blk_write_time double precision, OUT wal_records bigint, OUT wal_fpi bigint, OUT wal_bytes numeric, OUT jit_functions bigint, OUT jit_generation_time double precision, OUT jit_inlining_count bigint, OUT jit_inlining_time double precision, OUT jit_optimization_count bigint, OUT jit_optimization_time double precision, OUT jit_emission_count bigint, OUT jit_emission_time double precision, OUT jit_deform_count bigint, OUT jit_deform_time double precision, OUT stats_since timestamp with time zone, OUT minmax_stats_since timestamp with time zone) TO dashboard_user;


-- --
-- -- Name: FUNCTION pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pg_stat_statements_info(OUT dealloc bigint, OUT stats_reset timestamp with time zone) TO dashboard_user;


-- --
-- -- Name: FUNCTION pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pg_stat_statements_reset(userid oid, dbid oid, queryid bigint, minmax_only boolean) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_armor_headers(text, OUT key text, OUT value text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_armor_headers(text, OUT key text, OUT value text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_key_id(bytea); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_key_id(bytea) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_key_id(bytea) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_decrypt(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_decrypt(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt(bytea, bytea, text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_decrypt_bytea(bytea, bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_decrypt_bytea(bytea, bytea, text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_encrypt(text, bytea); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_encrypt(text, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt(text, bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_pub_encrypt_bytea(bytea, bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_pub_encrypt_bytea(bytea, bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_sym_decrypt(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_sym_decrypt(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt(bytea, text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_sym_decrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_decrypt_bytea(bytea, text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_sym_encrypt(text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_sym_encrypt(text, text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt(text, text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgp_sym_encrypt_bytea(bytea, text, text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.pgp_sym_encrypt_bytea(bytea, text, text) TO dashboard_user;


-- --
-- -- Name: FUNCTION pgrst_ddl_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION extensions.pgrst_ddl_watch() TO postgres WITH GRANT OPTION;


-- --
-- -- Name: FUNCTION pgrst_drop_watch(); Type: ACL; Schema: extensions; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION extensions.pgrst_drop_watch() TO postgres WITH GRANT OPTION;


-- --
-- -- Name: FUNCTION set_graphql_placeholder(); Type: ACL; Schema: extensions; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION extensions.set_graphql_placeholder() TO postgres WITH GRANT OPTION;


-- --
-- -- Name: FUNCTION uuid_generate_v1(); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_generate_v1() FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v1() TO dashboard_user;


-- --
-- -- Name: FUNCTION uuid_generate_v1mc(); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_generate_v1mc() FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v1mc() TO dashboard_user;


-- --
-- -- Name: FUNCTION uuid_generate_v3(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v3(namespace uuid, name text) TO dashboard_user;


-- --
-- -- Name: FUNCTION uuid_generate_v4(); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_generate_v4() FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v4() TO dashboard_user;


-- --
-- -- Name: FUNCTION uuid_generate_v5(namespace uuid, name text); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_generate_v5(namespace uuid, name text) TO dashboard_user;


-- --
-- -- Name: FUNCTION uuid_nil(); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_nil() FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_nil() TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_nil() TO dashboard_user;


-- --
-- -- Name: FUNCTION uuid_ns_dns(); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_ns_dns() FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_ns_dns() TO dashboard_user;


-- --
-- -- Name: FUNCTION uuid_ns_oid(); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_ns_oid() FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_ns_oid() TO dashboard_user;


-- --
-- -- Name: FUNCTION uuid_ns_url(); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_ns_url() FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_ns_url() TO dashboard_user;


-- --
-- -- Name: FUNCTION uuid_ns_x500(); Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON FUNCTION extensions.uuid_ns_x500() FROM postgres;
-- GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION extensions.uuid_ns_x500() TO dashboard_user;


-- --
-- -- Name: FUNCTION graphql("operationName" text, query text, variables jsonb, extensions jsonb); Type: ACL; Schema: graphql_public; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO postgres;
-- GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO anon;
-- GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO authenticated;
-- GRANT ALL ON FUNCTION graphql_public.graphql("operationName" text, query text, variables jsonb, extensions jsonb) TO service_role;


-- --
-- -- Name: FUNCTION get_auth(p_usename text); Type: ACL; Schema: pgbouncer; Owner: supabase_admin
-- --

-- REVOKE ALL ON FUNCTION pgbouncer.get_auth(p_usename text) FROM PUBLIC;
-- GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO pgbouncer;
-- GRANT ALL ON FUNCTION pgbouncer.get_auth(p_usename text) TO postgres;


-- --
-- -- Name: FUNCTION actualizar_presupuesto_pedido_anulado(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.actualizar_presupuesto_pedido_anulado() TO anon;
-- GRANT ALL ON FUNCTION public.actualizar_presupuesto_pedido_anulado() TO authenticated;
-- GRANT ALL ON FUNCTION public.actualizar_presupuesto_pedido_anulado() TO service_role;


-- --
-- -- Name: FUNCTION descontar_stock_factura(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.descontar_stock_factura() TO anon;
-- GRANT ALL ON FUNCTION public.descontar_stock_factura() TO authenticated;
-- GRANT ALL ON FUNCTION public.descontar_stock_factura() TO service_role;


-- --
-- -- Name: FUNCTION fn_actualizar_stock_confirmacion(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.fn_actualizar_stock_confirmacion() TO anon;
-- GRANT ALL ON FUNCTION public.fn_actualizar_stock_confirmacion() TO authenticated;
-- GRANT ALL ON FUNCTION public.fn_actualizar_stock_confirmacion() TO service_role;


-- --
-- -- Name: FUNCTION fn_log_pedidos_allops(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.fn_log_pedidos_allops() TO anon;
-- GRANT ALL ON FUNCTION public.fn_log_pedidos_allops() TO authenticated;
-- GRANT ALL ON FUNCTION public.fn_log_pedidos_allops() TO service_role;


-- --
-- -- Name: FUNCTION fn_log_pedidos_insert(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.fn_log_pedidos_insert() TO anon;
-- GRANT ALL ON FUNCTION public.fn_log_pedidos_insert() TO authenticated;
-- GRANT ALL ON FUNCTION public.fn_log_pedidos_insert() TO service_role;


-- --
-- -- Name: FUNCTION generar_pedido_desde_presupuesto(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.generar_pedido_desde_presupuesto() TO anon;
-- GRANT ALL ON FUNCTION public.generar_pedido_desde_presupuesto() TO authenticated;
-- GRANT ALL ON FUNCTION public.generar_pedido_desde_presupuesto() TO service_role;


-- --
-- -- Name: FUNCTION log_pedidos(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.log_pedidos() TO anon;
-- GRANT ALL ON FUNCTION public.log_pedidos() TO authenticated;
-- GRANT ALL ON FUNCTION public.log_pedidos() TO service_role;


-- --
-- -- Name: FUNCTION prevenir_eliminacion_pedido(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.prevenir_eliminacion_pedido() TO anon;
-- GRANT ALL ON FUNCTION public.prevenir_eliminacion_pedido() TO authenticated;
-- GRANT ALL ON FUNCTION public.prevenir_eliminacion_pedido() TO service_role;


-- --
-- -- Name: FUNCTION prevenir_eliminacion_presupuesto(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.prevenir_eliminacion_presupuesto() TO anon;
-- GRANT ALL ON FUNCTION public.prevenir_eliminacion_presupuesto() TO authenticated;
-- GRANT ALL ON FUNCTION public.prevenir_eliminacion_presupuesto() TO service_role;


-- --
-- -- Name: FUNCTION productos_no_pedidos(fecha_inicio date, fecha_fin date); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.productos_no_pedidos(fecha_inicio date, fecha_fin date) TO anon;
-- GRANT ALL ON FUNCTION public.productos_no_pedidos(fecha_inicio date, fecha_fin date) TO authenticated;
-- GRANT ALL ON FUNCTION public.productos_no_pedidos(fecha_inicio date, fecha_fin date) TO service_role;


-- --
-- -- Name: FUNCTION revertir_stock_factura_anulada(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.revertir_stock_factura_anulada() TO anon;
-- GRANT ALL ON FUNCTION public.revertir_stock_factura_anulada() TO authenticated;
-- GRANT ALL ON FUNCTION public.revertir_stock_factura_anulada() TO service_role;


-- --
-- -- Name: FUNCTION sp_agregar_presupuesto_cabecera(p_id_cliente integer, p_id_emplpeado integer, p_forma_pago text, p_id_estado integer, p_id_motivo integer, p_importe_total numeric); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_agregar_presupuesto_cabecera(p_id_cliente integer, p_id_emplpeado integer, p_forma_pago text, p_id_estado integer, p_id_motivo integer, p_importe_total numeric) TO anon;
-- GRANT ALL ON FUNCTION public.sp_agregar_presupuesto_cabecera(p_id_cliente integer, p_id_emplpeado integer, p_forma_pago text, p_id_estado integer, p_id_motivo integer, p_importe_total numeric) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_agregar_presupuesto_cabecera(p_id_cliente integer, p_id_emplpeado integer, p_forma_pago text, p_id_estado integer, p_id_motivo integer, p_importe_total numeric) TO service_role;


-- --
-- -- Name: FUNCTION sp_agregar_presupuesto_linea(p_id_presupuesto integer, p_id_producto integer, p_cantidad integer); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_agregar_presupuesto_linea(p_id_presupuesto integer, p_id_producto integer, p_cantidad integer) TO anon;
-- GRANT ALL ON FUNCTION public.sp_agregar_presupuesto_linea(p_id_presupuesto integer, p_id_producto integer, p_cantidad integer) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_agregar_presupuesto_linea(p_id_presupuesto integer, p_id_producto integer, p_cantidad integer) TO service_role;


-- --
-- -- Name: FUNCTION sp_anular_factura(p_id_factura integer); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_anular_factura(p_id_factura integer) TO anon;
-- GRANT ALL ON FUNCTION public.sp_anular_factura(p_id_factura integer) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_anular_factura(p_id_factura integer) TO service_role;


-- --
-- -- Name: FUNCTION sp_anular_o_confirmar_pedido(pedido_id integer, accion text); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_anular_o_confirmar_pedido(pedido_id integer, accion text) TO anon;
-- GRANT ALL ON FUNCTION public.sp_anular_o_confirmar_pedido(pedido_id integer, accion text) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_anular_o_confirmar_pedido(pedido_id integer, accion text) TO service_role;


-- --
-- -- Name: FUNCTION sp_anular_o_confirmar_pedido(p_accion text, p_id_pedido integer); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_anular_o_confirmar_pedido(p_accion text, p_id_pedido integer) TO anon;
-- GRANT ALL ON FUNCTION public.sp_anular_o_confirmar_pedido(p_accion text, p_id_pedido integer) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_anular_o_confirmar_pedido(p_accion text, p_id_pedido integer) TO service_role;


-- --
-- -- Name: FUNCTION sp_cambiar_estado_presupuesto(p_id_presupuesto integer, p_nuevo_estado integer, p_id_motivo integer); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_cambiar_estado_presupuesto(p_id_presupuesto integer, p_nuevo_estado integer, p_id_motivo integer) TO anon;
-- GRANT ALL ON FUNCTION public.sp_cambiar_estado_presupuesto(p_id_presupuesto integer, p_nuevo_estado integer, p_id_motivo integer) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_cambiar_estado_presupuesto(p_id_presupuesto integer, p_nuevo_estado integer, p_id_motivo integer) TO service_role;


-- --
-- -- Name: FUNCTION sp_confirmar_pedido(p_id_pedido integer); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_confirmar_pedido(p_id_pedido integer) TO anon;
-- GRANT ALL ON FUNCTION public.sp_confirmar_pedido(p_id_pedido integer) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_confirmar_pedido(p_id_pedido integer) TO service_role;


-- --
-- -- Name: FUNCTION sp_confirmar_pedido(p_id_pedido integer, p_id_deposito integer); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_confirmar_pedido(p_id_pedido integer, p_id_deposito integer) TO anon;
-- GRANT ALL ON FUNCTION public.sp_confirmar_pedido(p_id_pedido integer, p_id_deposito integer) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_confirmar_pedido(p_id_pedido integer, p_id_deposito integer) TO service_role;


-- --
-- -- Name: FUNCTION sp_generar_factura_desde_pedido(p_id_pedido integer); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_generar_factura_desde_pedido(p_id_pedido integer) TO anon;
-- GRANT ALL ON FUNCTION public.sp_generar_factura_desde_pedido(p_id_pedido integer) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_generar_factura_desde_pedido(p_id_pedido integer) TO service_role;


-- --
-- -- Name: FUNCTION sp_presupuestos_rechazados(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_presupuestos_rechazados() TO anon;
-- GRANT ALL ON FUNCTION public.sp_presupuestos_rechazados() TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_presupuestos_rechazados() TO service_role;


-- --
-- -- Name: FUNCTION sp_upsert_cliente(accion text, p_id_cliente integer, p_nombre text, p_direccion text, p_telefono text, p_email text); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_upsert_cliente(accion text, p_id_cliente integer, p_nombre text, p_direccion text, p_telefono text, p_email text) TO anon;
-- GRANT ALL ON FUNCTION public.sp_upsert_cliente(accion text, p_id_cliente integer, p_nombre text, p_direccion text, p_telefono text, p_email text) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_upsert_cliente(accion text, p_id_cliente integer, p_nombre text, p_direccion text, p_telefono text, p_email text) TO service_role;


-- --
-- -- Name: FUNCTION sp_upsert_funcionario(accion text, p_id_empleado integer, p_nombre text); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.sp_upsert_funcionario(accion text, p_id_empleado integer, p_nombre text) TO anon;
-- GRANT ALL ON FUNCTION public.sp_upsert_funcionario(accion text, p_id_empleado integer, p_nombre text) TO authenticated;
-- GRANT ALL ON FUNCTION public.sp_upsert_funcionario(accion text, p_id_empleado integer, p_nombre text) TO service_role;


-- --
-- -- Name: FUNCTION validar_modificacion_presupuesto(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.validar_modificacion_presupuesto() TO anon;
-- GRANT ALL ON FUNCTION public.validar_modificacion_presupuesto() TO authenticated;
-- GRANT ALL ON FUNCTION public.validar_modificacion_presupuesto() TO service_role;


-- --
-- -- Name: FUNCTION validar_motivo_presupuesto(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.validar_motivo_presupuesto() TO anon;
-- GRANT ALL ON FUNCTION public.validar_motivo_presupuesto() TO authenticated;
-- GRANT ALL ON FUNCTION public.validar_motivo_presupuesto() TO service_role;


-- --
-- -- Name: FUNCTION validar_pedido_modificacion(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.validar_pedido_modificacion() TO anon;
-- GRANT ALL ON FUNCTION public.validar_pedido_modificacion() TO authenticated;
-- GRANT ALL ON FUNCTION public.validar_pedido_modificacion() TO service_role;


-- --
-- -- Name: FUNCTION validar_stock_no_negativo(); Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON FUNCTION public.validar_stock_no_negativo() TO anon;
-- GRANT ALL ON FUNCTION public.validar_stock_no_negativo() TO authenticated;
-- GRANT ALL ON FUNCTION public.validar_stock_no_negativo() TO service_role;


-- --
-- -- Name: FUNCTION apply_rls(wal jsonb, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO postgres;
-- GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO dashboard_user;
-- GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO anon;
-- GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO authenticated;
-- GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO service_role;
-- GRANT ALL ON FUNCTION realtime.apply_rls(wal jsonb, max_record_bytes integer) TO supabase_realtime_admin;


-- --
-- -- Name: FUNCTION broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO postgres;
-- GRANT ALL ON FUNCTION realtime.broadcast_changes(topic_name text, event_name text, operation text, table_name text, table_schema text, new record, old record, level text) TO dashboard_user;


-- --
-- -- Name: FUNCTION build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO postgres;
-- GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO dashboard_user;
-- GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO anon;
-- GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO authenticated;
-- GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO service_role;
-- GRANT ALL ON FUNCTION realtime.build_prepared_statement_sql(prepared_statement_name text, entity regclass, columns realtime.wal_column[]) TO supabase_realtime_admin;


-- --
-- -- Name: FUNCTION "cast"(val text, type_ regtype); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO postgres;
-- GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO dashboard_user;
-- GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO anon;
-- GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO authenticated;
-- GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO service_role;
-- GRANT ALL ON FUNCTION realtime."cast"(val text, type_ regtype) TO supabase_realtime_admin;


-- --
-- -- Name: FUNCTION check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO postgres;
-- GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO dashboard_user;
-- GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO anon;
-- GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO authenticated;
-- GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO service_role;
-- GRANT ALL ON FUNCTION realtime.check_equality_op(op realtime.equality_op, type_ regtype, val_1 text, val_2 text) TO supabase_realtime_admin;


-- --
-- -- Name: FUNCTION is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO postgres;
-- GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO dashboard_user;
-- GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO anon;
-- GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO authenticated;
-- GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO service_role;
-- GRANT ALL ON FUNCTION realtime.is_visible_through_filters(columns realtime.wal_column[], filters realtime.user_defined_filter[]) TO supabase_realtime_admin;


-- --
-- -- Name: FUNCTION list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO postgres;
-- GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO dashboard_user;
-- GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO anon;
-- GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO authenticated;
-- GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO service_role;
-- GRANT ALL ON FUNCTION realtime.list_changes(publication name, slot_name name, max_changes integer, max_record_bytes integer) TO supabase_realtime_admin;


-- --
-- -- Name: FUNCTION quote_wal2json(entity regclass); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO postgres;
-- GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO dashboard_user;
-- GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO anon;
-- GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO authenticated;
-- GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO service_role;
-- GRANT ALL ON FUNCTION realtime.quote_wal2json(entity regclass) TO supabase_realtime_admin;


-- --
-- -- Name: FUNCTION send(payload jsonb, event text, topic text, private boolean); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO postgres;
-- GRANT ALL ON FUNCTION realtime.send(payload jsonb, event text, topic text, private boolean) TO dashboard_user;


-- --
-- -- Name: FUNCTION subscription_check_filters(); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO postgres;
-- GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO dashboard_user;
-- GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO anon;
-- GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO authenticated;
-- GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO service_role;
-- GRANT ALL ON FUNCTION realtime.subscription_check_filters() TO supabase_realtime_admin;


-- --
-- -- Name: FUNCTION to_regrole(role_name text); Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO postgres;
-- GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO dashboard_user;
-- GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO anon;
-- GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO authenticated;
-- GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO service_role;
-- GRANT ALL ON FUNCTION realtime.to_regrole(role_name text) TO supabase_realtime_admin;


-- --
-- -- Name: FUNCTION topic(); Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
-- --

-- GRANT ALL ON FUNCTION realtime.topic() TO postgres;
-- GRANT ALL ON FUNCTION realtime.topic() TO dashboard_user;


-- --
-- -- Name: FUNCTION _crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea); Type: ACL; Schema: vault; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION vault._crypto_aead_det_decrypt(message bytea, additional bytea, key_id bigint, context bytea, nonce bytea) TO service_role;


-- --
-- -- Name: FUNCTION create_secret(new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION vault.create_secret(new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


-- --
-- -- Name: FUNCTION update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid); Type: ACL; Schema: vault; Owner: supabase_admin
-- --

-- GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO postgres WITH GRANT OPTION;
-- GRANT ALL ON FUNCTION vault.update_secret(secret_id uuid, new_secret text, new_name text, new_description text, new_key_id uuid) TO service_role;


-- --
-- -- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.audit_log_entries TO postgres;
-- GRANT SELECT ON TABLE auth.audit_log_entries TO postgres WITH GRANT OPTION;


-- --
-- -- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.flow_state TO postgres;
-- GRANT SELECT ON TABLE auth.flow_state TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


-- --
-- -- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.identities TO postgres;
-- GRANT SELECT ON TABLE auth.identities TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.identities TO dashboard_user;


-- --
-- -- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON TABLE auth.instances TO dashboard_user;
-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.instances TO postgres;
-- GRANT SELECT ON TABLE auth.instances TO postgres WITH GRANT OPTION;


-- --
-- -- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_amr_claims TO postgres;
-- GRANT SELECT ON TABLE auth.mfa_amr_claims TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


-- --
-- -- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_challenges TO postgres;
-- GRANT SELECT ON TABLE auth.mfa_challenges TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


-- --
-- -- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.mfa_factors TO postgres;
-- GRANT SELECT ON TABLE auth.mfa_factors TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


-- --
-- -- Name: TABLE oauth_authorizations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON TABLE auth.oauth_authorizations TO postgres;
-- GRANT ALL ON TABLE auth.oauth_authorizations TO dashboard_user;


-- --
-- -- Name: TABLE oauth_clients; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON TABLE auth.oauth_clients TO postgres;
-- GRANT ALL ON TABLE auth.oauth_clients TO dashboard_user;


-- --
-- -- Name: TABLE oauth_consents; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON TABLE auth.oauth_consents TO postgres;
-- GRANT ALL ON TABLE auth.oauth_consents TO dashboard_user;


-- --
-- -- Name: TABLE one_time_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.one_time_tokens TO postgres;
-- GRANT SELECT ON TABLE auth.one_time_tokens TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.one_time_tokens TO dashboard_user;


-- --
-- -- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.refresh_tokens TO postgres;
-- GRANT SELECT ON TABLE auth.refresh_tokens TO postgres WITH GRANT OPTION;


-- --
-- -- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
-- GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


-- --
-- -- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_providers TO postgres;
-- GRANT SELECT ON TABLE auth.saml_providers TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


-- --
-- -- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.saml_relay_states TO postgres;
-- GRANT SELECT ON TABLE auth.saml_relay_states TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


-- --
-- -- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT SELECT ON TABLE auth.schema_migrations TO postgres WITH GRANT OPTION;


-- --
-- -- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sessions TO postgres;
-- GRANT SELECT ON TABLE auth.sessions TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.sessions TO dashboard_user;


-- --
-- -- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_domains TO postgres;
-- GRANT SELECT ON TABLE auth.sso_domains TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


-- --
-- -- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.sso_providers TO postgres;
-- GRANT SELECT ON TABLE auth.sso_providers TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


-- --
-- -- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- GRANT ALL ON TABLE auth.users TO dashboard_user;
-- GRANT INSERT,REFERENCES,DELETE,TRIGGER,TRUNCATE,MAINTAIN,UPDATE ON TABLE auth.users TO postgres;
-- GRANT SELECT ON TABLE auth.users TO postgres WITH GRANT OPTION;


-- --
-- -- Name: TABLE pg_stat_statements; Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON TABLE extensions.pg_stat_statements FROM postgres;
-- GRANT ALL ON TABLE extensions.pg_stat_statements TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE extensions.pg_stat_statements TO dashboard_user;


-- --
-- -- Name: TABLE pg_stat_statements_info; Type: ACL; Schema: extensions; Owner: postgres
-- --

-- REVOKE ALL ON TABLE extensions.pg_stat_statements_info FROM postgres;
-- GRANT ALL ON TABLE extensions.pg_stat_statements_info TO postgres WITH GRANT OPTION;
-- GRANT ALL ON TABLE extensions.pg_stat_statements_info TO dashboard_user;


-- --
-- -- Name: TABLE "Clientes"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Clientes" TO anon;
-- GRANT ALL ON TABLE public."Clientes" TO authenticated;
-- GRANT ALL ON TABLE public."Clientes" TO service_role;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Clientes" TO ventas;
-- GRANT SELECT ON TABLE public."Clientes" TO deposito;


-- --
-- -- Name: SEQUENCE "Clientes_id_cliente_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Clientes_id_cliente_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Clientes_id_cliente_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Clientes_id_cliente_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Clientes_id_cliente_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Clientes_id_cliente_seq" TO deposito;


-- --
-- -- Name: TABLE "Depositos"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Depositos" TO anon;
-- GRANT ALL ON TABLE public."Depositos" TO authenticated;
-- GRANT ALL ON TABLE public."Depositos" TO service_role;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Depositos" TO deposito;


-- --
-- -- Name: SEQUENCE "Depositos_id_deposito_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Depositos_id_deposito_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Depositos_id_deposito_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Depositos_id_deposito_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Depositos_id_deposito_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Depositos_id_deposito_seq" TO deposito;


-- --
-- -- Name: TABLE "Empleados"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Empleados" TO anon;
-- GRANT ALL ON TABLE public."Empleados" TO authenticated;
-- GRANT ALL ON TABLE public."Empleados" TO service_role;


-- --
-- -- Name: SEQUENCE "Empleados_id_empleado_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Empleados_id_empleado_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Empleados_id_empleado_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Empleados_id_empleado_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Empleados_id_empleado_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Empleados_id_empleado_seq" TO deposito;


-- --
-- -- Name: TABLE "EstadosPedido"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."EstadosPedido" TO anon;
-- GRANT ALL ON TABLE public."EstadosPedido" TO authenticated;
-- GRANT ALL ON TABLE public."EstadosPedido" TO service_role;


-- --
-- -- Name: TABLE "EstadosPresupuesto"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."EstadosPresupuesto" TO anon;
-- GRANT ALL ON TABLE public."EstadosPresupuesto" TO authenticated;
-- GRANT ALL ON TABLE public."EstadosPresupuesto" TO service_role;


-- --
-- -- Name: TABLE "FacturaDetalles"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."FacturaDetalles" TO anon;
-- GRANT ALL ON TABLE public."FacturaDetalles" TO authenticated;
-- GRANT ALL ON TABLE public."FacturaDetalles" TO service_role;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."FacturaDetalles" TO ventas;


-- --
-- -- Name: SEQUENCE "FacturaDetalles_id_detalle_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."FacturaDetalles_id_detalle_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."FacturaDetalles_id_detalle_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."FacturaDetalles_id_detalle_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."FacturaDetalles_id_detalle_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."FacturaDetalles_id_detalle_seq" TO deposito;


-- --
-- -- Name: TABLE "Facturas"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Facturas" TO anon;
-- GRANT ALL ON TABLE public."Facturas" TO authenticated;
-- GRANT ALL ON TABLE public."Facturas" TO service_role;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Facturas" TO ventas;


-- --
-- -- Name: SEQUENCE "Facturas_id_factura_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Facturas_id_factura_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Facturas_id_factura_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Facturas_id_factura_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Facturas_id_factura_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Facturas_id_factura_seq" TO deposito;


-- --
-- -- Name: TABLE "Marcas"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Marcas" TO anon;
-- GRANT ALL ON TABLE public."Marcas" TO authenticated;
-- GRANT ALL ON TABLE public."Marcas" TO service_role;
-- GRANT SELECT ON TABLE public."Marcas" TO empleados;
-- GRANT SELECT ON TABLE public."Marcas" TO ventas;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Marcas" TO deposito;


-- --
-- -- Name: SEQUENCE "Marcas_id_marca_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Marcas_id_marca_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Marcas_id_marca_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Marcas_id_marca_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Marcas_id_marca_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Marcas_id_marca_seq" TO deposito;


-- --
-- -- Name: TABLE "Motivos"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Motivos" TO anon;
-- GRANT ALL ON TABLE public."Motivos" TO authenticated;
-- GRANT ALL ON TABLE public."Motivos" TO service_role;
-- GRANT SELECT ON TABLE public."Motivos" TO ventas;
-- GRANT SELECT ON TABLE public."Motivos" TO deposito;


-- --
-- -- Name: SEQUENCE "Motivos_id_motivo_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Motivos_id_motivo_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Motivos_id_motivo_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Motivos_id_motivo_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Motivos_id_motivo_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Motivos_id_motivo_seq" TO deposito;


-- --
-- -- Name: TABLE "PedidoDetalles"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."PedidoDetalles" TO anon;
-- GRANT ALL ON TABLE public."PedidoDetalles" TO authenticated;
-- GRANT ALL ON TABLE public."PedidoDetalles" TO service_role;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."PedidoDetalles" TO ventas;
-- GRANT SELECT ON TABLE public."PedidoDetalles" TO deposito;


-- --
-- -- Name: SEQUENCE "PedidoDetalles_id_detalle_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."PedidoDetalles_id_detalle_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."PedidoDetalles_id_detalle_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."PedidoDetalles_id_detalle_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."PedidoDetalles_id_detalle_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."PedidoDetalles_id_detalle_seq" TO deposito;


-- --
-- -- Name: TABLE "Pedidos"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Pedidos" TO anon;
-- GRANT ALL ON TABLE public."Pedidos" TO authenticated;
-- GRANT ALL ON TABLE public."Pedidos" TO service_role;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Pedidos" TO ventas;
-- GRANT SELECT ON TABLE public."Pedidos" TO deposito;


-- --
-- -- Name: TABLE "PedidosLog"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."PedidosLog" TO anon;
-- GRANT ALL ON TABLE public."PedidosLog" TO authenticated;
-- GRANT ALL ON TABLE public."PedidosLog" TO service_role;


-- --
-- -- Name: SEQUENCE "PedidosLog_id_log_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."PedidosLog_id_log_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."PedidosLog_id_log_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."PedidosLog_id_log_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."PedidosLog_id_log_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."PedidosLog_id_log_seq" TO deposito;


-- --
-- -- Name: SEQUENCE "Pedidos_id_pedido_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Pedidos_id_pedido_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Pedidos_id_pedido_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Pedidos_id_pedido_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Pedidos_id_pedido_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Pedidos_id_pedido_seq" TO deposito;


-- --
-- -- Name: TABLE "PresupuestoDetalles"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."PresupuestoDetalles" TO anon;
-- GRANT ALL ON TABLE public."PresupuestoDetalles" TO authenticated;
-- GRANT ALL ON TABLE public."PresupuestoDetalles" TO service_role;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."PresupuestoDetalles" TO ventas;


-- --
-- -- Name: SEQUENCE "PresupuestoDetalles_id_detalle_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."PresupuestoDetalles_id_detalle_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."PresupuestoDetalles_id_detalle_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."PresupuestoDetalles_id_detalle_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."PresupuestoDetalles_id_detalle_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."PresupuestoDetalles_id_detalle_seq" TO deposito;


-- --
-- -- Name: TABLE "Presupuestos"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Presupuestos" TO anon;
-- GRANT ALL ON TABLE public."Presupuestos" TO authenticated;
-- GRANT ALL ON TABLE public."Presupuestos" TO service_role;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Presupuestos" TO ventas;


-- --
-- -- Name: TABLE "PresupuestosPorEstado"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."PresupuestosPorEstado" TO anon;
-- GRANT ALL ON TABLE public."PresupuestosPorEstado" TO authenticated;
-- GRANT ALL ON TABLE public."PresupuestosPorEstado" TO service_role;


-- --
-- -- Name: TABLE "PresupuestosRechazados"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."PresupuestosRechazados" TO anon;
-- GRANT ALL ON TABLE public."PresupuestosRechazados" TO authenticated;
-- GRANT ALL ON TABLE public."PresupuestosRechazados" TO service_role;


-- --
-- -- Name: SEQUENCE "Presupuestos_id_presupuesto_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Presupuestos_id_presupuesto_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Presupuestos_id_presupuesto_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Presupuestos_id_presupuesto_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Presupuestos_id_presupuesto_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Presupuestos_id_presupuesto_seq" TO deposito;


-- --
-- -- Name: TABLE "Productos"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Productos" TO anon;
-- GRANT ALL ON TABLE public."Productos" TO authenticated;
-- GRANT ALL ON TABLE public."Productos" TO service_role;
-- GRANT SELECT ON TABLE public."Productos" TO empleados;
-- GRANT SELECT ON TABLE public."Productos" TO ventas;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Productos" TO deposito;


-- --
-- -- Name: SEQUENCE "Productos_id_producto_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Productos_id_producto_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Productos_id_producto_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Productos_id_producto_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Productos_id_producto_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Productos_id_producto_seq" TO deposito;


-- --
-- -- Name: TABLE "Stock"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."Stock" TO anon;
-- GRANT ALL ON TABLE public."Stock" TO authenticated;
-- GRANT ALL ON TABLE public."Stock" TO service_role;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."Stock" TO deposito;


-- --
-- -- Name: SEQUENCE "Stock_id_stock_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."Stock_id_stock_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."Stock_id_stock_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."Stock_id_stock_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."Stock_id_stock_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."Stock_id_stock_seq" TO deposito;


-- --
-- -- Name: TABLE "TiposProducto"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public."TiposProducto" TO anon;
-- GRANT ALL ON TABLE public."TiposProducto" TO authenticated;
-- GRANT ALL ON TABLE public."TiposProducto" TO service_role;
-- GRANT SELECT ON TABLE public."TiposProducto" TO empleados;
-- GRANT SELECT ON TABLE public."TiposProducto" TO ventas;
-- GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public."TiposProducto" TO deposito;


-- --
-- -- Name: SEQUENCE "TiposProducto_id_tipo_producto_seq"; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public."TiposProducto_id_tipo_producto_seq" TO anon;
-- GRANT ALL ON SEQUENCE public."TiposProducto_id_tipo_producto_seq" TO authenticated;
-- GRANT ALL ON SEQUENCE public."TiposProducto_id_tipo_producto_seq" TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public."TiposProducto_id_tipo_producto_seq" TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public."TiposProducto_id_tipo_producto_seq" TO deposito;


-- --
-- -- Name: TABLE pedidos_log; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public.pedidos_log TO anon;
-- GRANT ALL ON TABLE public.pedidos_log TO authenticated;
-- GRANT ALL ON TABLE public.pedidos_log TO service_role;


-- --
-- -- Name: SEQUENCE pedidos_log_id_seq; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON SEQUENCE public.pedidos_log_id_seq TO anon;
-- GRANT ALL ON SEQUENCE public.pedidos_log_id_seq TO authenticated;
-- GRANT ALL ON SEQUENCE public.pedidos_log_id_seq TO service_role;
-- GRANT SELECT,USAGE ON SEQUENCE public.pedidos_log_id_seq TO ventas;
-- GRANT SELECT,USAGE ON SEQUENCE public.pedidos_log_id_seq TO deposito;


-- --
-- -- Name: TABLE vista_stock_productos; Type: ACL; Schema: public; Owner: postgres
-- --

-- GRANT ALL ON TABLE public.vista_stock_productos TO anon;
-- GRANT ALL ON TABLE public.vista_stock_productos TO authenticated;
-- GRANT ALL ON TABLE public.vista_stock_productos TO service_role;


-- --
-- -- Name: TABLE messages; Type: ACL; Schema: realtime; Owner: supabase_realtime_admin
-- --

-- GRANT ALL ON TABLE realtime.messages TO postgres;
-- GRANT ALL ON TABLE realtime.messages TO dashboard_user;
-- GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO anon;
-- GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO authenticated;
-- GRANT SELECT,INSERT,UPDATE ON TABLE realtime.messages TO service_role;


-- --
-- -- Name: TABLE schema_migrations; Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON TABLE realtime.schema_migrations TO postgres;
-- GRANT ALL ON TABLE realtime.schema_migrations TO dashboard_user;
-- GRANT SELECT ON TABLE realtime.schema_migrations TO anon;
-- GRANT SELECT ON TABLE realtime.schema_migrations TO authenticated;
-- GRANT SELECT ON TABLE realtime.schema_migrations TO service_role;
-- GRANT ALL ON TABLE realtime.schema_migrations TO supabase_realtime_admin;


-- --
-- -- Name: TABLE subscription; Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON TABLE realtime.subscription TO postgres;
-- GRANT ALL ON TABLE realtime.subscription TO dashboard_user;
-- GRANT SELECT ON TABLE realtime.subscription TO anon;
-- GRANT SELECT ON TABLE realtime.subscription TO authenticated;
-- GRANT SELECT ON TABLE realtime.subscription TO service_role;
-- GRANT ALL ON TABLE realtime.subscription TO supabase_realtime_admin;


-- --
-- -- Name: SEQUENCE subscription_id_seq; Type: ACL; Schema: realtime; Owner: supabase_admin
-- --

-- GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO postgres;
-- GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO dashboard_user;
-- GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO anon;
-- GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO authenticated;
-- GRANT USAGE ON SEQUENCE realtime.subscription_id_seq TO service_role;
-- GRANT ALL ON SEQUENCE realtime.subscription_id_seq TO supabase_realtime_admin;


-- --
-- -- Name: TABLE buckets; Type: ACL; Schema: storage; Owner: supabase_storage_admin
-- --

-- REVOKE ALL ON TABLE storage.buckets FROM supabase_storage_admin;
-- GRANT ALL ON TABLE storage.buckets TO supabase_storage_admin WITH GRANT OPTION;
-- GRANT ALL ON TABLE storage.buckets TO anon;
-- GRANT ALL ON TABLE storage.buckets TO authenticated;
-- GRANT ALL ON TABLE storage.buckets TO service_role;
-- GRANT ALL ON TABLE storage.buckets TO postgres WITH GRANT OPTION;


-- --
-- -- Name: TABLE buckets_analytics; Type: ACL; Schema: storage; Owner: supabase_storage_admin
-- --

-- GRANT ALL ON TABLE storage.buckets_analytics TO service_role;
-- GRANT ALL ON TABLE storage.buckets_analytics TO authenticated;
-- GRANT ALL ON TABLE storage.buckets_analytics TO anon;


-- --
-- -- Name: TABLE buckets_vectors; Type: ACL; Schema: storage; Owner: supabase_storage_admin
-- --

-- GRANT SELECT ON TABLE storage.buckets_vectors TO service_role;
-- GRANT SELECT ON TABLE storage.buckets_vectors TO authenticated;
-- GRANT SELECT ON TABLE storage.buckets_vectors TO anon;


-- --
-- -- Name: TABLE objects; Type: ACL; Schema: storage; Owner: supabase_storage_admin
-- --

-- REVOKE ALL ON TABLE storage.objects FROM supabase_storage_admin;
-- GRANT ALL ON TABLE storage.objects TO supabase_storage_admin WITH GRANT OPTION;
-- GRANT ALL ON TABLE storage.objects TO anon;
-- GRANT ALL ON TABLE storage.objects TO authenticated;
-- GRANT ALL ON TABLE storage.objects TO service_role;
-- GRANT ALL ON TABLE storage.objects TO postgres WITH GRANT OPTION;


-- --
-- -- Name: TABLE prefixes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
-- --

-- GRANT ALL ON TABLE storage.prefixes TO service_role;
-- GRANT ALL ON TABLE storage.prefixes TO authenticated;
-- GRANT ALL ON TABLE storage.prefixes TO anon;


-- --
-- -- Name: TABLE s3_multipart_uploads; Type: ACL; Schema: storage; Owner: supabase_storage_admin
-- --

-- GRANT ALL ON TABLE storage.s3_multipart_uploads TO service_role;
-- GRANT SELECT ON TABLE storage.s3_multipart_uploads TO authenticated;
-- GRANT SELECT ON TABLE storage.s3_multipart_uploads TO anon;


-- --
-- -- Name: TABLE s3_multipart_uploads_parts; Type: ACL; Schema: storage; Owner: supabase_storage_admin
-- --

-- GRANT ALL ON TABLE storage.s3_multipart_uploads_parts TO service_role;
-- GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO authenticated;
-- GRANT SELECT ON TABLE storage.s3_multipart_uploads_parts TO anon;


-- --
-- -- Name: TABLE vector_indexes; Type: ACL; Schema: storage; Owner: supabase_storage_admin
-- --

-- GRANT SELECT ON TABLE storage.vector_indexes TO service_role;
-- GRANT SELECT ON TABLE storage.vector_indexes TO authenticated;
-- GRANT SELECT ON TABLE storage.vector_indexes TO anon;


-- --
-- -- Name: TABLE secrets; Type: ACL; Schema: vault; Owner: supabase_admin
-- --

-- GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.secrets TO postgres WITH GRANT OPTION;
-- GRANT SELECT,DELETE ON TABLE vault.secrets TO service_role;


-- --
-- -- Name: TABLE decrypted_secrets; Type: ACL; Schema: vault; Owner: supabase_admin
-- --

-- GRANT SELECT,REFERENCES,DELETE,TRUNCATE ON TABLE vault.decrypted_secrets TO postgres WITH GRANT OPTION;
-- GRANT SELECT,DELETE ON TABLE vault.decrypted_secrets TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES TO dashboard_user;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS TO dashboard_user;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES TO dashboard_user;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON SEQUENCES TO postgres WITH GRANT OPTION;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON FUNCTIONS TO postgres WITH GRANT OPTION;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: extensions; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA extensions GRANT ALL ON TABLES TO postgres WITH GRANT OPTION;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON SEQUENCES TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON FUNCTIONS TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql GRANT ALL ON TABLES TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON SEQUENCES TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON FUNCTIONS TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: graphql_public; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA graphql_public GRANT ALL ON TABLES TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON SEQUENCES TO dashboard_user;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON FUNCTIONS TO dashboard_user;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: realtime; Owner: supabase_admin
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA realtime GRANT ALL ON TABLES TO dashboard_user;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON SEQUENCES TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: storage; Owner: postgres
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON FUNCTIONS TO service_role;


-- --
-- -- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: storage; Owner: postgres
-- --

-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO postgres;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO anon;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO authenticated;
-- ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA storage GRANT ALL ON TABLES TO service_role;


-- --
-- -- Name: issue_graphql_placeholder; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
-- --

-- CREATE EVENT TRIGGER issue_graphql_placeholder ON sql_drop
--          WHEN TAG IN ('DROP EXTENSION')
--    EXECUTE FUNCTION extensions.set_graphql_placeholder();


-- ALTER EVENT TRIGGER issue_graphql_placeholder OWNER TO supabase_admin;

-- --
-- -- Name: issue_pg_cron_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
-- --

-- CREATE EVENT TRIGGER issue_pg_cron_access ON ddl_command_end
--          WHEN TAG IN ('CREATE EXTENSION')
--    EXECUTE FUNCTION extensions.grant_pg_cron_access();


-- ALTER EVENT TRIGGER issue_pg_cron_access OWNER TO supabase_admin;

-- --
-- -- Name: issue_pg_graphql_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
-- --

-- CREATE EVENT TRIGGER issue_pg_graphql_access ON ddl_command_end
--          WHEN TAG IN ('CREATE FUNCTION')
--    EXECUTE FUNCTION extensions.grant_pg_graphql_access();


-- ALTER EVENT TRIGGER issue_pg_graphql_access OWNER TO supabase_admin;

-- --
-- -- Name: issue_pg_net_access; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
-- --

-- CREATE EVENT TRIGGER issue_pg_net_access ON ddl_command_end
--          WHEN TAG IN ('CREATE EXTENSION')
--    EXECUTE FUNCTION extensions.grant_pg_net_access();


-- ALTER EVENT TRIGGER issue_pg_net_access OWNER TO supabase_admin;

-- --
-- -- Name: pgrst_ddl_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
-- --

-- CREATE EVENT TRIGGER pgrst_ddl_watch ON ddl_command_end
--    EXECUTE FUNCTION extensions.pgrst_ddl_watch();


-- ALTER EVENT TRIGGER pgrst_ddl_watch OWNER TO supabase_admin;

-- --
-- -- Name: pgrst_drop_watch; Type: EVENT TRIGGER; Schema: -; Owner: supabase_admin
-- --

-- CREATE EVENT TRIGGER pgrst_drop_watch ON sql_drop
--    EXECUTE FUNCTION extensions.pgrst_drop_watch();


-- ALTER EVENT TRIGGER pgrst_drop_watch OWNER TO supabase_admin;

--
-- PostgreSQL database dump complete
--

\unrestrict q9qAImaEDoQvPxGohVktBGIq98xxarxctAmMx2I6lO42AzS7HAJV9i7zPPF30bK

