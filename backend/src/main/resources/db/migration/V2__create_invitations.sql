CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE invitations (
    -- Primary Key & System Fields
                             id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
                             slug VARCHAR(32) UNIQUE NOT NULL,
                             created_at TIMESTAMPTZ NOT NULL,
                             updated_at TIMESTAMPTZ NOT NULL,
                             published BOOLEAN NOT NULL DEFAULT true,

    -- Event Configuration
                             party_type VARCHAR(50) NOT NULL,
                             menu_mode VARCHAR(20) NOT NULL CHECK (
                                 menu_mode IN ('HOST_DEFINED', 'AI_PROPOSED')
                                 ),
                             template_id VARCHAR(20) NOT NULL CHECK (
                                 template_id IN ('MINIMAL', 'NEON', 'LUXURY')
                                 ),
                             tone VARCHAR(20) NOT NULL,

    -- Event Details (Input Data)
                             host_name VARCHAR(80) NOT NULL,
                             theme VARCHAR(120) NOT NULL,
                             location VARCHAR(120) NOT NULL,
                             event_time TIMESTAMPTZ NOT NULL,
                             preferred_spirits TEXT,
                             photo_url TEXT,

    -- Generated Invitation Content
                             invite_title VARCHAR(140),
                             invite_tagline VARCHAR(180),
                             datetime_line VARCHAR(120),
                             location_line VARCHAR(160),
                             rsvp_line VARCHAR(200)
);