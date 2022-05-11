// Copyright Project Harbor Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
import { NgModule } from '@angular/core';
import { SharedModule } from '../../../shared/shared.module';
import { UserComponent } from './user.component';
import { NewUserModalComponent } from './new-user-modal.component';
import { ChangePasswordComponent } from "./change-password/change-password.component";
import { RouterModule, Routes } from "@angular/router";

const routes: Routes = [
  {
    path: '',
    component: UserComponent
  }
];
@NgModule({
  imports: [
    SharedModule,
    RouterModule.forChild(routes)
  ],
  declarations: [
    UserComponent,
    ChangePasswordComponent,
    NewUserModalComponent
  ],
  exports: [
    UserComponent
  ],
})
export class UserModule {

}
