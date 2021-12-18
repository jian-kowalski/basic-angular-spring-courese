import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { first } from 'rxjs';
import { environment } from './../../../environments/environment';
import { Course } from './../model/course';

@Injectable({
  providedIn: 'root',
})
export class CoursesService {
  private getHostURL(): string {
    return environment.apiCourses;
  }
  constructor(private httpClient: HttpClient) {}

  list() {
    return this.httpClient.get<Course[]>(this.getHostURL()).pipe(first());
  }
}
