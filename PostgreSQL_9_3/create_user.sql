--------------------------------------------------------
-- Copyright 2009-2016, Acciente LLC
--
-- Acciente LLC licenses this file to you under the
-- Apache License, Version 2.0 (the "License"); you
-- may not use this file except in compliance with the
-- License. You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in
-- writing, software distributed under the License is
-- distributed on an "AS IS" BASIS, WITHOUT WARRANTIES
-- OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing
-- permissions and limitations under the License.
--------------------------------------------------------

-- create oacc user:

CREATE USER oaccuser WITH PASSWORD 'oaccpwd' CONNECTION LIMIT -1;

-- if using a dedicated database - grant database privileges:
GRANT CONNECT ON DATABASE oaccdb TO oaccuser;

-- grant schema privileges:
GRANT USAGE ON SCHEMA OACC TO oaccuser;

-- grant sequence privileges:
GRANT USAGE ON ALL SEQUENCES IN SCHEMA OACC TO oaccuser;

-- grant table privileges:
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA OACC TO oaccuser;
