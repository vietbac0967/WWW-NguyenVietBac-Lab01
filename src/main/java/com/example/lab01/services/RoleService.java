package com.example.lab01.services;

import com.example.lab01.entities.Role;
import com.example.lab01.repositories.RoleRepository;

import java.util.Optional;

public class RoleService {
    private final RoleRepository roleRepository;

    public RoleService(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    public boolean insertRole(Role role) {
        return roleRepository.insertRole(role);
    }

    public boolean deleteRole(String roleId) {
        return roleRepository.deleteRole(roleId);
    }
    public Optional<Role> getRoleByRoleId(String roleId){
        return  roleRepository.getRoleByRoleId(roleId);
    }

    public boolean updateRole(Role role) {
        return roleRepository.updateRole(role);
    }

    public Optional<Role> getRoleByAccountId(String id) {
        return roleRepository.getRoleByAccountId(id);
    }

}
