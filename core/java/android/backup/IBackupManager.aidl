/*
 * Copyright (C) 2009 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.backup;

/**
 * Direct interface to the Backup Manager Service that applications invoke on.  The only
 * operation currently needed is a simple notification that the app has made changes to
 * data it wishes to back up, so the system should run a backup pass.
 *
 * Apps will use the {@link android.backup.BackupManager} class rather than going through
 * this Binder interface directly.
 * 
 * {@hide}
 */
interface IBackupManager {
    /**
     * Tell the system service that the caller has made changes to its
     * data, and therefore needs to undergo an incremental backup pass.
     */
    oneway void dataChanged(String packageName);

    /**
     * Schedule a full backup of the given package.
     * !!! TODO: protect with a signature-or-system permission?
     */
    oneway void scheduleFullBackup(String packageName);
}