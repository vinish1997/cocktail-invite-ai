CREATE TABLE cocktails (
    -- Primary Key
                           id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    -- Relationships
                           invitation_id UUID NOT NULL,

    -- Cocktail Attributes
                           is_mocktail BOOLEAN NOT NULL DEFAULT false,
                           base_spirit VARCHAR(50),
                           sweetness VARCHAR(10) NOT NULL CHECK (
                               sweetness IN ('LOW', 'MEDIUM', 'HIGH')
                               ),
                           flavor VARCHAR(120) NOT NULL,
                           custom_name VARCHAR(200) NOT NULL,
                           one_liner VARCHAR(280) NOT NULL,
                           sort_order INT NOT NULL DEFAULT 0,

    -- Metadata
                           created_at TIMESTAMPTZ NOT NULL,
                           updated_at TIMESTAMPTZ NOT NULL,

    -- Constraints
                           CONSTRAINT fk_invitation
                               FOREIGN KEY (invitation_id)
                                   REFERENCES invitations(id)
                                   ON DELETE CASCADE
);

-- Optimized index for retrieving sorted menus per invitation
CREATE INDEX idx_cocktails_invitation_sort ON cocktails (invitation_id, sort_order);