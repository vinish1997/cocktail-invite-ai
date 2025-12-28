CREATE TABLE rsvps (
    -- Primary Key
                       id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- Foreign Key Reference
                       invitation_id UUID NOT NULL,

    -- Guest Details
                       guest_name VARCHAR(80) NOT NULL,
                       status VARCHAR(10) NOT NULL CHECK (
                           status IN ('YES', 'NO', 'MAYBE')
                           ),
                       message VARCHAR(240),

    -- Timestamps
                       created_at TIMESTAMPTZ NOT NULL,
                       updated_at TIMESTAMPTZ NOT NULL,

    -- Constraints
                       CONSTRAINT fk_invitation
                           FOREIGN KEY (invitation_id)
                               REFERENCES invitations(id)
                               ON DELETE CASCADE
);

-- Index for fast lookup of RSVPs by invitation
CREATE INDEX idx_rsvps_invitation_id ON rsvps(invitation_id);