CREATE OR REPLACE 
PACKAGE gen_error_util IS
--
--
-- Purpose: To provide all the error utilities for the APEX application
--
-- MODIFICATION HISTORY
-- Person                            Date        Comments
-- --------------------------------- ----------  ------------------------------------------
-- Garry Lawton - Skillbuilders Inc. 12/03/2018  Creation
--
   PROCEDURE log_error(p_program_name IN VARCHAR2, p_error_text IN VARCHAR2);
   PROCEDURE test_error_logging;

END gen_error_util;
/