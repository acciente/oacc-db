# ------------------------------------------------------ #
#  Copyright 2009-2016, Acciente LLC                     #
#                                                        #
#  Acciente LLC licenses this file to you under the      #
#  Apache License, Version 2.0 (the "License"); you      #
#  may not use this file except in compliance with the   #
#  License. You may obtain a copy of the License at      #
#                                                        #
#      http://www.apache.org/licenses/LICENSE-2.0        #
#                                                        #
#  Unless required by applicable law or agreed to in     #
#  writing, software distributed under the License is    #
#  distributed on an "AS IS" BASIS, WITHOUT WARRANTIES   #
#  OR CONDITIONS OF ANY KIND, either express or implied. #
#  See the License for the specific language governing   #
#  permissions and limitations under the License.        #
# ------------------------------------------------------ #

# ---------------------------------------------------------------------- #
# Script generated with: DeZign for Databases V7.3.4                     #
# Target DBMS:           MySQL 5                                         #
# Project file:          oacc-schema-design.dez                          #
# Project name:          OACC                                            #
# Author:                Adinath Raveendra Raj                           #
# Script type:           Database drop script                            #
# Created on:            2015-11-02 16:25                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Drop foreign key constraints                                           #
# ---------------------------------------------------------------------- #

ALTER TABLE `OACCDB`.`OAC_Domain` DROP FOREIGN KEY `D_D_ParentDomainID`;

ALTER TABLE `OACCDB`.`OAC_ResourceClassPermission` DROP FOREIGN KEY `RCP_RC_ResourceClassID`;

ALTER TABLE `OACCDB`.`OAC_Resource` DROP FOREIGN KEY `R_RC_ResourceClassID`;

ALTER TABLE `OACCDB`.`OAC_Resource` DROP FOREIGN KEY `R_D_DomainID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm` DROP FOREIGN KEY `GrRP_R_AccessorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm` DROP FOREIGN KEY `GrRP_R_AccessedResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm` DROP FOREIGN KEY `GrRP_R_GrantorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm` DROP FOREIGN KEY `GrRP_RCP_ResourceClassID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` DROP FOREIGN KEY `GrRCrPPoCr_RCP_ResClassID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` DROP FOREIGN KEY `GrRCrPPoCr_R_AccessorResID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` DROP FOREIGN KEY `GrRCrPPoCr_R_GrantorResID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` DROP FOREIGN KEY `GrRCrPPoCr_D_AccessedDomainID`;

ALTER TABLE `OACCDB`.`OAC_Grant_DomPerm_Sys` DROP FOREIGN KEY `GrDPSys_R_AccessorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_DomPerm_Sys` DROP FOREIGN KEY `GrDPSys_R_GrantorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_DomPerm_Sys` DROP FOREIGN KEY `GrDPSys_D_AccessedDomID`;

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_PostCr_Sys` DROP FOREIGN KEY `GrDCrPPoCrSys_R_AccessorResID`;

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_PostCr_Sys` DROP FOREIGN KEY `GrDCrPPoCrSys_R_GrantorResID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` DROP FOREIGN KEY `GrRPSys_R_AccessorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` DROP FOREIGN KEY `GrRPSys_R_AccessedResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` DROP FOREIGN KEY `GrRPSys_R_GrantorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` DROP FOREIGN KEY `GrRPSys_RC_ResourceClassID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` DROP FOREIGN KEY `GrRCrPPoCrSys_R_AccessorResID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` DROP FOREIGN KEY `GrRCrPPoCrSys_R_GrantorResID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` DROP FOREIGN KEY `GrRCrPPoCrSys_RC_ResClassID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` DROP FOREIGN KEY `GrRCrPPoCrSys_D_AccessedDomID`;

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` DROP FOREIGN KEY `GrGbRP_RCP_ResClassID`;

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` DROP FOREIGN KEY `GrGbRP_R_AccessorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` DROP FOREIGN KEY `GrGbRP_R_GrantorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` DROP FOREIGN KEY `GrGbRP_D_AccessedDomainID`;

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` DROP FOREIGN KEY `GrGbRPSys_R_AccessorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` DROP FOREIGN KEY `GrGbRPSys_R_GrantorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` DROP FOREIGN KEY `GrGbRPSys_D_AccessedDomID`;

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` DROP FOREIGN KEY `GrGbRPSys_RC_ResClassID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_Sys` DROP FOREIGN KEY `GrRCrPSys_R_AccessorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_Sys` DROP FOREIGN KEY `GrRCrPSys_D_AccessedDomainID`;

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_Sys` DROP FOREIGN KEY `GrRCrPSys_R_GrantorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_Sys` DROP FOREIGN KEY `GrDCrPSys_R_AccessorResourceID`;

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_Sys` DROP FOREIGN KEY `GrDCrPSys_R_GrantorResourceID`;

ALTER TABLE `OACCDB`.`OAC_ResourcePassword` DROP FOREIGN KEY `RP_R_ResourceID`;

ALTER TABLE `OACCDB`.`OAC_ResourceExternalID` DROP FOREIGN KEY `RE_R_ResourceID`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_ResourceExternalID"                             #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_ResourceExternalID` DROP PRIMARY KEY;

DROP INDEX `UX_ExternalID` ON `OACCDB`.`OAC_ResourceExternalID`;

# Drop table #

DROP TABLE `OACCDB`.`OAC_ResourceExternalID`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_ResourcePassword"                               #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_ResourcePassword` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_ResourcePassword`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_DomCrPerm_Sys"                            #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_Sys` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_DomCrPerm_Sys`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_ResCrPerm_Sys"                            #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_Sys` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_ResCrPerm_Sys`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_Global_ResPerm_Sys"                       #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_Global_ResPerm"                           #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_Global_ResPerm`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_ResCrPerm_PostCr_Sys"                     #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_ResPerm_Sys"                              #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_DomCrPerm_PostCr_Sys"                     #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_PostCr_Sys` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_DomCrPerm_PostCr_Sys`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_DomPerm_Sys"                              #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_DomPerm_Sys` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_DomPerm_Sys`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_ResCrPerm_PostCr"                         #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Grant_ResPerm"                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm` DROP PRIMARY KEY;

# Drop table #

DROP TABLE `OACCDB`.`OAC_Grant_ResPerm`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Resource"                                       #
# ---------------------------------------------------------------------- #

# Drop constraints #

# Drop table #

DROP TABLE `OACCDB`.`OAC_Resource`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_Domain"                                         #
# ---------------------------------------------------------------------- #

# Drop constraints #

# Drop table #

DROP TABLE `OACCDB`.`OAC_Domain`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_ResourceClassPermission"                        #
# ---------------------------------------------------------------------- #

# Drop constraints #

# Drop table #

DROP TABLE `OACCDB`.`OAC_ResourceClassPermission`;

# ---------------------------------------------------------------------- #
# Drop table "OACCDB.OAC_ResourceClass"                                  #
# ---------------------------------------------------------------------- #

# Drop constraints #

# Drop table #

DROP TABLE `OACCDB`.`OAC_ResourceClass`;
