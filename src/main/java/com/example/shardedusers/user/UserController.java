package com.example.shardedusers.user;

import com.example.shardedusers.user.dto.CreateUserRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.net.URI;
import java.util.Optional;

@RestController
public class UserController {

  private final UserRepo repo;

  public UserController(UserRepo repo) {
    this.repo = repo;
  }

  @GetMapping("/health")
  public String health() { return "ok"; }

  @PostMapping("/users")
  public ResponseEntity<?> create(@Valid @RequestBody CreateUserRequest req) {
    User u = new User();
    u.setEmail(req.email());
    u.setName(req.name());
    User saved = repo.save(u);
    return ResponseEntity.created(URI.create("/users/" + saved.getId())).body(saved);
  }

  @GetMapping("/users/{id}")
  public ResponseEntity<?> getById(@PathVariable long id) {
    return repo.findById(id)
        .<ResponseEntity<?>>map(ResponseEntity::ok)
        .orElseGet(() -> ResponseEntity.notFound().build());
  }

}
