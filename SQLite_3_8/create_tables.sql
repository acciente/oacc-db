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

/* ---------------------------------------------------------------------- */
/* Script generated with: DeZign for Databases V7.3.4                     */
/* Target DBMS:           SQLite 3                                        */
/* Project file:          oacc-schema-design.dez                          */
/* Project name:          OACC                                            */
/* Author:                Adinath Raveendra Raj                           */
/* Script type:           Database creation script                        */
/* Created on:            2015-11-02 14:58                                */
/* ---------------------------------------------------------------------- */


/* ---------------------------------------------------------------------- */
/* Tables                                                                 */
/* ---------------------------------------------------------------------- */

/* ---------------------------------------------------------------------- */
/* Add table "OAC_ResourceClass"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_ResourceClass" (
    "ResourceClassID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ResourceClassName" TEXT NOT NULL,
    "IsAuthenticatable" INTEGER NOT NULL,
    "IsUnauthenticatedCreateAllowed" INTEGER NOT NULL
);

CREATE INDEX "IX_RC_ResourceClassName" ON "OAC_ResourceClass" ("ResourceClassName");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_ResourceClassPermission"                                */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_ResourceClassPermission" (
    "ResourceClassID" INTEGER NOT NULL,
    "PermissionID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "PermissionName" TEXT NOT NULL,
    CONSTRAINT "PK_RCP" UNIQUE ("ResourceClassID", "PermissionID"),
    FOREIGN KEY ("ResourceClassID") REFERENCES "OAC_ResourceClass" ("ResourceClassID") 
);

CREATE INDEX "IX_RCP_ResourceClassID" ON "OAC_ResourceClassPermission" ("ResourceClassID");

CREATE INDEX "IX_RCP_ResClassID_PermName" ON "OAC_ResourceClassPermission" ("ResourceClassID","PermissionName");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Domain"                                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Domain" (
    "DomainID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "DomainName" TEXT NOT NULL,
    "ParentDomainID" INTEGER,
    FOREIGN KEY ("ParentDomainID") REFERENCES "OAC_Domain" ("DomainID") 
);

CREATE INDEX "IX_D_ParentDomainID" ON "OAC_Domain" ("ParentDomainID");

CREATE INDEX "IX_D_DomainName" ON "OAC_Domain" ("DomainName");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Resource"                                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Resource" (
    "ResourceID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ResourceClassID" INTEGER NOT NULL,
    "DomainID" INTEGER NOT NULL,
    FOREIGN KEY ("ResourceClassID") REFERENCES "OAC_ResourceClass" ("ResourceClassID") ,
    FOREIGN KEY ("DomainID") REFERENCES "OAC_Domain" ("DomainID") 
);

CREATE INDEX "IX_R_ResourceClassID" ON "OAC_Resource" ("ResourceClassID");

CREATE INDEX "IX_R_DomainID" ON "OAC_Resource" ("DomainID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResPerm"                                          */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_ResPerm" (
    "AccessorResourceID" INTEGER NOT NULL,
    "AccessedResourceID" INTEGER NOT NULL,
    "ResourceClassID" INTEGER NOT NULL,
    "PermissionID" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrRP" PRIMARY KEY ("AccessorResourceID", "AccessedResourceID", "ResourceClassID", "PermissionID"),
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("AccessedResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("ResourceClassID", "PermissionID") REFERENCES "OAC_ResourceClassPermission" ("ResourceClassID","PermissionID") 
);

CREATE INDEX "IX_GrRP_AccessorResourceID" ON "OAC_Grant_ResPerm" ("AccessorResourceID");

CREATE INDEX "IX_GrRP_AccessedResourceID" ON "OAC_Grant_ResPerm" ("AccessedResourceID");

CREATE INDEX "IX_GrRP_GrantorResourceID" ON "OAC_Grant_ResPerm" ("GrantorResourceID");

CREATE INDEX "IX_GrRP_ResourceClassID" ON "OAC_Grant_ResPerm" ("ResourceClassID","PermissionID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResCrPerm_PostCr"                                 */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_ResCrPerm_PostCr" (
    "AccessorResourceID" INTEGER NOT NULL,
    "AccessedDomainID" INTEGER NOT NULL,
    "ResourceClassID" INTEGER NOT NULL,
    "PostCreatePermissionID" INTEGER NOT NULL,
    "PostCreateIsWithGrant" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrRCrPPoCr" PRIMARY KEY ("AccessorResourceID", "AccessedDomainID", "ResourceClassID", "PostCreatePermissionID"),
    FOREIGN KEY ("ResourceClassID", "PostCreatePermissionID") REFERENCES "OAC_ResourceClassPermission" ("ResourceClassID","PermissionID") ,
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("AccessedDomainID") REFERENCES "OAC_Domain" ("DomainID") 
);

CREATE INDEX "IX_GrRCrPPoCr_ResClassID" ON "OAC_Grant_ResCrPerm_PostCr" ("ResourceClassID","PostCreatePermissionID");

CREATE INDEX "IX_GrRCrPPoCr_AccessorResID" ON "OAC_Grant_ResCrPerm_PostCr" ("AccessorResourceID");

CREATE INDEX "IX_GrRCrPPoCr_GrantorResID" ON "OAC_Grant_ResCrPerm_PostCr" ("GrantorResourceID");

CREATE INDEX "IX_GrRCrPPoCr_AccessedDomainID" ON "OAC_Grant_ResCrPerm_PostCr" ("AccessedDomainID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_DomPerm_Sys"                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_DomPerm_Sys" (
    "AccessorResourceID" INTEGER NOT NULL,
    "AccessedDomainID" INTEGER NOT NULL,
    "SysPermissionID" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrDPSys" PRIMARY KEY ("AccessorResourceID", "AccessedDomainID", "SysPermissionID"),
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("AccessedDomainID") REFERENCES "OAC_Domain" ("DomainID") 
);

CREATE INDEX "IX_GrDPSys_AccessorResourceID" ON "OAC_Grant_DomPerm_Sys" ("AccessorResourceID");

CREATE INDEX "IX_GrDPSys_GrantorResourceID" ON "OAC_Grant_DomPerm_Sys" ("GrantorResourceID");

CREATE INDEX "IX_GrDPSys_AccessedDomainID" ON "OAC_Grant_DomPerm_Sys" ("AccessedDomainID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_DomCrPerm_PostCr_Sys"                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_DomCrPerm_PostCr_Sys" (
    "AccessorResourceID" INTEGER NOT NULL,
    "PostCreateSysPermissionID" INTEGER NOT NULL,
    "PostCreateIsWithGrant" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrDCrPPoCrSys" PRIMARY KEY ("AccessorResourceID", "PostCreateSysPermissionID"),
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") 
);

CREATE INDEX "IX_GrDCrPPoCrSys_AccessorResID" ON "OAC_Grant_DomCrPerm_PostCr_Sys" ("AccessorResourceID");

CREATE INDEX "IX_GrDCrPPoCrSys_GrantorResID" ON "OAC_Grant_DomCrPerm_PostCr_Sys" ("GrantorResourceID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResPerm_Sys"                                      */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_ResPerm_Sys" (
    "AccessorResourceID" INTEGER NOT NULL,
    "AccessedResourceID" INTEGER NOT NULL,
    "ResourceClassID" INTEGER NOT NULL,
    "SysPermissionID" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrRPSys" PRIMARY KEY ("AccessorResourceID", "AccessedResourceID", "ResourceClassID", "SysPermissionID"),
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("AccessedResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("ResourceClassID") REFERENCES "OAC_ResourceClass" ("ResourceClassID") 
);

CREATE INDEX "IX_GrRPSys_AccessorResourceID" ON "OAC_Grant_ResPerm_Sys" ("AccessorResourceID");

CREATE INDEX "IX_GrRPSys_AccessedResourceID" ON "OAC_Grant_ResPerm_Sys" ("AccessedResourceID");

CREATE INDEX "IX_GrRPSys_GrantorResourceID" ON "OAC_Grant_ResPerm_Sys" ("GrantorResourceID");

CREATE INDEX "IX_GrRPSys_ResourceClassID" ON "OAC_Grant_ResPerm_Sys" ("ResourceClassID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResCrPerm_PostCr_Sys"                             */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_ResCrPerm_PostCr_Sys" (
    "AccessorResourceID" INTEGER NOT NULL,
    "AccessedDomainID" INTEGER NOT NULL,
    "ResourceClassID" INTEGER NOT NULL,
    "PostCreateSysPermissionID" INTEGER NOT NULL,
    "PostCreateIsWithGrant" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrRCrPPoCrSys" PRIMARY KEY ("AccessorResourceID", "AccessedDomainID", "ResourceClassID", "PostCreateSysPermissionID"),
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("ResourceClassID") REFERENCES "OAC_ResourceClass" ("ResourceClassID") ,
    FOREIGN KEY ("AccessedDomainID") REFERENCES "OAC_Domain" ("DomainID") 
);

CREATE INDEX "IX_GrRCrPPoCrSys_AccessorResID" ON "OAC_Grant_ResCrPerm_PostCr_Sys" ("AccessorResourceID");

CREATE INDEX "IX_GrRCrPPoCrSys_GrantorResID" ON "OAC_Grant_ResCrPerm_PostCr_Sys" ("GrantorResourceID");

CREATE INDEX "IX_GrRCrPPoCrSys_ResClassID" ON "OAC_Grant_ResCrPerm_PostCr_Sys" ("ResourceClassID");

CREATE INDEX "IX_GrRCrPPoCrSys_AccessedDomID" ON "OAC_Grant_ResCrPerm_PostCr_Sys" ("AccessedDomainID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_Global_ResPerm"                                   */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_Global_ResPerm" (
    "AccessorResourceID" INTEGER NOT NULL,
    "AccessedDomainID" INTEGER NOT NULL,
    "ResourceClassID" INTEGER NOT NULL,
    "PermissionID" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrGbRP" PRIMARY KEY ("AccessorResourceID", "AccessedDomainID", "ResourceClassID", "PermissionID"),
    FOREIGN KEY ("ResourceClassID", "PermissionID") REFERENCES "OAC_ResourceClassPermission" ("ResourceClassID","PermissionID") ,
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("AccessedDomainID") REFERENCES "OAC_Domain" ("DomainID") 
);

CREATE INDEX "IX_GrGbRP_ResourceClassID" ON "OAC_Grant_Global_ResPerm" ("ResourceClassID","PermissionID");

CREATE INDEX "IX_GrGbRP_AccessorResourceID" ON "OAC_Grant_Global_ResPerm" ("AccessorResourceID");

CREATE INDEX "IX_GrGbRP_GrantorResourceID" ON "OAC_Grant_Global_ResPerm" ("GrantorResourceID");

CREATE INDEX "IX_GrGbRP_AccessedDomainID" ON "OAC_Grant_Global_ResPerm" ("AccessedDomainID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_Global_ResPerm_Sys"                               */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_Global_ResPerm_Sys" (
    "AccessorResourceID" INTEGER NOT NULL,
    "AccessedDomainID" INTEGER NOT NULL,
    "ResourceClassID" INTEGER NOT NULL,
    "SysPermissionID" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrGbRPSys" PRIMARY KEY ("AccessorResourceID", "AccessedDomainID", "ResourceClassID", "SysPermissionID"),
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("AccessedDomainID") REFERENCES "OAC_Domain" ("DomainID") ,
    FOREIGN KEY ("ResourceClassID") REFERENCES "OAC_ResourceClass" ("ResourceClassID") 
);

CREATE INDEX "IX_GrGbRPSys_AccessorResID" ON "OAC_Grant_Global_ResPerm_Sys" ("AccessorResourceID");

CREATE INDEX "IX_GrGbRPSys_GrantorResourceID" ON "OAC_Grant_Global_ResPerm_Sys" ("GrantorResourceID");

CREATE INDEX "IX_GrGbRPSys_AccessedDomainID" ON "OAC_Grant_Global_ResPerm_Sys" ("AccessedDomainID");

CREATE INDEX "IX_GrGbRPSys_ResClassID" ON "OAC_Grant_Global_ResPerm_Sys" ("ResourceClassID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_ResCrPerm_Sys"                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_ResCrPerm_Sys" (
    "AccessorResourceID" INTEGER NOT NULL,
    "AccessedDomainID" INTEGER NOT NULL,
    "ResourceClassID" INTEGER NOT NULL,
    "SysPermissionID" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrRCrPSys" PRIMARY KEY ("AccessorResourceID", "AccessedDomainID", "ResourceClassID", "SysPermissionID"),
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("AccessedDomainID") REFERENCES "OAC_Domain" ("DomainID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") 
);

CREATE INDEX "IX_GrRCrPSys_AccessorResID" ON "OAC_Grant_ResCrPerm_Sys" ("AccessorResourceID");

CREATE INDEX "IX_GrRCrPSys_GrantorResID" ON "OAC_Grant_ResCrPerm_Sys" ("GrantorResourceID");

CREATE INDEX "IX_GrRCrPSys_ResClassID" ON "OAC_Grant_ResCrPerm_Sys" ("ResourceClassID");

CREATE INDEX "IX_GrRCrPSys_AccessedDomID" ON "OAC_Grant_ResCrPerm_Sys" ("AccessedDomainID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_Grant_DomCrPerm_Sys"                                    */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_Grant_DomCrPerm_Sys" (
    "AccessorResourceID" INTEGER NOT NULL,
    "SysPermissionID" INTEGER NOT NULL,
    "IsWithGrant" INTEGER NOT NULL,
    "GrantorResourceID" INTEGER NOT NULL,
    CONSTRAINT "PK_GrDCrPSys" PRIMARY KEY ("AccessorResourceID", "SysPermissionID"),
    FOREIGN KEY ("AccessorResourceID") REFERENCES "OAC_Resource" ("ResourceID") ,
    FOREIGN KEY ("GrantorResourceID") REFERENCES "OAC_Resource" ("ResourceID") 
);

CREATE INDEX "IX_GrDCrPSys_AccessorResID" ON "OAC_Grant_DomCrPerm_Sys" ("AccessorResourceID");

CREATE INDEX "IX_GrDCrPSys_GrantorResID" ON "OAC_Grant_DomCrPerm_Sys" ("GrantorResourceID");

/* ---------------------------------------------------------------------- */
/* Add table "OAC_ResourcePassword"                                       */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_ResourcePassword" (
    "ResourceID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "Password" TEXT NOT NULL,
    FOREIGN KEY ("ResourceID") REFERENCES "OAC_Resource" ("ResourceID") 
);

/* ---------------------------------------------------------------------- */
/* Add table "OAC_ResourceExternalID"                                     */
/* ---------------------------------------------------------------------- */

CREATE TABLE "OAC_ResourceExternalID" (
    "ResourceID" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "ExternalID" TEXT NOT NULL,
    CONSTRAINT "UX_ExternalID" UNIQUE ("ExternalID"),
    FOREIGN KEY ("ResourceID") REFERENCES "OAC_Resource" ("ResourceID") 
);

CREATE INDEX "IX_RE_ExternalID" ON "OAC_ResourceExternalID" ("ExternalID");

/* ---------------------------------------------------------------------- */
/* Foreign key constraints                                                */
/* ---------------------------------------------------------------------- */
