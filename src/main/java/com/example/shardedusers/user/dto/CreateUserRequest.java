package com.example.shardedusers.user.dto;


import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

public record CreateUserRequest(
  @NotBlank @Email String email,
  @NotBlank String name
) {}
