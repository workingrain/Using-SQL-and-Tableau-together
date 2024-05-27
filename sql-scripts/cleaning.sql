-- change prefer not to answer to non-binary
UPDATE patient
SET gender = CASE
                WHEN gender = 'Prefer not to answer' THEN 'Non-binary'
                ELSE gender
            END;


-- correct spelling to highblood
ALTER TABLE patient
RENAME COLUMN hignblood to highblood;

-- make a table for the external dataset
CREATE TABLE leading_causes (
    Year INTEGER,
    "113cause" VARCHAR(255),
    Cause VARCHAR(255),
    State VARCHAR(255),
    Deaths INTEGER,
    age_adjusted NUMERIC,
    State_Initials VARCHAR(2)
);
