CREATE OR REPLACE 
PACKAGE BODY gen_error_util IS

   PROCEDURE log_error(p_program_name IN VARCHAR2, p_error_text IN VARCHAR2) IS
   --
   -- Purpose: Provides utilities for logging internal application errors
   --
   -- MODIFICATION HISTORY
   -- Person                            Date        Comments
   -- --------------------------------- ----------  ------------------------------------------
   -- Garry Lawton - Skillbuilders Inc. 12/03/2018  Creation
   --
   crlf VARCHAR2(2) := '
';
   BEGIN
      ROLLBACK;
      INSERT INTO gen_application_errors(program_name, error_text)
           VALUES(p_program_name, p_error_text);
      COMMIT;
      IF sec_util.get_notification_users IS NOT NULL THEN
         sec_util.send_notification(p_to => sec_util.get_notification_users,
                                    p_subject => 'Application Error',
                                    p_message => 'Program: '||p_program_name||crlf||
                                                 'Error: '||p_error_text);
      END IF;
   END log_error;

   PROCEDURE test_error_logging IS
      --
      -- Purpose: To test error logging.
      --
      -- MODIFICATION HISTORY
      -- Person                            Date        Comments
      -- --------------------------------- ----------  ------------------------------------------
      -- Garry Lawton - Skillbuilders Inc. 12/03/2018  Creation
      --
      x NUMBER;
   BEGIN
      x := 1/0;
   EXCEPTION
      WHEN OTHERS THEN
      gen_error_util.log_error(p_program_name => 'GEN_ERROR_UTIL.TEST_ERROR_LOGGING', p_error_text => SQLERRM);
      RAISE;
   END test_error_logging;

END gen_error_util;
/