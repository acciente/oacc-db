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
# Script type:           Database creation script                        #
# Created on:            2015-11-02 16:25                                #
# ---------------------------------------------------------------------- #


# ---------------------------------------------------------------------- #
# Tables                                                                 #
# ---------------------------------------------------------------------- #

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_ResourceClass"                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_ResourceClass` (
    `ResourceClassID` BIGINT NOT NULL AUTO_INCREMENT,
    `ResourceClassName` VARCHAR(128) NOT NULL,
    `IsAuthenticatable` SMALLINT NOT NULL,
    `IsUnauthenticatedCreateAllowed` SMALLINT NOT NULL,
    CONSTRAINT `PK_RC` PRIMARY KEY (`ResourceClassID`)
);

CREATE INDEX `IX_RC_ResourceClassName` ON `OACCDB`.`OAC_ResourceClass` (`ResourceClassName`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_ResourceClassPermission"                         #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_ResourceClassPermission` (
    `ResourceClassID` BIGINT NOT NULL,
    `PermissionID` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `PermissionName` VARCHAR(64) NOT NULL,
    CONSTRAINT `PK_RCP` UNIQUE (`ResourceClassID`, `PermissionID`)
);

CREATE INDEX `IX_RCP_ResourceClassID` ON `OACCDB`.`OAC_ResourceClassPermission` (`ResourceClassID`);

CREATE INDEX `IX_RCP_ResClassID_PermName` ON `OACCDB`.`OAC_ResourceClassPermission` (`ResourceClassID`,`PermissionName`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Domain"                                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Domain` (
    `DomainID` BIGINT NOT NULL AUTO_INCREMENT,
    `DomainName` VARCHAR(64) NOT NULL,
    `ParentDomainID` BIGINT,
    CONSTRAINT `PK_D` PRIMARY KEY (`DomainID`)
);

CREATE INDEX `IX_D_ParentDomainID` ON `OACCDB`.`OAC_Domain` (`ParentDomainID`);

CREATE INDEX `IX_D_DomainName` ON `OACCDB`.`OAC_Domain` (`DomainName`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Resource"                                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Resource` (
    `ResourceID` BIGINT NOT NULL AUTO_INCREMENT,
    `ResourceClassID` BIGINT NOT NULL,
    `DomainID` BIGINT NOT NULL,
    CONSTRAINT `PK_R` PRIMARY KEY (`ResourceID`)
);

CREATE INDEX `IX_R_ResourceClassID` ON `OACCDB`.`OAC_Resource` (`ResourceClassID`);

CREATE INDEX `IX_R_DomainID` ON `OACCDB`.`OAC_Resource` (`DomainID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_ResPerm"                                   #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_ResPerm` (
    `AccessorResourceID` BIGINT NOT NULL,
    `AccessedResourceID` BIGINT NOT NULL,
    `ResourceClassID` BIGINT NOT NULL,
    `PermissionID` BIGINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrRP` PRIMARY KEY (`AccessorResourceID`, `AccessedResourceID`, `ResourceClassID`, `PermissionID`)
);

CREATE INDEX `IX_GrRP_AccessorResourceID` ON `OACCDB`.`OAC_Grant_ResPerm` (`AccessorResourceID`);

CREATE INDEX `IX_GrRP_AccessedResourceID` ON `OACCDB`.`OAC_Grant_ResPerm` (`AccessedResourceID`);

CREATE INDEX `IX_GrRP_GrantorResourceID` ON `OACCDB`.`OAC_Grant_ResPerm` (`GrantorResourceID`);

CREATE INDEX `IX_GrRP_ResourceClassID` ON `OACCDB`.`OAC_Grant_ResPerm` (`ResourceClassID`,`PermissionID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_ResCrPerm_PostCr"                          #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` (
    `AccessorResourceID` BIGINT NOT NULL,
    `AccessedDomainID` BIGINT NOT NULL,
    `ResourceClassID` BIGINT NOT NULL,
    `PostCreatePermissionID` BIGINT NOT NULL,
    `PostCreateIsWithGrant` SMALLINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrRCrPPoCr` PRIMARY KEY (`AccessorResourceID`, `AccessedDomainID`, `ResourceClassID`, `PostCreatePermissionID`)
);

CREATE INDEX `IX_GrRCrPPoCr_ResClassID` ON `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` (`ResourceClassID`,`PostCreatePermissionID`);

CREATE INDEX `IX_GrRCrPPoCr_AccessorResID` ON `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` (`AccessorResourceID`);

CREATE INDEX `IX_GrRCrPPoCr_GrantorResID` ON `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` (`GrantorResourceID`);

CREATE INDEX `IX_GrRCrPPoCr_AccessedDomainID` ON `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` (`AccessedDomainID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_DomPerm_Sys"                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_DomPerm_Sys` (
    `AccessorResourceID` BIGINT NOT NULL,
    `AccessedDomainID` BIGINT NOT NULL,
    `SysPermissionID` BIGINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrDPSys` PRIMARY KEY (`AccessorResourceID`, `AccessedDomainID`, `SysPermissionID`)
);

CREATE INDEX `IX_GrDPSys_AccessorResourceID` ON `OACCDB`.`OAC_Grant_DomPerm_Sys` (`AccessorResourceID`);

CREATE INDEX `IX_GrDPSys_GrantorResourceID` ON `OACCDB`.`OAC_Grant_DomPerm_Sys` (`GrantorResourceID`);

CREATE INDEX `IX_GrDPSys_AccessedDomainID` ON `OACCDB`.`OAC_Grant_DomPerm_Sys` (`AccessedDomainID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_DomCrPerm_PostCr_Sys"                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_DomCrPerm_PostCr_Sys` (
    `AccessorResourceID` BIGINT NOT NULL,
    `PostCreateSysPermissionID` BIGINT NOT NULL,
    `PostCreateIsWithGrant` SMALLINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrDCrPPoCrSys` PRIMARY KEY (`AccessorResourceID`, `PostCreateSysPermissionID`)
);

CREATE INDEX `IX_GrDCrPPoCrSys_AccessorResID` ON `OACCDB`.`OAC_Grant_DomCrPerm_PostCr_Sys` (`AccessorResourceID`);

CREATE INDEX `IX_GrDCrPPoCrSys_GrantorResID` ON `OACCDB`.`OAC_Grant_DomCrPerm_PostCr_Sys` (`GrantorResourceID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_ResPerm_Sys"                               #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` (
    `AccessorResourceID` BIGINT NOT NULL,
    `AccessedResourceID` BIGINT NOT NULL,
    `ResourceClassID` BIGINT NOT NULL,
    `SysPermissionID` BIGINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrRPSys` PRIMARY KEY (`AccessorResourceID`, `AccessedResourceID`, `ResourceClassID`, `SysPermissionID`)
);

CREATE INDEX `IX_GrRPSys_AccessorResourceID` ON `OACCDB`.`OAC_Grant_ResPerm_Sys` (`AccessorResourceID`);

CREATE INDEX `IX_GrRPSys_AccessedResourceID` ON `OACCDB`.`OAC_Grant_ResPerm_Sys` (`AccessedResourceID`);

CREATE INDEX `IX_GrRPSys_GrantorResourceID` ON `OACCDB`.`OAC_Grant_ResPerm_Sys` (`GrantorResourceID`);

CREATE INDEX `IX_GrRPSys_ResourceClassID` ON `OACCDB`.`OAC_Grant_ResPerm_Sys` (`ResourceClassID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_ResCrPerm_PostCr_Sys"                      #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` (
    `AccessorResourceID` BIGINT NOT NULL,
    `AccessedDomainID` BIGINT NOT NULL,
    `ResourceClassID` BIGINT NOT NULL,
    `PostCreateSysPermissionID` BIGINT NOT NULL,
    `PostCreateIsWithGrant` SMALLINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrRCrPPoCrSys` PRIMARY KEY (`AccessorResourceID`, `AccessedDomainID`, `ResourceClassID`, `PostCreateSysPermissionID`)
);

CREATE INDEX `IX_GrRCrPPoCrSys_AccessorResID` ON `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` (`AccessorResourceID`);

CREATE INDEX `IX_GrRCrPPoCrSys_GrantorResID` ON `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` (`GrantorResourceID`);

CREATE INDEX `IX_GrRCrPPoCrSys_ResClassID` ON `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` (`ResourceClassID`);

CREATE INDEX `IX_GrRCrPPoCrSys_AccessedDomID` ON `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` (`AccessedDomainID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_Global_ResPerm"                            #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` (
    `AccessorResourceID` BIGINT NOT NULL,
    `AccessedDomainID` BIGINT NOT NULL,
    `ResourceClassID` BIGINT NOT NULL,
    `PermissionID` BIGINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrGbRP` PRIMARY KEY (`AccessorResourceID`, `AccessedDomainID`, `ResourceClassID`, `PermissionID`)
);

CREATE INDEX `IX_GrGbRP_ResourceClassID` ON `OACCDB`.`OAC_Grant_Global_ResPerm` (`ResourceClassID`,`PermissionID`);

CREATE INDEX `IX_GrGbRP_AccessorResourceID` ON `OACCDB`.`OAC_Grant_Global_ResPerm` (`AccessorResourceID`);

CREATE INDEX `IX_GrGbRP_GrantorResourceID` ON `OACCDB`.`OAC_Grant_Global_ResPerm` (`GrantorResourceID`);

CREATE INDEX `IX_GrGbRP_AccessedDomainID` ON `OACCDB`.`OAC_Grant_Global_ResPerm` (`AccessedDomainID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_Global_ResPerm_Sys"                        #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` (
    `AccessorResourceID` BIGINT NOT NULL,
    `AccessedDomainID` BIGINT NOT NULL,
    `ResourceClassID` BIGINT NOT NULL,
    `SysPermissionID` BIGINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrGbRPSys` PRIMARY KEY (`AccessorResourceID`, `AccessedDomainID`, `ResourceClassID`, `SysPermissionID`)
);

CREATE INDEX `IX_GrGbRPSys_AccessorResID` ON `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` (`AccessorResourceID`);

CREATE INDEX `IX_GrGbRPSys_GrantorResourceID` ON `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` (`GrantorResourceID`);

CREATE INDEX `IX_GrGbRPSys_AccessedDomainID` ON `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` (`AccessedDomainID`);

CREATE INDEX `IX_GrGbRPSys_ResClassID` ON `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` (`ResourceClassID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_ResCrPerm_Sys"                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_ResCrPerm_Sys` (
    `AccessorResourceID` BIGINT NOT NULL,
    `AccessedDomainID` BIGINT NOT NULL,
    `ResourceClassID` BIGINT NOT NULL,
    `SysPermissionID` BIGINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrRCrPSys` PRIMARY KEY (`AccessorResourceID`, `AccessedDomainID`, `ResourceClassID`, `SysPermissionID`)
);

CREATE INDEX `IX_GrRCrPSys_AccessorResID` ON `OACCDB`.`OAC_Grant_ResCrPerm_Sys` (`AccessorResourceID`);

CREATE INDEX `IX_GrRCrPSys_GrantorResID` ON `OACCDB`.`OAC_Grant_ResCrPerm_Sys` (`GrantorResourceID`);

CREATE INDEX `IX_GrRCrPSys_ResClassID` ON `OACCDB`.`OAC_Grant_ResCrPerm_Sys` (`ResourceClassID`);

CREATE INDEX `IX_GrRCrPSys_AccessedDomID` ON `OACCDB`.`OAC_Grant_ResCrPerm_Sys` (`AccessedDomainID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_Grant_DomCrPerm_Sys"                             #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_Grant_DomCrPerm_Sys` (
    `AccessorResourceID` BIGINT NOT NULL,
    `SysPermissionID` BIGINT NOT NULL,
    `IsWithGrant` SMALLINT NOT NULL,
    `GrantorResourceID` BIGINT NOT NULL,
    CONSTRAINT `PK_GrDCrPSys` PRIMARY KEY (`AccessorResourceID`, `SysPermissionID`)
);

CREATE INDEX `IX_GrDCrPSys_AccessorResID` ON `OACCDB`.`OAC_Grant_DomCrPerm_Sys` (`AccessorResourceID`);

CREATE INDEX `IX_GrDCrPSys_GrantorResID` ON `OACCDB`.`OAC_Grant_DomCrPerm_Sys` (`GrantorResourceID`);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_ResourcePassword"                                #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_ResourcePassword` (
    `ResourceID` BIGINT NOT NULL,
    `Password` VARCHAR(128) NOT NULL,
    CONSTRAINT `PK_RP` PRIMARY KEY (`ResourceID`)
);

# ---------------------------------------------------------------------- #
# Add table "OACCDB.OAC_ResourceExternalID"                              #
# ---------------------------------------------------------------------- #

CREATE TABLE `OACCDB`.`OAC_ResourceExternalID` (
    `ResourceID` BIGINT NOT NULL,
    `ExternalID` VARCHAR(255) NOT NULL,
    CONSTRAINT `PK_RE` PRIMARY KEY (`ResourceID`),
    CONSTRAINT `UX_ExternalID` UNIQUE (`ExternalID`)
);

CREATE INDEX `IX_RE_ExternalID` ON `OACCDB`.`OAC_ResourceExternalID` (`ExternalID`);

# ---------------------------------------------------------------------- #
# Foreign key constraints                                                #
# ---------------------------------------------------------------------- #

ALTER TABLE `OACCDB`.`OAC_Domain` ADD CONSTRAINT `D_D_ParentDomainID` 
    FOREIGN KEY (`ParentDomainID`) REFERENCES `OACCDB`.`OAC_Domain` (`DomainID`);

ALTER TABLE `OACCDB`.`OAC_ResourceClassPermission` ADD CONSTRAINT `RCP_RC_ResourceClassID` 
    FOREIGN KEY (`ResourceClassID`) REFERENCES `OACCDB`.`OAC_ResourceClass` (`ResourceClassID`);

ALTER TABLE `OACCDB`.`OAC_Resource` ADD CONSTRAINT `R_RC_ResourceClassID` 
    FOREIGN KEY (`ResourceClassID`) REFERENCES `OACCDB`.`OAC_ResourceClass` (`ResourceClassID`);

ALTER TABLE `OACCDB`.`OAC_Resource` ADD CONSTRAINT `R_D_DomainID` 
    FOREIGN KEY (`DomainID`) REFERENCES `OACCDB`.`OAC_Domain` (`DomainID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm` ADD CONSTRAINT `GrRP_R_AccessorResourceID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm` ADD CONSTRAINT `GrRP_R_AccessedResourceID` 
    FOREIGN KEY (`AccessedResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm` ADD CONSTRAINT `GrRP_R_GrantorResourceID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm` ADD CONSTRAINT `GrRP_RCP_ResourceClassID` 
    FOREIGN KEY (`ResourceClassID`, `PermissionID`) REFERENCES `OACCDB`.`OAC_ResourceClassPermission` (`ResourceClassID`,`PermissionID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` ADD CONSTRAINT `GrRCrPPoCr_RCP_ResClassID` 
    FOREIGN KEY (`ResourceClassID`, `PostCreatePermissionID`) REFERENCES `OACCDB`.`OAC_ResourceClassPermission` (`ResourceClassID`,`PermissionID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` ADD CONSTRAINT `GrRCrPPoCr_R_AccessorResID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` ADD CONSTRAINT `GrRCrPPoCr_R_GrantorResID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr` ADD CONSTRAINT `GrRCrPPoCr_D_AccessedDomainID` 
    FOREIGN KEY (`AccessedDomainID`) REFERENCES `OACCDB`.`OAC_Domain` (`DomainID`);

ALTER TABLE `OACCDB`.`OAC_Grant_DomPerm_Sys` ADD CONSTRAINT `GrDPSys_R_AccessorResourceID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_DomPerm_Sys` ADD CONSTRAINT `GrDPSys_R_GrantorResourceID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_DomPerm_Sys` ADD CONSTRAINT `GrDPSys_D_AccessedDomID` 
    FOREIGN KEY (`AccessedDomainID`) REFERENCES `OACCDB`.`OAC_Domain` (`DomainID`);

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_PostCr_Sys` ADD CONSTRAINT `GrDCrPPoCrSys_R_AccessorResID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_PostCr_Sys` ADD CONSTRAINT `GrDCrPPoCrSys_R_GrantorResID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` ADD CONSTRAINT `GrRPSys_R_AccessorResourceID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` ADD CONSTRAINT `GrRPSys_R_AccessedResourceID` 
    FOREIGN KEY (`AccessedResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` ADD CONSTRAINT `GrRPSys_R_GrantorResourceID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResPerm_Sys` ADD CONSTRAINT `GrRPSys_RC_ResourceClassID` 
    FOREIGN KEY (`ResourceClassID`) REFERENCES `OACCDB`.`OAC_ResourceClass` (`ResourceClassID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` ADD CONSTRAINT `GrRCrPPoCrSys_R_AccessorResID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` ADD CONSTRAINT `GrRCrPPoCrSys_R_GrantorResID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` ADD CONSTRAINT `GrRCrPPoCrSys_RC_ResClassID` 
    FOREIGN KEY (`ResourceClassID`) REFERENCES `OACCDB`.`OAC_ResourceClass` (`ResourceClassID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_PostCr_Sys` ADD CONSTRAINT `GrRCrPPoCrSys_D_AccessedDomID` 
    FOREIGN KEY (`AccessedDomainID`) REFERENCES `OACCDB`.`OAC_Domain` (`DomainID`);

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` ADD CONSTRAINT `GrGbRP_RCP_ResClassID` 
    FOREIGN KEY (`ResourceClassID`, `PermissionID`) REFERENCES `OACCDB`.`OAC_ResourceClassPermission` (`ResourceClassID`,`PermissionID`);

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` ADD CONSTRAINT `GrGbRP_R_AccessorResourceID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` ADD CONSTRAINT `GrGbRP_R_GrantorResourceID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm` ADD CONSTRAINT `GrGbRP_D_AccessedDomainID` 
    FOREIGN KEY (`AccessedDomainID`) REFERENCES `OACCDB`.`OAC_Domain` (`DomainID`);

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` ADD CONSTRAINT `GrGbRPSys_R_AccessorResourceID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` ADD CONSTRAINT `GrGbRPSys_R_GrantorResourceID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` ADD CONSTRAINT `GrGbRPSys_D_AccessedDomID` 
    FOREIGN KEY (`AccessedDomainID`) REFERENCES `OACCDB`.`OAC_Domain` (`DomainID`);

ALTER TABLE `OACCDB`.`OAC_Grant_Global_ResPerm_Sys` ADD CONSTRAINT `GrGbRPSys_RC_ResClassID` 
    FOREIGN KEY (`ResourceClassID`) REFERENCES `OACCDB`.`OAC_ResourceClass` (`ResourceClassID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_Sys` ADD CONSTRAINT `GrRCrPSys_R_AccessorResourceID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_Sys` ADD CONSTRAINT `GrRCrPSys_D_AccessedDomainID` 
    FOREIGN KEY (`AccessedDomainID`) REFERENCES `OACCDB`.`OAC_Domain` (`DomainID`);

ALTER TABLE `OACCDB`.`OAC_Grant_ResCrPerm_Sys` ADD CONSTRAINT `GrRCrPSys_R_GrantorResourceID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_Sys` ADD CONSTRAINT `GrDCrPSys_R_AccessorResourceID` 
    FOREIGN KEY (`AccessorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_Grant_DomCrPerm_Sys` ADD CONSTRAINT `GrDCrPSys_R_GrantorResourceID` 
    FOREIGN KEY (`GrantorResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_ResourcePassword` ADD CONSTRAINT `RP_R_ResourceID` 
    FOREIGN KEY (`ResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);

ALTER TABLE `OACCDB`.`OAC_ResourceExternalID` ADD CONSTRAINT `RE_R_ResourceID` 
    FOREIGN KEY (`ResourceID`) REFERENCES `OACCDB`.`OAC_Resource` (`ResourceID`);
